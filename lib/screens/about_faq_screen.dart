import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../l10n/app_localizations.dart';
import '../widgets/starry_night_background.dart';
import '../constants/text_styles.dart';

class AboutFaqScreen extends StatefulWidget {
  const AboutFaqScreen({super.key});

  @override
  State<AboutFaqScreen> createState() => _AboutFaqScreenState();
}

class _AboutFaqScreenState extends State<AboutFaqScreen> {
  final ScrollController _scrollController = ScrollController();
  final Map<String, GlobalKey> _sectionKeys = {};
  int _selectedIndex = 0;
  bool _isScrollingToSection = false;

  List<String> _getSections(AppLocalizations l10n) {
    return [
      l10n.storySectionTitle,
      l10n.missionSectionTitle,
      l10n.teamSectionTitle,
      l10n.faqSectionTitle,
    ];
  }

  GlobalKey _getSectionKey(String section) {
    return _sectionKeys.putIfAbsent(section, () => GlobalKey());
  }

  void _scrollToSection(int index, List<String> sections) {
    setState(() {
      _selectedIndex = index;
      _isScrollingToSection = true;
    });
    final key = _sectionKeys[sections[index]];
    if (key?.currentContext != null) {
      Scrollable.ensureVisible(
        key!.currentContext!,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      ).then((_) {
        _isScrollingToSection = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isScrollingToSection) return;

    final l10n = AppLocalizations.of(context)!;
    final sections = _getSections(l10n);

    int newIndex = 0;
    double minDistance = double.infinity;

    for (int i = 0; i < sections.length; i++) {
      final key = _sectionKeys[sections[i]];
      if (key?.currentContext != null) {
        final RenderBox? box =
            key!.currentContext!.findRenderObject() as RenderBox?;
        if (box != null) {
          final position = box.localToGlobal(Offset.zero);
          final distance = (position.dy - 100).abs();

          if (distance < minDistance) {
            minDistance = distance;
            newIndex = i;
          }
        }
      }
    }

    if (newIndex != _selectedIndex) {
      setState(() {
        _selectedIndex = newIndex;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final sections = _getSections(l10n);
    final isWideScreen = MediaQuery.of(context).size.width > 900;

    return Scaffold(
      floatingActionButton:
          !isWideScreen ? _buildTableOfContentsFAB(context) : null,
      body: StarryNightBackground(
        showPlanet: false,
        subtle: true,
        child: SafeArea(
          child: Column(
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                iconTheme: IconThemeData(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    if (GoRouter.of(context).canPop()) {
                      context.pop();
                    } else {
                      context.go('/');
                    }
                  },
                ),
                title: Text(
                  l10n.aboutAndFaq,
                  style: AppTextStyles.getH4Style(context),
                ),
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (isWideScreen)
                      Container(
                        width: 280,
                        decoration: BoxDecoration(
                          border: Border(
                            right: BorderSide(
                              color: Theme.of(context)
                                  .colorScheme
                                  .outline
                                  .withValues(alpha: 0.2),
                            ),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                l10n.aboutFaqTableOfContents,
                                style: AppTextStyles.getH5Style(context)
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Expanded(
                              child: ListView.builder(
                                itemCount: sections.length,
                                itemBuilder: (context, index) {
                                  final isSelected = _selectedIndex == index;
                                  return InkWell(
                                    onTap: () =>
                                        _scrollToSection(index, sections),
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(
                                        horizontal: 8.0,
                                        vertical: 2.0,
                                      ),
                                      decoration: BoxDecoration(
                                        color: isSelected
                                            ? Theme.of(context)
                                                .colorScheme
                                                .primaryContainer
                                            : Colors.transparent,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 12.0,
                                          vertical: 8.0,
                                        ),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 6,
                                              height: 6,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: isSelected
                                                    ? Theme.of(context)
                                                        .colorScheme
                                                        .primary
                                                    : Theme.of(context)
                                                        .colorScheme
                                                        .onSurface
                                                        .withValues(alpha: 0.4),
                                              ),
                                            ),
                                            const SizedBox(width: 12),
                                            Expanded(
                                              child: Text(
                                                sections[index],
                                                style:
                                                    AppTextStyles.getCaptionStyle(
                                                  context,
                                                ).copyWith(
                                                  color: isSelected
                                                      ? Theme.of(context)
                                                          .colorScheme
                                                          .primary
                                                      : Theme.of(context)
                                                          .colorScheme
                                                          .onSurface,
                                                  fontWeight: isSelected
                                                      ? FontWeight.w600
                                                      : FontWeight.normal,
                                                ),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    Expanded(
                      child: SingleChildScrollView(
                        controller: _scrollController,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: isWideScreen ? 24.0 : 24.0,
                            vertical: isWideScreen ? 48.0 : 24.0,
                          ),
                          constraints: BoxConstraints(
                            maxWidth: isWideScreen ? 700 : double.infinity,
                          ),
                          child: SelectionArea(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Container(
                                    constraints:
                                        const BoxConstraints(maxWidth: 800),
                                    child: Column(
                                      children: [
                                        Text(
                                          l10n.aboutFaqTitle,
                                          style:
                                              AppTextStyles.getH2Style(context),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 48),
                                _buildSectionWithKey(
                                  sections[0],
                                  _buildStorySection(context),
                                ),
                                _buildSectionWithKey(
                                  sections[1],
                                  _buildMissionSection(context),
                                ),
                                _buildSectionWithKey(
                                  sections[2],
                                  _buildTeamSection(context),
                                ),
                                _buildSectionWithKey(
                                  sections[3],
                                  _buildFaqSection(context),
                                ),
                                const SizedBox(height: 48),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionWithKey(String title, Widget content) {
    return Container(key: _getSectionKey(title), child: content);
  }

  Widget _buildSection(
    BuildContext context,
    IconData icon,
    String title,
    Widget content,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 48.0),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 800),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    icon,
                    color: Theme.of(context).colorScheme.primary,
                    size: 28,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      title,
                      style: AppTextStyles.getH3Style(context),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              content,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStorySection(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return _buildSection(
      context,
      Icons.auto_stories,
      l10n.storySectionTitle,
      Text(
        l10n.storyText,
        style: AppTextStyles.getBodyStyle(context),
      ),
    );
  }

  Widget _buildMissionSection(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return _buildSection(
      context,
      Icons.explore,
      l10n.missionSectionTitle,
      Text(
        l10n.missionText,
        style: AppTextStyles.getBodyStyle(context),
      ),
    );
  }

  Widget _buildTeamSection(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return _buildSection(
      context,
      Icons.people,
      l10n.teamSectionTitle,
      Column(
        children: [
          _buildTeamMemberCard(
            context,
            l10n.teamMemberJacopoTitle,
            l10n.teamMemberJacopoRole,
            l10n.teamMemberJacopoDescription,
          ),
          const SizedBox(height: 16),
          _buildTeamMemberCard(
            context,
            l10n.teamMemberArcangeloTitle,
            l10n.teamMemberArcangeloRole,
            l10n.teamMemberArcangeloDescription,
          ),
          const SizedBox(height: 16),
          _buildTeamMemberCard(
            context,
            l10n.teamMemberCorradoTitle,
            l10n.teamMemberCorradoRole,
            l10n.teamMemberCorradoDescription,
          ),
        ],
      ),
    );
  }

  Widget _buildTeamMemberCard(
    BuildContext context,
    String name,
    String role,
    String description,
  ) {
    return Card(
      elevation: 0,
      color: Theme.of(context).colorScheme.surface.withValues(alpha: 0.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: AppTextStyles.getH4Style(context),
            ),
            const SizedBox(height: 4),
            Text(
              role,
              style: AppTextStyles.getCaptionStyle(context).copyWith(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              description,
              style: AppTextStyles.getBodyStyle(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFaqSection(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return _buildSection(
      context,
      Icons.help_outline,
      l10n.faqSectionTitle,
      Column(
        children: [
          _buildFaqItem(context, l10n.faq1Question, l10n.faq1Answer),
          _buildFaqItem(context, l10n.faq2Question, l10n.faq2Answer),
          _buildFaqItem(context, l10n.faq3Question, l10n.faq3Answer),
          _buildFaqItem(context, l10n.faq4Question, l10n.faq4Answer),
          _buildFaqItem(context, l10n.faq5Question, l10n.faq5Answer),
          _buildFaqItem(context, l10n.faq6Question, l10n.faq6Answer),
          _buildFaqItem(context, l10n.faq7Question, l10n.faq7Answer),
        ],
      ),
    );
  }

  Widget _buildFaqItem(BuildContext context, String question, String answer) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question,
            style: AppTextStyles.getH5Style(context)
                .copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Text(
            answer,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Divider(
            color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
          ),
        ],
      ),
    );
  }

  Widget _buildTableOfContentsFAB(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => _showTableOfContentsBottomSheet(context),
      backgroundColor: Theme.of(context).colorScheme.primary,
      foregroundColor: Theme.of(context).colorScheme.onPrimary,
      child: const Icon(Icons.menu_book),
    );
  }

  void _showTableOfContentsBottomSheet(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final sections = _getSections(l10n);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.5,
        maxChildSize: 0.7,
        minChildSize: 0.3,
        builder: (context, scrollController) => Container(
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 8),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Theme.of(context)
                      .colorScheme
                      .outline
                      .withValues(alpha: 0.4),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.menu_book,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      l10n.aboutFaqTableOfContents,
                      style: AppTextStyles.getH5Style(context)
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.close),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: sections.length,
                  itemBuilder: (context, index) {
                    final isSelected = _selectedIndex == index;
                    return InkWell(
                      onTap: () {
                        _scrollToSection(index, sections);
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 4.0,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? Theme.of(context).colorScheme.primaryContainer
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 12.0,
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 6,
                                height: 6,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: isSelected
                                      ? Theme.of(context).colorScheme.primary
                                      : Theme.of(context)
                                          .colorScheme
                                          .onSurface
                                          .withValues(alpha: 0.4),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  sections[index],
                                  style:
                                      AppTextStyles.getBodyStyle(context).copyWith(
                                    color: isSelected
                                        ? Theme.of(context).colorScheme.primary
                                        : Theme.of(context)
                                            .colorScheme
                                            .onSurface,
                                    fontWeight: isSelected
                                        ? FontWeight.w600
                                        : FontWeight.normal,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
