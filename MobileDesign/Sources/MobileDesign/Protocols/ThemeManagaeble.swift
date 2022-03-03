public struct ThemeAttributes {
    
    public var color: UIColor
    public var font: UIFont
    public var disableColor: UIColor?
    
    public init(color: UIColor, font: UIFont, disableColor: UIColor? = nil) {
        self.color = color
        self.font = font
        self.disableColor = disableColor
    }
}

public typealias ShadowAttributes = (offset: CGSize, color: UIColor, radius: CGFloat, opacity: Float)

public struct ThemeBorderAttributes {
    
    public var width: CGFloat
    public var color: UIColor
    public var radius: CGFloat
    public var shadowAttributes: ShadowAttributes?
    
    public init(width: CGFloat, color: UIColor, radius: CGFloat, shadowAttributes: ShadowAttributes? = nil) {
        self.width = width
        self.color = color
        self.radius = radius
        self.shadowAttributes = shadowAttributes
    }
}

public protocol ThemeManagaeble {
    
    var brand: ThemeBrand { get }
    var titleTextAttributes: ThemeAttributes { get }
    var headerTextAttributes: ThemeAttributes { get }
    var subHeaderTextAttributes: ThemeAttributes { get }
    var primaryTextAttributes: ThemeAttributes { get }
    var priceTextAttributes: ThemeAttributes { get }
    var secondaryTextAttributes: ThemeAttributes { get }
    var tertiaryTextAttributes: ThemeAttributes { get }
    var footerTextAttributes: ThemeAttributes { get }
    var warningTextAttributes: ThemeAttributes { get }
    var warningDescTextAttributes: ThemeAttributes { get }
    var navigationBarTextAttributes: ThemeAttributes { get }
    var barButtonItemTextAttributes: ThemeAttributes { get }
    var linkButtonThemeAttributes: ThemeAttributes { get }
    var linkTextThemeAttributes: ThemeAttributes { get }
    var settingsHeaderTextAttributes: ThemeAttributes { get }
    var profileHeaderTextAttributes: ThemeAttributes { get }
    var subtitleTextAttributes: ThemeAttributes { get }
    var actionTextAttributes: ThemeAttributes { get }
    var tableRowTitleTextAttributes: ThemeAttributes { get }
    var errorTitleTextAttributes: ThemeAttributes { get }
    var errorDescTextAttributes: ThemeAttributes { get }
    var billingCycleTitleTextAttributes: ThemeAttributes { get }
    var usageWarningViewTitleTextAttributes: ThemeAttributes { get }
    var recommendedPlanHeaderTextAttributes: ThemeAttributes { get }
    var sectionHeaderTextAttributes: ThemeAttributes { get }
    var appSubViewThemeAttributes: ThemeBorderAttributes? { get }
    var progressViewThemeAttributes: ThemeAttributes { get }
    var appColor: UIColor { get }
    var switchTintColor: UIColor { get }
    var tintColor: UIColor { get }
    var datePickerColor: UIColor { get }
    var navigationBarStyle: UIBarStyle { get }
    var separatorColor: UIColor { get }
    var backgroundColor: UIColor { get }
    var buttonBorderColor: UIColor { get }
    var alertColor: UIColor? { get }
    var bottomBorderColor: UIColor? { get }
    var attributedBoldFont: UIFont { get }
    var largeUsageDataFont: UIFont { get }
    var usageDataFont: UIFont { get }
    var remainingColor: UIColor { get }
    var runningLowColor: UIColor { get }
    var overageWarningColor: UIColor { get }
    var overageWarningSeparatorColor: UIColor { get }
    var delayWarningColor: UIColor { get }
    var delayWarningSeparatorColor: UIColor { get }
    var overageUnderLineBackgroundColor: UIColor { get }
    var usageBackgroundColor: UIColor { get }
    var viewBackgroundColor: UIColor { get }
    var addDataButtonImage: UIImage? { get }
    var barColor: UIColor { get }
    var planHeaderTextAttributes: ThemeAttributes { get }
    var planNameTextAttributes: ThemeAttributes { get }
    var lightNavigationStyleTintColor: UIColor { get }
    var mediumNavigationStyleTintColor: UIColor { get }
    var darkNavigationStyleTintColor: UIColor { get }
    var lightNavigationBarTextAttributes: ThemeAttributes { get }
    var primaryButtonTextAttributes: ThemeAttributes { get }
    var secondaryButtonTextAttributes: ThemeAttributes { get }
    var tertiaryButtonTextAttributes: ThemeAttributes { get }
    var addOnsLineSeparatorColor: UIColor { get }
    var addOnsBackgroundColor: UIColor { get }
    var shadowImageColor: UIColor { get }
    var primaryButtonDisableColor: UIColor { get }
    var planOrderSummaryHeaderTitleAttributes: ThemeAttributes { get }
    var planOrderSummarySubTitleAttributes: ThemeAttributes { get }
    var planDiscountsAttributes: ThemeAttributes { get }
    var planOrderSummarySubHeaderAttributes: ThemeAttributes { get }
    var disabledTextAttributes: ThemeAttributes { get }
    var linkHeaderTextAttributes: ThemeAttributes { get }
    var hardwareListTextAttributes: ThemeAttributes { get }
    var hardwareTitleTextAttributes: ThemeAttributes { get }
    var hardwareDescriptionTextAttributes: ThemeAttributes { get }
    var quaternaryButtonTextAttributes: ThemeAttributes { get }
    var appTertiaryButtonTextAttributes: ThemeAttributes { get }
    var quaternaryButtonBackgroundColorAttributes: UIColor { get }
    var tertiaryButtonBackgroundColor: UIColor { get }
    var solarisErrorTextAttributes: ThemeAttributes { get }
    var planOrderSummarySubHeaderTitleAttributes: ThemeAttributes { get }
    var subHeadingTitleAttributes: ThemeAttributes { get }
    var offerBannerHeaderAttributes: ThemeAttributes { get }
    var offerBannerDescriptionAttributes: ThemeAttributes { get }
    var planCompareLinkAttributes: ThemeAttributes { get }
    var darkNavigationBarTextAttributes: ThemeAttributes { get }
    var lightNavigationBarButtonTextAttributes: ThemeAttributes { get }
    var darkNavigationBarButtonTextAttributes: ThemeAttributes { get }
    var genericInfoViewDescTextAttributes: ThemeAttributes { get }
    var genericInfoViewCTAThemeAttributes: ThemeAttributes { get }
    var planOrderSummaryTitleAttributes: ThemeAttributes { get }
    var conflictAddOnsSubTitleAttributes: ThemeAttributes { get }
    var planTotalTextAttributes: ThemeAttributes { get }
    var digitalServicesHeaderTextAttributes: ThemeAttributes { get }
    var digitalServicesTitleTextAttributes: ThemeAttributes { get }
    var promiseToPayTitleTextAttributes: ThemeAttributes { get }
    var graySubtitleTextAttributes: ThemeAttributes { get }
    var graySubtitleMediumTextAttributes: ThemeAttributes { get }
    var largeNavigationBarTextAttributes: ThemeAttributes { get }
    var highlightedHeaderTextAttributes: ThemeAttributes { get }
    var accessoriesDisabledTextAttributes: ThemeAttributes { get }
    var validationTextAttributes: ThemeAttributes { get }
    var pinTextAttributes: ThemeAttributes { get }
    var validationLinkTextAttributes: ThemeAttributes { get }
    var smartStreamThemeBorderAttributes: ThemeBorderAttributes? { get }
    var mediumShadowImageColor: UIColor { get }
    var graphGradientColors: [UIColor] { get }
    var graphZeroUsageColor: UIColor { get }
    var lineColor: UIColor { get }
    var toastBgColor: UIColor { get }
    var toastTextThemeAttributes: ThemeAttributes { get }
    var internetUsageHeaderTextAttributes: ThemeAttributes { get }
    var internetUsageSpeedTitleTextAttributes: ThemeAttributes { get }
    var internetUsageSpeedAmountTextAttributes: ThemeAttributes { get }
    var carouselOfferBannerHeaderAttributes: ThemeAttributes { get }
    var carouselOfferBannerMessageAttributes: ThemeAttributes { get }
    var carouselOfferBannerActionTitleAttributes: ThemeAttributes { get }
    var subscriptionSubtitleThemeAttributes: ThemeAttributes { get }
    var failedSubscriptionTitleTextAttributes: ThemeAttributes { get }
    var graphUsageAttributes: ThemeAttributes { get }
    var graphPlanDateAttributes: ThemeAttributes { get }
    
    func extend()
}

extension ThemeManagaeble {
    
    public func apply(for application: UIApplication) {
        
        UINavigationBar.appearance().barTintColor = tintColor
        UINavigationBar.appearance().tintColor = navigationBarTextAttributes.color
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: navigationBarTextAttributes.color, .font: navigationBarTextAttributes.font]
        
        UIBarButtonItem.appearance(whenContainedInInstancesOf: [UINavigationBar.classForCoder() as! UIAppearanceContainer.Type]).setTitleTextAttributes([.foregroundColor: barButtonItemTextAttributes.color, .font: barButtonItemTextAttributes.font], for: UIControl.State.normal)
        
        UIDatePicker.appearance().backgroundColor = datePickerColor
        
        AppSwitchView.appearance().tintColor = switchTintColor
        
        AppView.appearance().backgroundColor = backgroundColor
        
        UsageView.appearance().backgroundColor = usageBackgroundColor
        
        AppSubView.appearance().with {
            $0.backgroundColor = viewBackgroundColor
            
            guard let borderAttributes = appSubViewThemeAttributes else { return }
            $0.borderWidth = borderAttributes.width
            $0.borderColor = borderAttributes.color
            $0.cornerRadius = borderAttributes.radius
            $0.layer.cornerRadius = borderAttributes.radius
            
            guard let shadowAttributes = borderAttributes.shadowAttributes else { return }
            $0.shadowOffset = shadowAttributes.offset
            $0.shadowRadius = shadowAttributes.radius
            $0.shadowOpacity = shadowAttributes.opacity
            $0.shadowColor = shadowAttributes.color
        }
        
        PrimaryLabel.appearance().with {
            $0.textColor = primaryTextAttributes.color
            $0.font = primaryTextAttributes.font
        }
        
        FooterLabel.appearance().with {
            $0.textColor = footerTextAttributes.color
            $0.font = footerTextAttributes.font
        }
        
        SecondaryLabel.appearance().with {
            $0.textColor = secondaryTextAttributes.color
            $0.font = secondaryTextAttributes.font
        }
        
        HeaderLabel.appearance().with {
            $0.textColor = headerTextAttributes.color
            $0.font = headerTextAttributes.font
        }
        
        SubHeaderLabel.appearance().with {
            $0.textColor = subHeaderTextAttributes.color
            $0.font = subHeaderTextAttributes.font
        }
        
        PriceLabel.appearance().with {
            $0.textColor = priceTextAttributes.color
            $0.font = priceTextAttributes.font
        }
        
        TitleLabel.appearance().with {
            $0.textColor = titleTextAttributes.color
            TitleLabel.alertTextColor = warningTextAttributes.color
            $0.font = titleTextAttributes.font
        }
        
        TertiaryLabel.appearance().with {
            $0.textColor = tertiaryTextAttributes.color
            $0.font = tertiaryTextAttributes.font
        }
        
        WarningLabel.appearance().with {
            $0.textColor = warningTextAttributes.color
            $0.font = warningTextAttributes.font
        }
        
        WarningDescLabel.appearance().with {
            $0.textColor = warningDescTextAttributes.color
            $0.font = warningDescTextAttributes.font
        }
        
        LinkLabel.appearance().with {
            $0.textColor = linkTextThemeAttributes.color
            $0.font = linkTextThemeAttributes.font
        }
        
        ActionLabel.appearance().with {
            $0.textColor = actionTextAttributes.color
            $0.font = actionTextAttributes.font
        }
        
        SettingsHeaderLabel.appearance().with {
            $0.textColor = settingsHeaderTextAttributes.color
            $0.font = settingsHeaderTextAttributes.font
        }
        
        ProfileHeaderLabel.appearance().with {
            $0.textColor = profileHeaderTextAttributes.color
            $0.font = profileHeaderTextAttributes.font
        }
        
        SubtitleLabel.appearance().with {
            $0.textColor = subtitleTextAttributes.color
            $0.font = subtitleTextAttributes.font
        }
        
        TableRowTitleLabel.appearance().with {
            $0.textColor = tableRowTitleTextAttributes.color
            $0.font = tableRowTitleTextAttributes.font
        }
        
        ErrorTitleLabel.appearance().with {
            $0.textColor = errorTitleTextAttributes.color
            $0.font = errorTitleTextAttributes.font
        }
        
        ErrorDescLabel.appearance().with {
            $0.textColor = errorDescTextAttributes.color
            $0.font = errorDescTextAttributes.font
        }
        
        AppPrimaryButton.appearance().with {
            $0.titleLabelFont = primaryButtonTextAttributes.font
            $0.setTitleColor(primaryButtonTextAttributes.color, for: .normal)
            $0.borderColor = buttonBorderColor
            $0.borderWidth = 1.0
            $0.cornerRadius = 4.0
            $0.backgroundColor = tintColor
        }
        
        AppQuaternaryButton.appearance().with {
            $0.titleLabelFont = quaternaryButtonTextAttributes.font
            $0.setTitleColor(quaternaryButtonTextAttributes.color, for: .normal)
            $0.cornerRadius = 17.0
            $0.backgroundColor = quaternaryButtonBackgroundColorAttributes
        }
        
        AppTertiaryButton.appearance().with {
            $0.titleLabelFont = appTertiaryButtonTextAttributes.font
            $0.setTitleColor(appTertiaryButtonTextAttributes.color, for: .normal)
            $0.cornerRadius = 5.0
            $0.backgroundColor = tertiaryButtonBackgroundColor
        }
        
        AppLinkButton.appearance().with {
            $0.setTitleColor(linkButtonThemeAttributes.color, for: .normal)
            $0.titleLabelFont = linkButtonThemeAttributes.font
        }
        
        ProgressViewLabel.appearance().with {
            $0.textColor = progressViewThemeAttributes.color
            $0.font = progressViewThemeAttributes.font
        }
        
        BillingCycleTitleLabel.appearance().with {
            $0.textColor = billingCycleTitleTextAttributes.color
            $0.font = billingCycleTitleTextAttributes.font
        }
        
        UsageWarningViewTitleLabel.appearance().with {
            $0.textColor = usageWarningViewTitleTextAttributes.color
            $0.font = usageWarningViewTitleTextAttributes.font
        }
        
        RecommendedPlanHeaderLabel.appearance().with {
            $0.textColor = recommendedPlanHeaderTextAttributes.color
            $0.font = recommendedPlanHeaderTextAttributes.font
        }
        
        AccountLabel.appearance().with {
            $0.textColor = primaryTextAttributes.color
            $0.font = primaryTextAttributes.font
        }
        
        PlanHeaderLabel.appearance().with {
            $0.textColor = planHeaderTextAttributes.color
            $0.font = planHeaderTextAttributes.font
        }
        
        PlanNameLabel.appearance().with {
            $0.textColor = planNameTextAttributes.color
            $0.font = planNameTextAttributes.font
        }
        
        DisabledLabel.appearance().with {
            $0.textColor = disabledTextAttributes.color
            $0.font = disabledTextAttributes.font
        }
        
        SectionHeaderLabel.appearance().with {
            $0.textColor = sectionHeaderTextAttributes.color
            $0.font = sectionHeaderTextAttributes.font
        }
        
        AppSecondaryButton.appearance().with {
            $0.titleLabelFont = secondaryButtonTextAttributes.font
            $0.setTitleColor(secondaryButtonTextAttributes.color, for: .normal)
            $0.borderColor = secondaryButtonTextAttributes.color
            $0.borderWidth = 1.0
            $0.cornerRadius = 8.0
        }
        
        PlanOrderSummaryHeaderLabel.appearance().with {
            $0.textColor = planOrderSummarySubHeaderAttributes.color
            $0.font = planOrderSummarySubHeaderAttributes.font
        }
        
        PlanConfirmationTextView.appearance().with {
            $0.tintColor = linkTextThemeAttributes.color
        }
        
        LinkHeaderLabel.appearance().with {
            $0.textColor = linkHeaderTextAttributes.color
            $0.font = linkHeaderTextAttributes.font
        }
        
        HardwareListLabel.appearance().with {
            $0.textColor = hardwareListTextAttributes.color
            $0.font = hardwareListTextAttributes.font
        }
        
        HardwareTitleLabel.appearance().with {
            $0.textColor = hardwareTitleTextAttributes.color
            $0.font = hardwareTitleTextAttributes.font
        }
        
        HardwareDescriptionLabel.appearance().with {
            $0.textColor = hardwareDescriptionTextAttributes.color
            $0.font = hardwareDescriptionTextAttributes.font
        }
        
        PlanOrderSummarySubHeaderLabel.appearance().with {
            $0.textColor = planOrderSummarySubHeaderTitleAttributes.color
            $0.font = planOrderSummarySubHeaderTitleAttributes.font
        }
        
        PlanCompareLinkLabel.appearance().with {
            $0.textColor = planCompareLinkAttributes.color
            $0.font = planCompareLinkAttributes.font
        }
        
        SubHeadingTitleLabel.appearance().with {
            $0.textColor = subHeadingTitleAttributes.color
            $0.font = subHeadingTitleAttributes.font
        }
        
        OfferBannerHeaderLabel.appearance().with {
            $0.textColor = offerBannerHeaderAttributes.color
            $0.font = offerBannerHeaderAttributes.font
        }
        
        OfferBannerDescriptionLabel.appearance().with {
            $0.textColor = offerBannerDescriptionAttributes.color
            $0.font = offerBannerDescriptionAttributes.font
        }
         
        AppGenericInfoViewButton.appearance().with {
            $0.setTitleColor(genericInfoViewCTAThemeAttributes.color, for: .normal)
            $0.titleLabelFont = genericInfoViewCTAThemeAttributes.font
        }
        
        GenericInfoViewCTADescLabel.appearance().with {
            $0.textColor = genericInfoViewDescTextAttributes.color
            $0.font = genericInfoViewDescTextAttributes.font
        }
        
        DigitalServicesHeaderLabel.appearance().with {
            $0.textColor = digitalServicesHeaderTextAttributes.color
            $0.font = digitalServicesHeaderTextAttributes.font
        }
        
        DigitalServicesTitleLabel.appearance().with {
            $0.textColor = digitalServicesTitleTextAttributes.color
            $0.font = digitalServicesTitleTextAttributes.font
        }
        
        ValidationLabel.appearance().with {
            $0.textColor = validationTextAttributes.color
            $0.font = validationTextAttributes.font
        }
        
        CommentsTextView.appearance().with {
            $0.borderColor = lineColor
            $0.borderWidth = 1
            $0.cornerRadius = 5
        }
        
        ToastView.appearance().with {
            $0.cornerRadius = 5
            $0.backgroundColor = toastBgColor
            $0.clipsToBounds = true
            $0.alpha = 0.0
        }
        
        ToastLabel.appearance().with {
            $0.textColor = toastTextThemeAttributes.color
            $0.font = toastTextThemeAttributes.font
            $0.clipsToBounds = true
            $0.numberOfLines = 0
            $0.lineBreakMode = .byWordWrapping
        }
        
        InternetUsageHeaderLabel.appearance().with {
            $0.textColor = internetUsageHeaderTextAttributes.color
            $0.font = internetUsageHeaderTextAttributes.font
        }
        
        InternetUsageSpeedTitleLabel.appearance().with {
            $0.textColor = internetUsageSpeedTitleTextAttributes.color
            $0.font = internetUsageSpeedTitleTextAttributes.font
        }
        
        InternetUsageSpeedAmountLabel.appearance().with {
            $0.textColor = internetUsageSpeedAmountTextAttributes.color
            $0.font = internetUsageSpeedAmountTextAttributes.font
        }
        
        GraphUsageLabel.appearance().with {
            $0.textColor = graphUsageAttributes.color
            $0.font = graphUsageAttributes.font
        }
        
        GraphPlanDateLabel.appearance().with {
            $0.textColor = graphUsageAttributes.color
            $0.font = graphUsageAttributes.font
        }
        
        
        AppSeparator.appearance().backgroundColor = separatorColor
        AppBottomBorder.appearance().backgroundColor = bottomBorderColor
        OverageUnderLineView.appearance().backgroundColor = overageUnderLineBackgroundColor
        extend()
        // Ensure existing views render with new theme
        application.windows.reload()
    }
    
    func extend() {
        // Optionally extend theme
    }
}
