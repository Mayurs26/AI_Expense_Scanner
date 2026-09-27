import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ai_expense_scanner/core/constants/app_colors.dart';
import 'package:ai_expense_scanner/core/constants/app_sizes.dart';
import 'package:ai_expense_scanner/features/ai_assistant/domain/services/gemini_service.dart';

class AiChatScreen extends ConsumerStatefulWidget {
  const AiChatScreen({super.key});

  @override
  ConsumerState<AiChatScreen> createState() => _AiChatScreenState();
}

class _AiChatScreenState extends ConsumerState<AiChatScreen> {
  final _messageCtrl = TextEditingController();
  final ScrollController _scrollCtrl = ScrollController();
  bool _isTyping = false;
  final List<Map<String, dynamic>> _messages = [
    {
      'isUser': false,
      'text':
          'Hi there! 👋 I am your Gemini-powered financial assistant. Ask me anything about your spending, budget, or trends!',
    }
  ];

  static const _suggestedPrompts = [
    '💰 How much did I spend this month?',
    '📊 Show my top spending categories',
    '💡 Where can I save money?',
    '⚠️ Am I over budget?',
    '📉 Compare this month vs last month',
  ];

  @override
  void dispose() {
    _messageCtrl.dispose();
    _scrollCtrl.dispose();
    super.dispose();
  }

  Future<void> _sendMessage(String text) async {
    if (text.trim().isEmpty) return;

    setState(() {
      _messages.add({'isUser': true, 'text': text.trim()});
      _isTyping = true;
    });

    _messageCtrl.clear();
    _scrollToBottom();

    final responseText =
        await ref.read(geminiServiceProvider).sendMessage(text);

    if (!mounted) return;

    setState(() {
      _isTyping = false;
      _messages.add({
        'isUser': false,
        'text': responseText,
      });
    });
    _scrollToBottom();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollCtrl.hasClients) {
        _scrollCtrl.animateTo(
          _scrollCtrl.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gemini Assistant'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Suggested Prompts (Horizontal Scroll to avoid overflow)
            SizedBox(
              height: 50,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(
                    horizontal: AppSizes.pagePadding),
                itemCount: _suggestedPrompts.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(width: AppSizes.sm),
                itemBuilder: (context, index) {
                  return ActionChip(
                    label: Text(
                      _suggestedPrompts[index],
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onPressed: () => _sendMessage(_suggestedPrompts[index]),
                    backgroundColor: const Color(0xFF1A2235), // Dark Navy
                    side: BorderSide(
                      color: AppColors.accent.withValues(alpha: 0.35),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  );
                },
              ),
            ),

            // Chat Messages
            Expanded(
              child: ListView.builder(
                controller: _scrollCtrl,
                padding: const EdgeInsets.all(AppSizes.pagePadding),
                itemCount: _messages.length + (_isTyping ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index == _messages.length) {
                    return _buildTypingIndicator();
                  }

                  final msg = _messages[index];
                  final isUser = msg['isUser'] as bool;
                  return _buildMessageBubble(
                      msg['text'] as String, isUser, theme);
                },
              ),
            ),

            // Input Area
            Container(
              padding: const EdgeInsets.all(AppSizes.sm),
              decoration: BoxDecoration(
                color: theme.scaffoldBackgroundColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 10,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _messageCtrl,
                      decoration: const InputDecoration(
                        hintText: 'Ask Gemini...',
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: AppSizes.md,
                          vertical: AppSizes.sm,
                        ),
                      ),
                      onSubmitted: _sendMessage,
                    ),
                  ),
                  const SizedBox(width: AppSizes.sm),
                  Container(
                    decoration: const BoxDecoration(
                      color: AppColors.accent,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.send_rounded, color: Colors.white),
                      onPressed: () => _sendMessage(_messageCtrl.text),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageBubble(String text, bool isUser, ThemeData theme) {
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: AppSizes.md),
        padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.lg, vertical: AppSizes.md),
        decoration: BoxDecoration(
          color: isUser ? AppColors.accent : const Color(0xFF1A2235),
          borderRadius: BorderRadius.circular(AppSizes.radiusLg).copyWith(
            bottomRight:
                isUser ? Radius.zero : const Radius.circular(AppSizes.radiusLg),
            bottomLeft: !isUser
                ? Radius.zero
                : const Radius.circular(AppSizes.radiusLg),
          ),
        ),
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.75),
        child: isUser
            ? Text(
                text,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: Colors.white,
                ),
              )
            : MarkdownBody(
                data: text,
                styleSheet: MarkdownStyleSheet(
                  p: theme.textTheme.bodyMedium?.copyWith(color: Colors.white),
                  h1: theme.textTheme.titleLarge?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                  h2: theme.textTheme.titleMedium?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                  h3: theme.textTheme.titleSmall?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                  listBullet: theme.textTheme.bodyMedium?.copyWith(color: Colors.white),
                ),
              ),
      ).animate().fadeIn(duration: 300.ms).slideY(begin: 0.1, duration: 300.ms),
    );
  }

  Widget _buildTypingIndicator() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: AppSizes.md),
        padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.lg, vertical: AppSizes.md),
        decoration: BoxDecoration(
          color: AppColors.surfaceVariant,
          borderRadius: BorderRadius.circular(AppSizes.radiusLg).copyWith(
            bottomLeft: Radius.zero,
          ),
        ),
        child: const SizedBox(
          width: 40,
          height: 20,
          child: Center(child: LinearProgressIndicator()),
        ),
      ).animate().fadeIn(),
    );
  }
}
