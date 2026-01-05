import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import '../l10n/app_localizations.dart';
import '../widgets/starry_night_background.dart';
import '../widgets/formatted_markdown_content.dart';
import '../constants/text_styles.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  final ScrollController _scrollController = ScrollController();
  final Map<String, GlobalKey> _sectionKeys = {};
  int _selectedIndex = 0;
  bool _isScrollingToSection = false;

  List<String> _getSections(AppLocalizations l10n) {
    return [
      l10n.summarySection,
      l10n.dataControllerSection,
      l10n.dataTypesSection,
      l10n.processingMethodsSection,
      l10n.purposesSection,
      l10n.processingDetailsSection,
      l10n.cookiePolicySection,
      l10n.euInfoSection,
      l10n.additionalInfoSection,
      l10n.definitionsSection,
      l10n.inCaseOfProblems,
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
        // Reset the flag after scrolling is complete
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
    if (_isScrollingToSection) return; // Don't update while programmatically scrolling

    final l10n = AppLocalizations.of(context)!;
    final sections = _getSections(l10n);
    
    // Find which section is currently visible
    int newIndex = 0;
    double minDistance = double.infinity;
    
    for (int i = 0; i < sections.length; i++) {
      final key = _sectionKeys[sections[i]];
      if (key?.currentContext != null) {
        final RenderBox? box = key!.currentContext!.findRenderObject() as RenderBox?;
        if (box != null) {
          final position = box.localToGlobal(Offset.zero);
          final distance = (position.dy - 100).abs(); // 100px offset for header
          
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
                  l10n.privacyPolicy,
                  style: AppTextStyles.getH4Style(context),
                ),
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Navigation Rail for wide screens
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
                    // Main Content
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
                                // Header
                                Center(
                                  child: Container(
                                    constraints: const BoxConstraints(
                                      maxWidth: 800,
                                    ),
                                    child: Column(
                                      children: [
                                        Text(
                                          l10n.privacyPolicyTitle,
                                          style: AppTextStyles.getH2Style(
                                            context,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        const SizedBox(height: 16),
                                        Text(
                                          l10n.privacyPolicyWelcomeText,
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
                                          l10n.lastModified,
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

                                // Riepilogo Section
                                _buildSectionWithKey(
                                  sections[0], // summarySection
                                  _buildRiepilogoSection(context),
                                ),

                                // Titolare del Trattamento
                                _buildSectionWithKey(
                                  sections[1], // dataControllerSection
                                  _buildSection(
                                    context,
                                    Icons.person,
                                    l10n.dataControllerSection,
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          l10n.dataControllerName,
                                          style: AppTextStyles.getBodyStyle(
                                            context,
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Wrap(
                                          children: [
                                            Text(
                                              l10n.dataControllerEmailLabel,
                                              style:
                                                  AppTextStyles.getBodyStyle(
                                                    context,
                                                  ).copyWith(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                _launchExternalUrl(
                                                  'mailto:${l10n.dataControllerEmail}',
                                                );
                                              },
                                              child: Text(
                                                l10n.dataControllerEmail,
                                                style:
                                                    AppTextStyles.getBodyStyle(
                                                      context,
                                                    ).copyWith(
                                                      color: Theme.of(
                                                        context,
                                                      ).colorScheme.primary,
                                                      decoration: TextDecoration
                                                          .underline,
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                // Tipologie di Dati raccolti
                                _buildSectionWithKey(
                                  sections[2], // dataTypesSection
                                  _buildDataTypesSection(context),
                                ),

                                // Modalità e luogo del trattamento
                                _buildSectionWithKey(
                                  sections[3], // processingMethodsSection
                                  _buildProcessingMethodsSection(context),
                                ),

                                // Finalità del Trattamento
                                _buildSectionWithKey(
                                  sections[4], // purposesSection
                                  _buildPurposesSection(context),
                                ),

                                // Dettagli sul trattamento
                                _buildSectionWithKey(
                                  sections[5], // processingDetailsSection
                                  _buildServiceDetailsSection(context),
                                ),

                                // Cookie Policy
                                _buildSectionWithKey(
                                  sections[6], // cookiePolicySection
                                  _buildCookiePolicySection(context),
                                ),

                                // Ulteriori informazioni UE
                                _buildSectionWithKey(
                                  sections[7], // euInfoSection
                                  _buildEUSection(context),
                                ),

                                // Ulteriori informazioni
                                _buildSectionWithKey(
                                  sections[8], // additionalInfoSection
                                  _buildAdditionalInfoSection(context),
                                ),

                                // Definizioni e riferimenti
                                _buildSectionWithKey(
                                  sections[9], // definitionsSection
                                  _buildDefinitionsSection(context),
                                ),

                                // In case of problems
                                _buildSectionWithKey(
                                  sections[10], // inCaseOfProblems
                                  _buildHelpSection(context),
                                ),

                                const SizedBox(height: 48),

                                // Footer
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

  Widget _buildRiepilogoSection(BuildContext context) {
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
                    Icons.check_circle_outline,
                    color: Theme.of(context).colorScheme.primary,
                    size: 28,
                  ),
                  const SizedBox(width: 12),
                  Text(AppLocalizations.of(context)!.summarySection, style: AppTextStyles.getH3Style(context)),
                ],
              ),
              const SizedBox(height: 24),
              MediaQuery.of(context).size.width > 700
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: _buildSummaryCard(
                            context,
                            Icons.computer,
                            AppLocalizations.of(context)!.dataWeCollectAutomatically,
                            AppLocalizations.of(context)!.dataWeCollectAutomaticallyDesc,
                            [
                              AppLocalizations.of(context)!.usageData,
                              AppLocalizations.of(context)!.ipAddress,
                              AppLocalizations.of(context)!.deviceInformation,
                              AppLocalizations.of(context)!.language,
                              AppLocalizations.of(context)!.trackingTools,
                            ],
                            ['Hetzner', 'GoDaddy', 'Google Fonts'],
                            AppLocalizations.of(context)!.howWeUseThem,
                            [
                              AppLocalizations.of(context)!.registrationAndAuth,
                              AppLocalizations.of(context)!.hostingAndBackend,
                              AppLocalizations.of(context)!.trafficOptimization,
                              AppLocalizations.of(context)!.statistics,
                            ],
                          ),
                        ),
                        const SizedBox(width: 24),
                        Expanded(
                          child: _buildSummaryCard(
                            context,
                            Icons.person_outline,
                            AppLocalizations.of(context)!.dataYouProvide,
                            AppLocalizations.of(context)!.dataYouProvideDesc,
                            [
                              AppLocalizations.of(context)!.name,
                              AppLocalizations.of(context)!.surname,
                              AppLocalizations.of(context)!.email,
                              AppLocalizations.of(context)!.password,
                              AppLocalizations.of(context)!.birthDate,
                              AppLocalizations.of(context)!.birthTime,
                              AppLocalizations.of(context)!.gender,
                              AppLocalizations.of(context)!.billingAddress,
                              AppLocalizations.of(context)!.paymentInformation,
                              AppLocalizations.of(context)!.purchaseHistory,
                            ],
                            ['Stripe', 'Anthropic', 'Google OAuth'],
                            AppLocalizations.of(context)!.howWeUseThem,
                            [
                              AppLocalizations.of(context)!.registrationAndAuth,
                              AppLocalizations.of(context)!.backendApi,
                              AppLocalizations.of(context)!.paymentManagement,
                            ],
                          ),
                        ),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildSummaryCard(
                          context,
                          Icons.computer,
                          AppLocalizations.of(context)!.dataWeCollectAutomatically,
                          AppLocalizations.of(context)!.dataWeCollectAutomaticallyDesc,
                          [
                            AppLocalizations.of(context)!.usageData,
                            AppLocalizations.of(context)!.ipAddress,
                            AppLocalizations.of(context)!.deviceInformation,
                            AppLocalizations.of(context)!.language,
                            AppLocalizations.of(context)!.trackingTools,
                          ],
                          ['Hetzner', 'GoDaddy', 'Google Fonts'],
                          AppLocalizations.of(context)!.howWeUseThem,
                          [
                            AppLocalizations.of(context)!.registrationAndAuth,
                            AppLocalizations.of(context)!.hostingAndBackend,
                            AppLocalizations.of(context)!.trafficOptimization,
                            AppLocalizations.of(context)!.statistics,
                          ],
                        ),
                        const SizedBox(height: 24),
                        _buildSummaryCard(
                          context,
                          Icons.person_outline,
                          AppLocalizations.of(context)!.dataYouProvide,
                          AppLocalizations.of(context)!.dataYouProvideDesc,
                          [
                            AppLocalizations.of(context)!.name,
                            AppLocalizations.of(context)!.surname,
                            AppLocalizations.of(context)!.email,
                            AppLocalizations.of(context)!.password,
                            AppLocalizations.of(context)!.birthDate,
                            AppLocalizations.of(context)!.birthTime,
                            AppLocalizations.of(context)!.gender,
                            AppLocalizations.of(context)!.billingAddress,
                            AppLocalizations.of(context)!.paymentInformation,
                            AppLocalizations.of(context)!.purchaseHistory,
                          ],
                          ['Stripe', 'Anthropic', 'Google OAuth'],
                          AppLocalizations.of(context)!.howWeUseThem,
                          [
                            AppLocalizations.of(context)!.registrationAndAuth,
                            AppLocalizations.of(context)!.backendApi,
                            AppLocalizations.of(context)!.paymentManagement,
                          ],
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSummaryCard(
    BuildContext context,
    IconData icon,
    String title,
    String description,
    List<String> dataItems,
    List<String> thirdParties,
    String usageTitle,
    List<String> usageItems,
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
            Row(
              children: [
                Icon(
                  icon,
                  size: 20,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    title,
                    style: AppTextStyles.getBodyStyle(
                      context,
                    ).copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(description, style: AppTextStyles.getCaptionStyle(context)),
            const SizedBox(height: 16),
            // Data items - show all without abbreviation
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: dataItems.map((item) {
                return Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withValues(alpha: 0.05),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    item,
                    style: AppTextStyles.getCaptionStyle(context),
                  ),
                );
              }).toList(),
            ),
            if (thirdParties.isNotEmpty) ...[
              const SizedBox(height: 16),
              Text(
                AppLocalizations.of(context)!.trustedThirdParties,
                style: AppTextStyles.getCaptionStyle(
                  context,
                ).copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: thirdParties.map((party) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(
                        context,
                      ).colorScheme.primaryContainer.withValues(alpha: 0.3),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.business,
                          size: 14,
                          color: Theme.of(
                            context,
                          ).colorScheme.onSurface.withValues(alpha: 0.6),
                        ),
                        const SizedBox(width: 4),
                        Flexible(
                          child: Text(
                            party,
                            style: AppTextStyles.getCaptionStyle(
                              context,
                            ).copyWith(fontSize: 11),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ],
            const SizedBox(height: 16),
            Text(
              usageTitle,
              style: AppTextStyles.getCaptionStyle(
                context,
              ).copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ...usageItems.map(
              (item) => Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.check,
                      size: 16,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        item,
                        style: AppTextStyles.getCaptionStyle(context),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
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

  Widget _buildDataTypesSection(BuildContext context) {
    return _buildSection(
      context,
      Icons.folder_open,
      AppLocalizations.of(context)!.dataTypesSection,
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.dataTypesIntro,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              AppLocalizations.of(context)!.name,
              AppLocalizations.of(context)!.surname,
              AppLocalizations.of(context)!.email,
              AppLocalizations.of(context)!.password,
              AppLocalizations.of(context)!.birthDate,
              AppLocalizations.of(context)!.birthTime,
              AppLocalizations.of(context)!.gender,
              AppLocalizations.of(context)!.language,
              AppLocalizations.of(context)!.paymentInformation,
              AppLocalizations.of(context)!.billingAddress,
              AppLocalizations.of(context)!.purchaseHistory,
              AppLocalizations.of(context)!.usageData,
              AppLocalizations.of(context)!.communicatedDataDuringService,
              AppLocalizations.of(context)!.ipAddress,
              AppLocalizations.of(context)!.deviceInformation,
              AppLocalizations.of(context)!.trackingTools,
            ].map((label) => _buildDataChip(context, label)).toList(),
          ),
          const SizedBox(height: 24),
          FormattedMarkdownContent(
            content: AppLocalizations.of(context)!.dataTypesDetailedContent,
          ),
        ],
      ),
    );
  }

  Widget _buildProcessingMethodsSection(BuildContext context) {
    return _buildSection(
      context,
      Icons.security,
      AppLocalizations.of(context)!.processingMethodsTitle,
      FormattedMarkdownContent(
        content: AppLocalizations.of(context)!.processingMethodsContent,
      ),
    );
  }

  Widget _buildPurposesSection(BuildContext context) {
    return _buildSection(
      context,
      Icons.check_circle,
      AppLocalizations.of(context)!.purposesSection,
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.purposesIntroText,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          _buildCheckItem(context, AppLocalizations.of(context)!.paymentManagementTitle),
          _buildCheckItem(context, AppLocalizations.of(context)!.hostingBackendTitle),
          _buildCheckItem(context, AppLocalizations.of(context)!.backendApiTitle),
          _buildCheckItem(context, AppLocalizations.of(context)!.authenticationTitle),
          _buildCheckItem(
            context,
            AppLocalizations.of(context)!.trafficOptimizationTitle,
          ),
          _buildCheckItem(context, AppLocalizations.of(context)!.statistics),
          const SizedBox(height: 16),
          Text(
            AppLocalizations.of(context)!.purposesDetailedInfoText,
            style: AppTextStyles.getBodyStyle(context),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceDetailsSection(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 800),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildServiceDetailsHeader(context),

            // Payment Management
            _buildServiceDetailCard(
              context,
              AppLocalizations.of(context)!.paymentManagementTitle,
              AppLocalizations.of(context)!.paymentManagementDescription,
              [
                {
                  'name': 'Stripe',
                  'provider': 'Stripe Technology Europe Ltd',
                  'location': AppLocalizations.of(context)!.europeanUnion,
                  'tags': [
                    AppLocalizations.of(context)!.name,
                    AppLocalizations.of(context)!.surname,
                    AppLocalizations.of(context)!.email,
                    AppLocalizations.of(context)!.billingAddress,
                    AppLocalizations.of(context)!.paymentInformation,
                    AppLocalizations.of(context)!.purchaseHistory,
                  ],
                  'description': AppLocalizations.of(context)!.stripeDescription,
                  'privacyUrl': 'https://stripe.com/privacy',
                },
              ],
            ),

            // Backend Infrastructure
            _buildServiceDetailCard(
              context,
              AppLocalizations.of(context)!.hostingBackendTitle,
              AppLocalizations.of(context)!.hostingBackendDescription,
              [
                {
                  'name': 'Hetzner',
                  'provider': 'Hetzner Online GmbH',
                  'location': AppLocalizations.of(context)!.germany,
                  'tags': [AppLocalizations.of(context)!.communicatedDataDuringService],
                  'description': AppLocalizations.of(context)!.hetznerDescription,
                  'privacyUrl': 'https://www.hetzner.com/legal/privacy-policy',
                },
                {
                  'name': 'GoDaddy Web Hosting',
                  'provider': 'GoDaddy.com, LLC',
                  'location': AppLocalizations.of(context)!.unitedStates,
                  'tags': [AppLocalizations.of(context)!.usageData, AppLocalizations.of(context)!.deviceInformation],
                  'description': AppLocalizations.of(context)!.godaddyDescription,
                  'privacyUrl':
                      'https://www.godaddy.com/legal/agreements/privacy-policy',
                },
              ],
            ),

            // Backend API
            _buildServiceDetailCard(
              context,
              AppLocalizations.of(context)!.backendApiTitle,
              AppLocalizations.of(context)!.backendApiDescription,
              [
                {
                  'name': 'API di Anthropic',
                  'provider': 'Anthropic',
                  'location': AppLocalizations.of(context)!.unitedStates,
                  'tags': [AppLocalizations.of(context)!.name, AppLocalizations.of(context)!.surname, AppLocalizations.of(context)!.gender, AppLocalizations.of(context)!.language],
                  'description': AppLocalizations.of(context)!.anthropicApiDescription,
                  'privacyUrl': 'https://www.anthropic.com/privacy',
                },
              ],
            ),

            // Registration and Authentication
            _buildServiceDetailCard(
              context,
              AppLocalizations.of(context)!.authenticationTitle,
              AppLocalizations.of(context)!.authenticationDescription,
              [
                {
                  'name': 'Google OAuth',
                  'provider': 'Google Ireland Limited',
                  'location': AppLocalizations.of(context)!.ireland,
                  'tags': ['Google profile data'],
                  'description': AppLocalizations.of(context)!.googleOAuthDescription,
                  'privacyUrl': 'https://policies.google.com/privacy',
                },
              ],
            ),

            // Direct Registration
            _buildServiceDetailCard(
              context,
              AppLocalizations.of(context)!.authenticationTitle,
              AppLocalizations.of(context)!.authenticationDescription,
              [
                {
                  'name': AppLocalizations.of(context)!.directRegistration,
                  'provider': 'AstroGods',
                  'location': AppLocalizations.of(context)!.italy,
                  'tags': [
                    AppLocalizations.of(context)!.name,
                    AppLocalizations.of(context)!.surname,
                    AppLocalizations.of(context)!.email,
                    AppLocalizations.of(context)!.password,
                    AppLocalizations.of(context)!.birthDate,
                    AppLocalizations.of(context)!.birthTime,
                    AppLocalizations.of(context)!.gender,
                    AppLocalizations.of(context)!.language,
                  ],
                  'description': AppLocalizations.of(context)!.directRegistrationDescription,
                  'privacyUrl': '',
                },
              ],
            ),

            // Optimization and Traffic Distribution
            _buildServiceDetailCard(
              context,
              AppLocalizations.of(context)!.trafficOptimizationTitle,
              AppLocalizations.of(context)!.trafficOptimizationDescription,
              [
                {
                  'name': 'Google Fonts',
                  'provider': 'Google Ireland Limited',
                  'location': AppLocalizations.of(context)!.ireland,
                  'tags': [AppLocalizations.of(context)!.usageData, AppLocalizations.of(context)!.ipAddress],
                  'description': AppLocalizations.of(context)!.googleFontsDescription,
                  'privacyUrl': 'https://policies.google.com/privacy',
                },
              ],
            ),

            // Statistics
            _buildServiceDetailCard(
              context,
              AppLocalizations.of(context)!.statisticsTitle,
              AppLocalizations.of(context)!.statisticsDescription,
              [
                {
                  'name': 'Matomo (self-hosted)',
                  'provider': 'AstroGods',
                  'location': AppLocalizations.of(context)!.italy,
                  'tags': [
                    AppLocalizations.of(context)!.usageData,
                    AppLocalizations.of(context)!.ipAddress,
                    AppLocalizations.of(context)!.trackingTools,
                  ],
                  'description': AppLocalizations.of(context)!.matomatoDescription,
                  'privacyUrl': '',
                },
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceDetailsHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 48.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.description,
                color: Theme.of(context).colorScheme.primary,
                size: 28,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  AppLocalizations.of(context)!.processingDetailsSection,
                  style: AppTextStyles.getH3Style(context),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildServiceDetailCard(
    BuildContext context,
    String title,
    String description,
    List<Map<String, dynamic>> services,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTextStyles.getH4Style(context)),
          const SizedBox(height: 16),
          Text(description, style: AppTextStyles.getBodyStyle(context)),
          const SizedBox(height: 16),
          ...services.map((service) => _buildServiceItem(context, service)),
        ],
      ),
    );
  }

  Widget _buildServiceItem(BuildContext context, Map<String, dynamic> service) {
    return Card(
      elevation: 0,
      color: Theme.of(context).colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
        ),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.all(16),
          childrenPadding: const EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: 16,
          ),
          expandedCrossAxisAlignment: CrossAxisAlignment.start,
          expandedAlignment: Alignment.centerLeft,
          leading: Icon(
            Icons.business,
            color: Theme.of(
              context,
            ).colorScheme.onSurface.withValues(alpha: 0.6),
          ),
          title: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      service['name'],
                      style: AppTextStyles.getBodyStyle(
                        context,
                      ).copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(
                          Icons.apartment,
                          size: 14,
                          color: Theme.of(
                            context,
                          ).colorScheme.onSurface.withValues(alpha: 0.6),
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            service['provider'],
                            style: AppTextStyles.getCaptionStyle(context),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 14,
                          color: Theme.of(
                            context,
                          ).colorScheme.onSurface.withValues(alpha: 0.6),
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            service['location'],
                            style: AppTextStyles.getCaptionStyle(context),
                          ),
                        ),
                      ],
                    ),
                    if ((service['tags'] as List).isNotEmpty) ...[
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 4,
                        runSpacing: 4,
                        children: (service['tags'] as List<String>)
                            .map(
                              (tag) => Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.primary.withValues(alpha: 0.1),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  tag,
                                  style: AppTextStyles.getCaptionStyle(
                                    context,
                                  ).copyWith(fontSize: 11),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
          trailing: Icon(
            Icons.expand_more,
            color: Theme.of(context).colorScheme.onSurface,
          ),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  service['description'],
                  style: AppTextStyles.getBodyStyle(context),
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 12),
                if (service['privacyUrl'] != null &&
                    service['privacyUrl'].toString().isNotEmpty) ...[
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.start,
                    alignment: WrapAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.providedByLabel,
                        style: AppTextStyles.getCaptionStyle(context),
                      ),
                      Text(
                        '${service['provider']} (${service['location']})',
                        style: AppTextStyles.getCaptionStyle(context),
                      ),
                      const SizedBox(width: 8),
                      Text('-', style: AppTextStyles.getCaptionStyle(context)),
                      const SizedBox(width: 8),
                      InkWell(
                        onTap: () => _launchExternalUrl(service['privacyUrl']),
                        child: Text(
                          AppLocalizations.of(context)!.privacyPolicy,
                          style: AppTextStyles.getCaptionStyle(context)
                              .copyWith(
                                color: Theme.of(context).colorScheme.primary,
                                decoration: TextDecoration.underline,
                              ),
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCookiePolicySection(BuildContext context) {
    return _buildSection(
      context,
      Icons.cookie,
      AppLocalizations.of(context)!.cookiePolicyTitle,
      FormattedMarkdownContent(
        content: AppLocalizations.of(context)!.cookiePolicyContent,
      ),
    );
  }

  Widget _buildEUSection(BuildContext context) {
    return _buildSection(
      context,
      Icons.flag,
      AppLocalizations.of(context)!.euInfoTitle,
      FormattedMarkdownContent(
        content: '''
${AppLocalizations.of(context)!.euInfoContent}

${AppLocalizations.of(context)!.euExtendedContent}
        ''',
      ),
    );
  }

  Widget _buildAdditionalInfoSection(BuildContext context) {
    return _buildSection(
      context,
      Icons.info,
      AppLocalizations.of(context)!.additionalInfoSection,
      FormattedMarkdownContent(
        content: AppLocalizations.of(context)!.additionalInfoContent,
      ),
    );
  }

  Widget _buildDefinitionsSection(BuildContext context) {
    return _buildSection(
      context,
      Icons.menu_book,
      AppLocalizations.of(context)!.definitionsSection,
      FormattedMarkdownContent(
        content: AppLocalizations.of(context)!.definitionsContent,
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

  Widget _buildCheckItem(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.check,
            color: Theme.of(context).colorScheme.primary,
            size: 20,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(text, style: AppTextStyles.getBodyStyle(context)),
          ),
        ],
      ),
    );
  }

  Widget _buildHelpSection(BuildContext context) {
    return _buildSection(
      context,
      Icons.warning_amber_outlined,
      AppLocalizations.of(context)!.inCaseOfProblems,
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.problemsDescription,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 8),
          Text(
            AppLocalizations.of(context)!.doNotHesitateContact,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () => _launchExternalUrl(
              'mailto:contact@astrogods.it',
            ),
            icon: const Icon(Icons.email_outlined),
            label: Text(AppLocalizations.of(context)!.contactUs),
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(
                context,
              ).colorScheme.primary,
              foregroundColor: Theme.of(
                context,
              ).colorScheme.onPrimary,
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 12,
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
        initialChildSize: 0.7,
        maxChildSize: 0.9,
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
