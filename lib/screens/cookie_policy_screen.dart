import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import '../l10n/app_localizations.dart';
import '../widgets/starry_night_background.dart';
import '../constants/text_styles.dart';

class CookiePolicyScreen extends StatefulWidget {
  const CookiePolicyScreen({super.key});

  @override
  State<CookiePolicyScreen> createState() => _CookiePolicyScreenState();
}

class _CookiePolicyScreenState extends State<CookiePolicyScreen> {
  final ScrollController _scrollController = ScrollController();
  final Map<String, GlobalKey> _sectionKeys = {};
  int _selectedIndex = 0;
  bool _isScrollingToSection = false;

  List<String> _getSections(AppLocalizations l10n) {
    return [
      l10n.whatAreCookiesSection,
      l10n.typesOfCookiesSection,
      l10n.trackingToolsSection,
      l10n.managingCookiesSection,
      l10n.complianceSection,
      l10n.contactForCookiesTitle,
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
        final RenderBox? box = key!.currentContext!.findRenderObject() as RenderBox?;
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
      floatingActionButton: !isWideScreen
          ? _buildTableOfContentsFAB(context)
          : null,
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
                      context.go('/settings');
                    }
                  },
                ),
                title: Text(
                  l10n.cookiePolicyPageTitle,
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
                              color: Theme.of(
                                context,
                              ).colorScheme.outline.withValues(alpha: 0.2),
                            ),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                l10n.summary,
                                style: AppTextStyles.getH5Style(
                                  context,
                                ).copyWith(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Expanded(
                              child: ListView.builder(
                                itemCount: sections.length,
                                itemBuilder: (context, index) {
                                  final isSelected = _selectedIndex == index;
                                  return InkWell(
                                    onTap: () => _scrollToSection(index, sections),
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(
                                        horizontal: 8.0,
                                        vertical: 2.0,
                                      ),
                                      decoration: BoxDecoration(
                                        color: isSelected
                                            ? Theme.of(
                                                context,
                                              ).colorScheme.primaryContainer
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
                                                    ? Theme.of(
                                                        context,
                                                      ).colorScheme.primary
                                                    : Theme.of(context)
                                                          .colorScheme
                                                          .onSurface
                                                          .withValues(
                                                            alpha: 0.4,
                                                          ),
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
                                    constraints: const BoxConstraints(
                                      maxWidth: 800,
                                    ),
                                    child: Column(
                                      children: [
                                        Text(
                                          l10n.cookiePolicyPageTitle,
                                          style: AppTextStyles.getH2Style(
                                            context,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        const SizedBox(height: 16),
                                        Text(
                                          l10n.cookiePolicyWelcomeText,
                                          style:
                                              AppTextStyles.getBodyStyle(
                                                context,
                                              ).copyWith(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onSurface
                                                    .withValues(alpha: 0.7),
                                              ),
                                          textAlign: TextAlign.center,
                                        ),
                                        const SizedBox(height: 12),
                                        Text(
                                          l10n.cookiePolicyLastModified,
                                          style:
                                              AppTextStyles.getCaptionStyle(
                                                context,
                                              ).copyWith(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onSurface
                                                    .withValues(alpha: 0.6),
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                const SizedBox(height: 48),

                                _buildSectionWithKey(
                                  sections[0],
                                  _buildWhatAreCookiesSection(context),
                                ),

                                _buildSectionWithKey(
                                  sections[1],
                                  _buildTypesOfCookiesSection(context),
                                ),

                                _buildSectionWithKey(
                                  sections[2],
                                  _buildTrackingToolsSection(context),
                                ),

                                _buildSectionWithKey(
                                  sections[3],
                                  _buildManagingCookiesSection(context),
                                ),

                                _buildSectionWithKey(
                                  sections[4],
                                  _buildComplianceSection(context),
                                ),

                                _buildSectionWithKey(
                                  sections[5],
                                  _buildContactSection(context),
                                ),

                                const SizedBox(height: 48),

                                _buildFooterSection(context),

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

  Widget _buildWhatAreCookiesSection(BuildContext context) {
    return _buildSection(
      context,
      Icons.help_outline,
      AppLocalizations.of(context)!.whatAreCookiesSection,
      Text(
        AppLocalizations.of(context)!.whatAreCookiesContent,
        style: AppTextStyles.getBodyStyle(context),
      ),
    );
  }

  Widget _buildTypesOfCookiesSection(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return _buildSection(
      context,
      Icons.category,
      l10n.typesOfCookiesSection,
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCookieTypeCard(
            context,
            Icons.security,
            l10n.necessaryCookiesTitle,
            l10n.necessaryCookiesDescription,
            Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(height: 16),
          _buildCookieTypeCard(
            context,
            Icons.analytics,
            l10n.measurementCookiesTitle,
            l10n.measurementCookiesDescription,
            Theme.of(context).colorScheme.secondary,
          ),
        ],
      ),
    );
  }

  Widget _buildCookieTypeCard(
    BuildContext context,
    IconData icon,
    String title,
    String description,
    Color iconColor,
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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: iconColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                icon,
                color: iconColor,
                size: 24,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.getBodyStyle(context).copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: AppTextStyles.getCaptionStyle(context),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTrackingToolsSection(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return _buildSection(
      context,
      Icons.track_changes,
      l10n.trackingToolsSection,
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.trackingToolsIntro,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 24),
          Card(
            elevation: 0,
            color: Theme.of(context).colorScheme.surface,
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
                  Row(
                    children: [
                      Icon(
                        Icons.analytics_outlined,
                        color: Theme.of(context).colorScheme.primary,
                        size: 24,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          l10n.matomoSelfHostedTitle,
                          style: AppTextStyles.getBodyStyle(context).copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    l10n.matomoSelfHostedDescription,
                    style: AppTextStyles.getBodyStyle(context),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    l10n.dataCollectedByMatomo,
                    style: AppTextStyles.getCaptionStyle(context).copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      l10n.usageData,
                      l10n.ipAddress,
                      l10n.trackingTools,
                    ].map((item) => _buildDataChip(context, item)).toList(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildManagingCookiesSection(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return _buildSection(
      context,
      Icons.settings,
      l10n.managingCookiesSection,
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.managingCookiesContent,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 24),
          _buildManagementCard(
            context,
            Icons.web,
            l10n.browserSettingsTitle,
            l10n.browserSettingsContent,
          ),
          const SizedBox(height: 16),
          _buildManagementCard(
            context,
            Icons.block,
            l10n.consequencesOfBlockingTitle,
            l10n.consequencesOfBlockingContent,
          ),
        ],
      ),
    );
  }

  Widget _buildManagementCard(
    BuildContext context,
    IconData icon,
    String title,
    String content,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: Theme.of(context).colorScheme.primary,
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                title,
                style: AppTextStyles.getBodyStyle(context).copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            content,
            style: AppTextStyles.getCaptionStyle(context),
          ),
        ],
      ),
    );
  }

  Widget _buildComplianceSection(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return _buildSection(
      context,
      Icons.verified_user,
      l10n.complianceSection,
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.complianceContent,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.2),
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.flag,
                  color: Theme.of(context).colorScheme.primary,
                  size: 32,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.europeanUnion,
                        style: AppTextStyles.getBodyStyle(context).copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'GDPR Compliant',
                        style: AppTextStyles.getCaptionStyle(context),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactSection(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return _buildSection(
      context,
      Icons.email_outlined,
      l10n.contactForCookiesTitle,
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.contactForCookiesContent,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 24),
          Card(
            elevation: 0,
            color: Theme.of(context).colorScheme.surface,
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
                  Row(
                    children: [
                      Icon(
                        Icons.person,
                        color: Theme.of(context).colorScheme.primary,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        l10n.dataControllerName,
                        style: AppTextStyles.getBodyStyle(context).copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Icon(
                        Icons.email,
                        color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
                        size: 16,
                      ),
                      const SizedBox(width: 8),
                      InkWell(
                        onTap: () => _launchExternalUrl('mailto:contact@astrogods.it'),
                        child: Text(
                          'contact@astrogods.it',
                          style: AppTextStyles.getBodyStyle(context).copyWith(
                            color: Theme.of(context).colorScheme.primary,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: ElevatedButton.icon(
              onPressed: () => _launchExternalUrl('mailto:contact@astrogods.it'),
              icon: const Icon(Icons.email_outlined),
              label: Text(l10n.contactUs),
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooterSection(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 800),
        padding: const EdgeInsets.symmetric(vertical: 24),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
            ),
          ),
        ),
        child: Column(
          children: [
            Text(
              l10n.appTitle,
              style: AppTextStyles.getH4Style(context),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              l10n.dataControllerName,
              style: AppTextStyles.getCaptionStyle(context),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Wrap(
              alignment: WrapAlignment.center,
              children: [
                Text(
                  "${l10n.dataControllerEmailLabel} ",
                  style: AppTextStyles.getCaptionStyle(
                    context,
                  ).copyWith(fontWeight: FontWeight.bold),
                ),
                InkWell(
                  onTap: () => _launchExternalUrl(
                    'mailto:contact@astrogods.it',
                  ),
                  child: Text(
                    'contact@astrogods.it',
                    style: AppTextStyles.getCaptionStyle(context)
                        .copyWith(
                          color: Theme.of(
                            context,
                          ).colorScheme.primary,
                          decoration: TextDecoration.underline,
                        ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDataChip(BuildContext context, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
        ),
      ),
      child: Text(label, style: AppTextStyles.getCaptionStyle(context)),
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
        initialChildSize: 0.6,
        maxChildSize: 0.8,
        minChildSize: 0.3,
        builder: (context, scrollController) => Container(
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 8),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Theme.of(
                    context,
                  ).colorScheme.outline.withValues(alpha: 0.4),
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
                      l10n.summary,
                      style: AppTextStyles.getH5Style(
                        context,
                      ).copyWith(fontWeight: FontWeight.bold),
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
                                      : Theme.of(context).colorScheme.onSurface
                                            .withValues(alpha: 0.4),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  sections[index],
                                  style: AppTextStyles.getBodyStyle(context)
                                      .copyWith(
                                        color: isSelected
                                            ? Theme.of(
                                                context,
                                              ).colorScheme.primary
                                            : Theme.of(
                                                context,
                                              ).colorScheme.onSurface,
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

  Future<void> _launchExternalUrl(String url) async {
    final Uri uri = Uri.parse(url);
    final errorMessage = AppLocalizations.of(context)!.errorOpeningUrl;
    try {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } catch (e) {
      debugPrint('$errorMessage: $e');
    }
  }
}