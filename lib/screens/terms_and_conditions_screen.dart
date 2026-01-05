import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import '../l10n/app_localizations.dart';
import '../widgets/starry_night_background.dart';
import '../constants/text_styles.dart';

class TermsAndConditionsScreen extends StatefulWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  State<TermsAndConditionsScreen> createState() => _TermsAndConditionsScreenState();
}

class _TermsAndConditionsScreenState extends State<TermsAndConditionsScreen> {
  final ScrollController _scrollController = ScrollController();
  final Map<String, GlobalKey> _sectionKeys = {};
  int _selectedIndex = 0;
  bool _isScrollingToSection = false;

  List<String> _getSections(AppLocalizations l10n) {
    return [
      l10n.termsIntroductionSection,
      l10n.astrologicalServiceNatureSection,
      l10n.termsOfUseSection,
      l10n.differentiatedLicensingSection,
      l10n.salesTermsSection,
      l10n.deliverySection,
      l10n.contractDurationSection,
      l10n.userRightsSection,
      l10n.liabilitySection,
      l10n.commonProvisionsSection,
      l10n.disputeResolutionSection,
      l10n.privacyPolicySection,
      l10n.cookiesAndTrackingSection,
      l10n.definitionsSection,
      l10n.contactUsSection,
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
                  l10n.termsAndConditions,
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
                          color: Theme.of(context).colorScheme.surface,
                          border: Border(
                            right: BorderSide(
                              color: Theme.of(
                                context,
                              ).colorScheme.outline.withValues(alpha: 0.2),
                              width: 1.5,
                            ),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Theme.of(context).colorScheme.shadow.withValues(alpha: 0.05),
                              blurRadius: 8,
                              offset: const Offset(2, 0),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(20.0),
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.primaryContainer.withValues(alpha: 0.2),
                                border: Border(
                                  bottom: BorderSide(
                                    color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.1),
                                  ),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.format_list_bulleted,
                                    color: Theme.of(context).colorScheme.primary,
                                    size: 20,
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Text(
                                      l10n.termsTableOfContents,
                                      style: AppTextStyles.getH5Style(
                                        context,
                                      ).copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context).colorScheme.primary,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: ListView.builder(
                                itemCount: sections.length,
                                itemBuilder: (context, index) {
                                  final isSelected = _selectedIndex == index;
                                  return InkWell(
                                    onTap: () => _scrollToSection(index, sections),
                                    borderRadius: BorderRadius.circular(12),
                                    child: AnimatedContainer(
                                      duration: const Duration(milliseconds: 200),
                                      margin: const EdgeInsets.symmetric(
                                        horizontal: 12.0,
                                        vertical: 4.0,
                                      ),
                                      decoration: BoxDecoration(
                                        color: isSelected
                                            ? Theme.of(
                                                context,
                                              ).colorScheme.primaryContainer
                                            : Colors.transparent,
                                        borderRadius: BorderRadius.circular(12),
                                        border: isSelected
                                            ? Border.all(
                                                color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.3),
                                                width: 1.5,
                                              )
                                            : null,
                                        boxShadow: isSelected
                                            ? [
                                                BoxShadow(
                                                  color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
                                                  blurRadius: 6,
                                                  offset: const Offset(0, 2),
                                                ),
                                              ]
                                            : null,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0,
                                          vertical: 12.0,
                                        ),
                                        child: Row(
                                          children: [
                                            AnimatedContainer(
                                              duration: const Duration(milliseconds: 200),
                                              width: isSelected ? 8 : 6,
                                              height: isSelected ? 8 : 6,
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
                                            const SizedBox(width: 16),
                                            Expanded(
                                              child: AnimatedDefaultTextStyle(
                                                duration: const Duration(milliseconds: 200),
                                                style: AppTextStyles.getCaptionStyle(
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
                                                  fontSize: isSelected ? 13 : 12,
                                                ),
                                                child: Text(
                                                  sections[index],
                                                  maxLines: 2,
                                                  overflow: TextOverflow.ellipsis,
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
                                          l10n.termsAndConditionsTitle,
                                          style: AppTextStyles.getH2Style(
                                            context,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        const SizedBox(height: 16),
                                        Text(
                                          l10n.termsAcceptanceRequired,
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
                                          l10n.lastModifiedTerms,
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

                                // Introduction Section
                                _buildSectionWithKey(
                                  sections[0],
                                  _buildIntroductionSection(context),
                                ),

                                // Astrological Service Nature Section
                                _buildSectionWithKey(
                                  sections[1],
                                  _buildAstrologicalServiceNatureSection(context),
                                ),

                                // Terms of Use Section
                                _buildSectionWithKey(
                                  sections[2],
                                  _buildTermsOfUseSection(context),
                                ),

                                // Differentiated Licensing Section
                                _buildSectionWithKey(
                                  sections[3],
                                  _buildDifferentiatedLicensingSection(context),
                                ),

                                // Sales Terms Section
                                _buildSectionWithKey(
                                  sections[4],
                                  _buildSalesTermsSection(context),
                                ),

                                // Delivery Section
                                _buildSectionWithKey(
                                  sections[5],
                                  _buildDeliverySection(context),
                                ),

                                // Contract Duration Section
                                _buildSectionWithKey(
                                  sections[6],
                                  _buildContractDurationSection(context),
                                ),

                                // User Rights Section
                                _buildSectionWithKey(
                                  sections[7],
                                  _buildUserRightsSection(context),
                                ),

                                // Liability Section
                                _buildSectionWithKey(
                                  sections[8],
                                  _buildLiabilitySection(context),
                                ),

                                // Common Provisions Section
                                _buildSectionWithKey(
                                  sections[9],
                                  _buildCommonProvisionsSection(context),
                                ),

                                // Dispute Resolution Section
                                _buildSectionWithKey(
                                  sections[10],
                                  _buildDisputeResolutionSection(context),
                                ),

                                // Privacy Policy Section
                                _buildSectionWithKey(
                                  sections[11],
                                  _buildPrivacyPolicySection(context),
                                ),

                                // Cookies and Tracking Section
                                _buildSectionWithKey(
                                  sections[12],
                                  _buildCookiesAndTrackingSection(context),
                                ),

                                // Definitions Section
                                _buildSectionWithKey(
                                  sections[13],
                                  _buildDefinitionsSection(context),
                                ),

                                // Contact Us Section
                                _buildSectionWithKey(
                                  sections[14],
                                  _buildContactUsSection(context),
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

  Widget _buildSection(
    BuildContext context,
    IconData icon,
    String title,
    Widget content,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 56.0),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 800),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.1),
            ),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.shadow.withValues(alpha: 0.05),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(24.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer.withValues(alpha: 0.3),
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        icon,
                        color: Theme.of(context).colorScheme.primary,
                        size: 32,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        title,
                        style: AppTextStyles.getH3Style(context).copyWith(
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: content,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIntroductionSection(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return _buildSection(
      context,
      Icons.article_outlined,
      l10n.termsIntroduction,
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.termsGovernText,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 8),
          _buildBulletPoint(context, l10n.useOfService),
          _buildBulletPoint(context, l10n.legalRelationship),
          const SizedBox(height: 16),
          Text(
            l10n.bindingManner,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            l10n.termsAcceptanceRequired,
            style: AppTextStyles.getBodyStyle(context).copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          const Divider(),
          const SizedBox(height: 16),
          Text(
            l10n.appleThirdPartyBeneficiary,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            l10n.astroGodsServiceOf,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 8),
          Text(
            l10n.ownerName,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 8),
          Wrap(
            children: [
              Text(
                "${l10n.ownerEmail} ",
                style: AppTextStyles.getBodyStyle(context).copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
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
          const SizedBox(height: 16),
          Text(
            l10n.astroGodsRefersTo,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 8),
          _buildBulletPoint(context, l10n.thisSiteDescription),
          _buildBulletPoint(context, l10n.mobileApplicationsDescription),
        ],
      ),
    );
  }


  Widget _buildAstrologicalServiceNatureSection(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return _buildSection(
      context,
      Icons.auto_awesome,
      l10n.astrologicalServiceNature,
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.astrologicalServiceDescription,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          _buildBulletPoint(context, l10n.astrologicalServicePoint1),
          _buildBulletPoint(context, l10n.astrologicalServicePoint2),
          _buildBulletPoint(context, l10n.astrologicalServicePoint3),
          _buildBulletPoint(context, l10n.astrologicalServicePoint4),
          _buildBulletPoint(context, l10n.astrologicalServicePoint5),
          _buildBulletPoint(context, l10n.astrologicalServicePoint6),
        ],
      ),
    );
  }

  Widget _buildTermsOfUseSection(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return _buildSection(
      context,
      Icons.verified_user_outlined,
      l10n.termsOfUse,
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // General validity
          Text(
            l10n.termsOfUseGeneralValidity,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            l10n.additionalConditions,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            l10n.usingAstroGodsUserDeclares,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 12),
          _buildBulletPoint(context, l10n.consumerRequirement),
          _buildBulletPoint(context, l10n.notUnderEmbargo),
          _buildBulletPoint(context, l10n.notOnProhibitedList),

          const SizedBox(height: 24),

          // Registration Section
          _buildSubSectionTitle(context, l10n.registration),
          Text(
            l10n.registrationRequired,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            l10n.passwordSecurity,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            l10n.accountResponsibility,
            style: AppTextStyles.getBodyStyle(context),
          ),

          const SizedBox(height: 24),

          // Registration Requirements
          _buildSubSectionTitle(context, l10n.accountRequirements),
          Text(
            l10n.registrationRequirementsText,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 12),
          _buildBulletPoint(context, l10n.botRegistrationProhibited),
          _buildBulletPoint(context, l10n.oneAccountPerUser),
          _buildBulletPoint(context, l10n.accountSharingProhibited),

          const SizedBox(height: 24),

          // Account Closure
          _buildSubSectionTitle(context, l10n.accountClosureTitle),
          Text(
            l10n.accountClosureProcedure,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 12),
          _buildBulletPoint(context, l10n.usingAccountClosureTools),
          const SizedBox(height: 16),
          Text(
            l10n.paidSubscriptionSuspension,
            style: AppTextStyles.getBodyStyle(context),
          ),

          const SizedBox(height: 24),

          // Account Suspension and Cancellation
          _buildSubSectionTitle(context, l10n.accountSuspension),
          Text(
            l10n.accountSuspensionText,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            l10n.noCompensationForSuspension,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            l10n.paymentObligationRemains,
            style: AppTextStyles.getBodyStyle(context),
          ),


          const SizedBox(height: 24),

          // External Resources
          _buildSubSectionTitle(context, l10n.externalResources),
          Text(
            l10n.externalResourcesDisclaimer,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            l10n.thirdPartyResourcesDisclaimer,
            style: AppTextStyles.getBodyStyle(context),
          ),

          const SizedBox(height: 24),

          // Permitted Use
          _buildSubSectionTitle(context, l10n.permittedUse),
          Text(
            l10n.permittedUseText,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            l10n.userExclusiveResponsibility,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            l10n.ownerProtectiveRights,
            style: AppTextStyles.getBodyStyle(context).copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          _buildBulletPoint(context, l10n.violationsOfLaw),
          _buildBulletPoint(context, l10n.injuryToThirdPartyRights),
          _buildBulletPoint(context, l10n.actsHarmingOwnerInterests),
          _buildBulletPoint(context, l10n.offensesToOwnerOrThird),

          const SizedBox(height: 24),

          // Referral Program
          _buildSubSectionTitle(context, l10n.referralProgram),
          Text(
            l10n.referralBenefits,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            l10n.referralCodeUsage,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            l10n.referralRewardSystem,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            l10n.referralCodeLimitations,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            l10n.ownerDiscretionaryRight,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            l10n.referralLimitations,
            style: AppTextStyles.getBodyStyle(context),
          ),
        ],
      ),
    );
  }

  Widget _buildSalesTermsSection(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return _buildSection(
      context,
      Icons.storefront_outlined,
      l10n.salesTerms,
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Paid Products
          _buildSubSectionTitle(context, l10n.paidProducts),
          Text(
            l10n.salesTermsIntro,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            l10n.salesTermsDetails,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            l10n.purchaseRegistrationRequired,
            style: AppTextStyles.getBodyStyle(context),
          ),

          const SizedBox(height: 24),

          // Product Description
          _buildSubSectionTitle(context, l10n.productDescription),
          Text(
            l10n.productDescriptionInfo,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            l10n.productRepresentationDisclaimer,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            l10n.productCharacteristicsSpecified,
            style: AppTextStyles.getBodyStyle(context),
          ),

          const SizedBox(height: 24),

          // Purchase Procedure
          _buildSubSectionTitle(context, l10n.purchaseProcedure),
          Text(
            l10n.purchaseProcedureSteps,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 12),
          _buildBulletPoint(context, l10n.stripeCheckoutAccess),
          _buildBulletPoint(context, l10n.stripePaymentStorage),
          _buildBulletPoint(context, l10n.stripeBillingAddress),
          _buildBulletPoint(context, l10n.stripeExpressCheckout),
          const SizedBox(height: 16),
          Text(
            l10n.orderSubmissionRequirement,
            style: AppTextStyles.getBodyStyle(context),
          ),

          const SizedBox(height: 24),

          // Order Submission
          _buildSubSectionTitle(context, l10n.orderSubmission),
          Text(
            l10n.orderSubmissionConsequences,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 12),
          _buildBulletPoint(context, l10n.contractConclusion),
          _buildBulletPoint(context, l10n.userCollaborationObligation),
          _buildBulletPoint(context, l10n.orderConfirmationEmail),
          const SizedBox(height: 16),
          Text(
            l10n.purchaseNotifications,
            style: AppTextStyles.getBodyStyle(context),
          ),

          const SizedBox(height: 24),

          // Pricing
          _buildSubSectionTitle(context, l10n.pricing),
          Text(
            l10n.pricingTransparency,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            l10n.pricingPolicy,
            style: AppTextStyles.getBodyStyle(context),
          ),

          const SizedBox(height: 24),

          // Promotions and Discounts
          _buildSubSectionTitle(context, l10n.promotionsAndDiscounts),
          Text(
            l10n.promotionsDisclaimer,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            l10n.promotionsDiscretion,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            l10n.promotionsNoRights,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            l10n.promotionsTimeLimit,
            style: AppTextStyles.getBodyStyle(context),
          ),

          const SizedBox(height: 24),

          // Vouchers
          _buildSubSectionTitle(context, l10n.vouchers),
          Text(
            l10n.vouchersPromoForm,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            l10n.vouchersViolationConsequences,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            l10n.vouchersAdditionalProvisions,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            l10n.vouchersRules,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 12),
          _buildBulletPoint(context, l10n.voucherValidityRule),
          _buildBulletPoint(context, l10n.voucherFullRedemption),
          _buildBulletPoint(context, l10n.voucherSingleUse),
          _buildBulletPoint(context, l10n.vouchersNotCumulative),
          _buildBulletPoint(context, l10n.voucherExpiration),
          _buildBulletPoint(context, l10n.voucherNoCredit),
          _buildBulletPoint(context, l10n.voucherNonCommercialUse),

          const SizedBox(height: 24),

          // Payment Methods
          _buildSubSectionTitle(context, l10n.paymentMethods),
          Text(
            l10n.paymentMethodsInfo,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            l10n.paymentMethodsConditions,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            l10n.paymentThirdPartyHandling,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            l10n.paymentFailureConsequences,
            style: AppTextStyles.getBodyStyle(context),
          ),

          const SizedBox(height: 24),

          // Stripe Recurring Payments
          Text(
            l10n.stripeRecurringPayments,
            style: AppTextStyles.getBodyStyle(context).copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            l10n.stripeCustomerPortal,
            style: AppTextStyles.getBodyStyle(context),
          ),

          const SizedBox(height: 24),

          // App Store Purchases
          _buildSubSectionTitle(context, l10n.purchaseViaAppStore),
          Text(
            l10n.appStorePurchases,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            l10n.appStoreTermsPrecedence,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            l10n.appStoreTermsAcceptance,
            style: AppTextStyles.getBodyStyle(context),
          ),

          const SizedBox(height: 24),

          // Ownership Reservation
          _buildSubSectionTitle(context, l10n.ownershipReservationTitle),
          Text(
            l10n.ownershipReservation,
            style: AppTextStyles.getBodyStyle(context),
          ),

          const SizedBox(height: 24),

          // Usage Rights Reservation
          _buildSubSectionTitle(context, l10n.usageRightsReservationTitle),
          Text(
            l10n.usageRightsReservation,
            style: AppTextStyles.getBodyStyle(context),
          ),

          const SizedBox(height: 24),

          // Contractual Withdrawal Right
          _buildSubSectionTitle(context, l10n.contractualWithdrawalRightTitle),
          Text(
            l10n.contractualWithdrawalRight,
            style: AppTextStyles.getBodyStyle(context),
          ),

        ],
      ),
    );
  }

  Widget _buildDeliverySection(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return _buildSection(
      context,
      Icons.cloud_download_outlined,
      l10n.delivery,
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Digital Content Delivery
          _buildSubSectionTitle(context, l10n.deliveryOfDigitalContent),
          Text(
            l10n.digitalContentDeliveryDetails,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            l10n.deviceRequirements,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            l10n.downloadLimitations,
            style: AppTextStyles.getBodyStyle(context),
          ),
        ],
      ),
    );
  }

  Widget _buildContractDurationSection(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return _buildSection(
      context,
      Icons.access_time_outlined,
      l10n.contractDuration,
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          // Trial Period
          Text(
            l10n.trialPeriod,
            style: AppTextStyles.getBodyStyle(context).copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            l10n.trialPeriodAvailability,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            l10n.trialAutoConversion,
            style: AppTextStyles.getBodyStyle(context),
          ),

          const SizedBox(height: 20),

          // Subscriptions
          Text(
            l10n.subscriptions,
            style: AppTextStyles.getBodyStyle(context).copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            l10n.subscriptionContinuousProduct,
            style: AppTextStyles.getBodyStyle(context),
          ),

          const SizedBox(height: 20),

          // Lifetime Subscriptions
          Text(
            l10n.lifetimeSubscriptions,
            style: AppTextStyles.getBodyStyle(context).copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            l10n.lifetimeSubscriptionDuration,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            l10n.lifetimeRefundPolicy,
            style: AppTextStyles.getBodyStyle(context),
          ),

          const SizedBox(height: 20),

          // Fixed-term Subscriptions
          Text(
            l10n.fixedTermSubscriptions,
            style: AppTextStyles.getBodyStyle(context).copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            l10n.fixedTermSubscriptionText,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            l10n.fixedTermSubscriptionEnd,
            style: AppTextStyles.getBodyStyle(context),
          ),

          const SizedBox(height: 20),

          // Apple Account Subscriptions
          Text(
            l10n.appleAccountSubscriptionsTitle,
            style: AppTextStyles.getH4Style(context),
          ),
          const SizedBox(height: 12),
          Text(
            l10n.appleAccountSubscriptions,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 12),
          _buildBulletPoint(context, l10n.appleAccountPayment),
          _buildBulletPoint(context, l10n.appleAccountAutoRenewal),
          _buildBulletPoint(context, l10n.appleAccountRenewalCharges),
          _buildBulletPoint(context, l10n.appleAccountManagement),
          const SizedBox(height: 16),
          Text(
            l10n.appleTermsPrecedence,
            style: AppTextStyles.getBodyStyle(context),
          ),

          const SizedBox(height: 20),

          // Automatic Renewal
          Text(
            l10n.automaticRenewal,
            style: AppTextStyles.getBodyStyle(context).copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            l10n.automaticRenewalPolicy,
            style: AppTextStyles.getBodyStyle(context).copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            l10n.renewalDurationMatch,
            style: AppTextStyles.getBodyStyle(context).copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 16),

          // Termination
          Text(
            l10n.cancellation,
            style: AppTextStyles.getBodyStyle(context).copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            l10n.subscriptionTermination,
            style: AppTextStyles.getBodyStyle(context).copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            l10n.cancellationEffectiveTiming,
            style: AppTextStyles.getBodyStyle(context).copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 20),

          // Consumer Exception
          _buildSubSectionTitle(context, l10n.consumerExceptionTitle),
          Text(
            l10n.consumerExceptionText,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            l10n.consumerIndefiniteExtension,
            style: AppTextStyles.getBodyStyle(context).copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            l10n.consumerRenewalCharging,
            style: AppTextStyles.getBodyStyle(context).copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            l10n.consumerMonthlyTermination,
            style: AppTextStyles.getBodyStyle(context).copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 24),

          // Resolution (subsection within Consumer Exception)
          _buildSubSectionTitle(context, l10n.resolution),
          Text(
            l10n.subscriptionTermination,
            style: AppTextStyles.getBodyStyle(context).copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            l10n.consumerCancellationTiming,
            style: AppTextStyles.getBodyStyle(context).copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserRightsSection(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return _buildSection(
      context,
      Icons.balance_outlined,
      l10n.userRights,
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Right of Withdrawal - Main section
          _buildSubSectionTitle(context, l10n.rightOfWithdrawal),
          Text(
            l10n.withdrawalRightSummary,
            style: AppTextStyles.getBodyStyle(context).copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 24),

          // Who has withdrawal rights
          _buildSubSectionTitle(context, l10n.whoHasWithdrawalRights),
          Text(
            l10n.europeanConsumersWithdrawal,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            l10n.nonEuropeanUsersNoRights,
            style: AppTextStyles.getBodyStyle(context),
          ),

          const SizedBox(height: 24),

          // Exercise of withdrawal right
          _buildSubSectionTitle(context, l10n.exerciseOfWithdrawalRight),
          Text(
            l10n.withdrawalExercise,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            l10n.withdrawalFormInstructions,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            l10n.withdrawalDeadlineQuestion,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 8),
          _buildBulletPoint(context, l10n.digitalContentWithdrawalDeadline),

          const SizedBox(height: 24),

          // Effects of withdrawal
          _buildSubSectionTitle(context, l10n.effectsOfWithdrawal),
          Text(
            l10n.withdrawalEffects,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            l10n.deliveryCostException,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            l10n.refundTimeline,
            style: AppTextStyles.getBodyStyle(context),
          ),

        ],
      ),
    );
  }

  Widget _buildLiabilitySection(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return _buildSection(
      context,
      Icons.security_outlined,
      l10n.liabilityAndIndemnification,
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Indemnification
          _buildSubSectionTitle(context, l10n.indemnification),
          Text(
            l10n.indemnificationText,
            style: AppTextStyles.getBodyStyle(context),
          ),

          const SizedBox(height: 24),

          // User Activity Liability Limitation
          _buildSubSectionTitle(context, l10n.userActivityLiabilityLimitation),
          Text(
            l10n.generalLiabilityExclusion,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            l10n.liabilityExceptions,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            l10n.limitedLiabilityScope,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            l10n.noResponsibilityIntro,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 12),
          _buildBulletPoint(context, l10n.forceMAjeureExclusion),
          const SizedBox(height: 8),
          _buildBulletPoint(context, l10n.indirectLossExclusion),
          const SizedBox(height: 8),
          _buildBulletPoint(context, l10n.nonDirectLossExclusion),
        ],
      ),
    );
  }

  Widget _buildCommonProvisionsSection(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return _buildSection(
      context,
      Icons.fact_check_outlined,
      l10n.commonProvisions,
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // No Implicit Waiver
          _buildSubSectionTitle(context, l10n.noWaiverImplied),
          Text(
            l10n.noImplicitWaiver,
            style: AppTextStyles.getBodyStyle(context),
          ),

          const SizedBox(height: 24),

          // Service Interruption
          _buildSubSectionTitle(context, l10n.serviceInterruption),
          Text(
            l10n.serviceMaintenanceRight,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            l10n.serviceTerminationRights,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            l10n.forceMAjeureUnavailability,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            l10n.advanceNotice,
            style: AppTextStyles.getBodyStyle(context),
          ),

          const SizedBox(height: 24),

          // Service Resale
          _buildSubSectionTitle(context, l10n.serviceResale),
          Text(
            l10n.unauthorizedResale,
            style: AppTextStyles.getBodyStyle(context),
          ),


          const SizedBox(height: 24),

          // Terms Modification
          _buildSubSectionTitle(context, l10n.termsModification),
          Text(
            l10n.termsModificationRight,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            l10n.modificationsEffectiveDate,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            l10n.termsModificationAcceptance,
            style: AppTextStyles.getBodyStyle(context).copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            l10n.previousVersionValidity,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            l10n.advanceNotificationRequirement,
            style: AppTextStyles.getBodyStyle(context),
          ),

          const SizedBox(height: 24),

          // Contract Assignment
          _buildSubSectionTitle(context, l10n.contractAssignment),
          Text(
            l10n.contractTransferRight,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            l10n.assignmentTermsApplication,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            l10n.userAssignmentRestriction,
            style: AppTextStyles.getBodyStyle(context),
          ),

          const SizedBox(height: 24),

          // Contacts
          _buildSubSectionTitle(context, l10n.contacts),
          Text(
            l10n.communicationRequirement,
            style: AppTextStyles.getBodyStyle(context),
          ),

          const SizedBox(height: 24),

          // Severability Clause
          _buildSubSectionTitle(context, l10n.severabilityClause),
          Text(
            l10n.generalSeverability,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            l10n.europeanUsersTitle,
            style: AppTextStyles.getH4Style(context),
          ),
          const SizedBox(height: 8),
          Text(
            l10n.europeanSeverability,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            l10n.severabilityLimitations,
            style: AppTextStyles.getBodyStyle(context),
          ),

          const SizedBox(height: 24),

          // Applicable Law
          _buildSubSectionTitle(context, l10n.applicableLaw),
          Text(
            l10n.governingLaw,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            l10n.nationalLawPrevalence,
            style: AppTextStyles.getH4Style(context),
          ),
          const SizedBox(height: 8),
          Text(
            l10n.nationalLawPrevails,
            style: AppTextStyles.getBodyStyle(context),
          ),

          const SizedBox(height: 24),

          // Competent Jurisdiction
          _buildSubSectionTitle(context, l10n.competentJurisdiction),
          Text(
            l10n.exclusiveJurisdiction,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            l10n.europeanConsumerExceptionTitle,
            style: AppTextStyles.getH4Style(context),
          ),
          const SizedBox(height: 8),
          Text(
            l10n.europeanConsumerException,
            style: AppTextStyles.getBodyStyle(context),
          ),
        ],
      ),
    );
  }

  Widget _buildDisputeResolutionSection(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return _buildSection(
      context,
      Icons.handshake_outlined,
      l10n.disputeResolution,
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Amicable Dispute Composition
          _buildSubSectionTitle(context, l10n.amicableDisputeComposition),
          Text(
            l10n.amicableDisputeResolution,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            l10n.judicialRightsPreservation,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            l10n.complaintProcedure,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            l10n.responseTimeline,
            style: AppTextStyles.getBodyStyle(context),
          ),
        ],
      ),
    );
  }

  Widget _buildPrivacyPolicySection(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return _buildSection(
      context,
      Icons.privacy_tip_outlined,
      l10n.privacyPolicySection,
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.privacyPolicyReferenceContent,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 24),
          Center(
            child: ElevatedButton.icon(
              onPressed: () {
                context.push('/privacy-policy');
              },
              icon: const Icon(Icons.privacy_tip),
              label: Text(l10n.viewPrivacyPolicy),
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

  Widget _buildCookiesAndTrackingSection(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return _buildSection(
      context,
      Icons.track_changes_outlined,
      l10n.cookiesAndTrackingTitle,
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.cookiesAndTrackingReferenceContent,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 24),
          Center(
            child: ElevatedButton.icon(
              onPressed: () {
                context.push('/cookie-policy');
              },
              icon: const Icon(Icons.cookie),
              label: Text(l10n.viewCookiePolicy),
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

  Widget _buildDefinitionsSection(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return _buildSection(
      context,
      Icons.menu_book_outlined,
      l10n.definitions,
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // AstroGods Definition
          Text(
            l10n.astroGodsDefinitionTitle,
            style: AppTextStyles.getH4Style(context),
          ),
          const SizedBox(height: 8),
          Text(
            l10n.astroGodsDefinition,
            style: AppTextStyles.getBodyStyle(context),
          ),

          const SizedBox(height: 24),

          // Agreement Definition
          Text(
            l10n.agreementDefinitionTitle,
            style: AppTextStyles.getH4Style(context),
          ),
          const SizedBox(height: 8),
          Text(
            l10n.agreementDefinition,
            style: AppTextStyles.getBodyStyle(context),
          ),

          const SizedBox(height: 24),

          // Voucher Definition
          Text(
            l10n.voucherDefinitionTitle,
            style: AppTextStyles.getH4Style(context),
          ),
          const SizedBox(height: 8),
          Text(
            l10n.voucherDefinition,
            style: AppTextStyles.getBodyStyle(context),
          ),

          const SizedBox(height: 24),

          // European Definition
          Text(
            l10n.europeanDefinitionTitle,
            style: AppTextStyles.getH4Style(context),
          ),
          const SizedBox(height: 8),
          Text(
            l10n.europeanDefinition,
            style: AppTextStyles.getBodyStyle(context),
          ),

          const SizedBox(height: 24),

          // Withdrawal Form
          Text(
            l10n.withdrawalFormTitle,
            style: AppTextStyles.getH4Style(context),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
              border: Border.all(
                color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.3),
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).colorScheme.shadow.withValues(alpha: 0.08),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.description_outlined,
                      color: Theme.of(context).colorScheme.primary,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        l10n.withdrawalFormHeader,
                        style: AppTextStyles.getBodyStyle(context).copyWith(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  l10n.withdrawalFormAddress,
                  style: AppTextStyles.getBodyStyle(context).copyWith(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.2),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.withdrawalFormNotification,
                        style: AppTextStyles.getBodyStyle(context).copyWith(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        l10n.withdrawalFormDescription,
                        style: AppTextStyles.getBodyStyle(context).copyWith(
                          fontStyle: FontStyle.italic,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondaryContainer.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildBulletPoint(context, l10n.withdrawalFormOrderDate),
                      _buildBulletPoint(context, l10n.withdrawalFormReceiveDate),
                      _buildBulletPoint(context, l10n.withdrawalFormConsumerName),
                      _buildBulletPoint(context, l10n.withdrawalFormConsumerAddress),
                      _buildBulletPoint(context, l10n.withdrawalFormDate),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.3),
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.edit_outlined,
                        size: 18,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          l10n.withdrawalFormSignature,
                          style: AppTextStyles.getBodyStyle(context).copyWith(
                            fontStyle: FontStyle.italic,
                            color: Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Owner Definition
          Text(
            l10n.ownerDefinitionTitle,
            style: AppTextStyles.getH4Style(context),
          ),
          const SizedBox(height: 8),
          Text(
            l10n.ownerDefinition,
            style: AppTextStyles.getBodyStyle(context),
          ),

          const SizedBox(height: 24),

          // Product Definition
          Text(
            l10n.productDefinitionTitle,
            style: AppTextStyles.getH4Style(context),
          ),
          const SizedBox(height: 8),
          Text(
            l10n.productDefinition,
            style: AppTextStyles.getBodyStyle(context),
          ),

          const SizedBox(height: 24),

          // Service Definition
          Text(
            l10n.serviceDefinitionTitle,
            style: AppTextStyles.getH4Style(context),
          ),
          const SizedBox(height: 8),
          Text(
            l10n.serviceDefinition,
            style: AppTextStyles.getBodyStyle(context),
          ),

          const SizedBox(height: 24),

          // Terms Definition
          Text(
            l10n.termsDefinitionTitle,
            style: AppTextStyles.getH4Style(context),
          ),
          const SizedBox(height: 8),
          Text(
            l10n.termsDefinition,
            style: AppTextStyles.getBodyStyle(context),
          ),

          const SizedBox(height: 24),

          // User Definition
          Text(
            l10n.userDefinitionTitle,
            style: AppTextStyles.getH4Style(context),
          ),
          const SizedBox(height: 8),
          Text(
            l10n.userDefinition,
            style: AppTextStyles.getBodyStyle(context),
          ),

          const SizedBox(height: 24),

          // Consumer Definition
          Text(
            l10n.consumerDefinitionTitle,
            style: AppTextStyles.getH4Style(context),
          ),
          const SizedBox(height: 8),
          Text(
            l10n.consumerDefinition,
            style: AppTextStyles.getBodyStyle(context),
          ),
        ],
      ),
    );
  }

  Widget _buildContactUsSection(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return _buildSection(
      context,
      Icons.contact_support_outlined,
      l10n.contactUsSection,
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.amicableDisputeResolution,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () => _launchExternalUrl(
              'mailto:contact@astrogods.it',
            ),
            icon: const Icon(Icons.email_outlined),
            label: Text(l10n.contactUs),
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

  Widget _buildDifferentiatedLicensingSection(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return _buildSection(
      context,
      Icons.copyright_outlined,
      l10n.differentiatedLicensing,
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.differentiatedLicensingText,
            style: AppTextStyles.getBodyStyle(context),
          ),
          
          const SizedBox(height: 24),

          // Proprietary Standard Content
          _buildSubSectionTitle(context, l10n.proprietaryContentStandard),
          Text(
            l10n.proprietaryContentStandardText,
            style: AppTextStyles.getBodyStyle(context),
          ),

          const SizedBox(height: 24),

          // Codex Creative Commons
          _buildSubSectionTitle(context, l10n.codexCreativeCommons),
          Text(
            l10n.codexCreativeCommonsText,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 12),
          _buildBulletPoint(context, l10n.codexRights1),
          _buildBulletPoint(context, l10n.codexRights2),
          _buildBulletPoint(context, l10n.codexRights3),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primaryContainer.withValues(alpha: 0.4),
                  Theme.of(context).colorScheme.primaryContainer.withValues(alpha: 0.2),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.4),
                width: 2,
              ),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                Icon(
                  Icons.warning_amber_outlined,
                  color: Theme.of(context).colorScheme.primary,
                  size: 24,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    l10n.codexAttributionRequired,
                    style: AppTextStyles.getBodyStyle(context).copyWith(
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.primary,
                      height: 1.4,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Third-party license hierarchy
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.tertiaryContainer.withValues(alpha: 0.3),
                  Theme.of(context).colorScheme.tertiaryContainer.withValues(alpha: 0.1),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Theme.of(context).colorScheme.tertiary.withValues(alpha: 0.3),
                width: 1.5,
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.tertiary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.info_outline,
                    size: 22,
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    l10n.codexThirdPartyLicenseHierarchy,
                    style: AppTextStyles.getBodyStyle(context).copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontWeight: FontWeight.w500,
                      height: 1.4,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // AI Generated Interpretations
          _buildSubSectionTitle(context, l10n.aiGeneratedInterpretations),
          Text(
            l10n.aiGeneratedInterpretationsText,
            style: AppTextStyles.getBodyStyle(context),
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
              l10n.ownerName,
              style: AppTextStyles.getCaptionStyle(context),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Wrap(
              alignment: WrapAlignment.center,
              children: [
                Text(
                  "${l10n.ownerEmail} ",
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

  Widget _buildBulletPoint(BuildContext context, String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 8, right: 12),
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: AppTextStyles.getBodyStyle(context).copyWith(
                height: 1.5,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildSubSectionTitle(BuildContext context, String title) {
    return Container(
      margin: const EdgeInsets.only(top: 24, bottom: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondaryContainer.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(8),
        border: Border(
          left: BorderSide(
            color: Theme.of(context).colorScheme.secondary,
            width: 4,
          ),
        ),
      ),
      child: Text(
        title,
        style: AppTextStyles.getH4Style(context).copyWith(
          fontWeight: FontWeight.w600,
          color: Theme.of(context).colorScheme.onSurface,
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
                      l10n.termsTableOfContents,
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