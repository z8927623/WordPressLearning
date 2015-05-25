#!/bin/sh
set -e

mkdir -p "${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}"

RESOURCES_TO_COPY=${PODS_ROOT}/resources-to-copy-${TARGETNAME}.txt
> "$RESOURCES_TO_COPY"

install_resource()
{
  case $1 in
    *.storyboard)
      echo "ibtool --reference-external-strings-file --errors --warnings --notices --output-format human-readable-text --compile ${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename \"$1\" .storyboard`.storyboardc ${PODS_ROOT}/$1 --sdk ${SDKROOT}"
      ibtool --reference-external-strings-file --errors --warnings --notices --output-format human-readable-text --compile "${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename \"$1\" .storyboard`.storyboardc" "${PODS_ROOT}/$1" --sdk "${SDKROOT}"
      ;;
    *.xib)
        echo "ibtool --reference-external-strings-file --errors --warnings --notices --output-format human-readable-text --compile ${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename \"$1\" .xib`.nib ${PODS_ROOT}/$1 --sdk ${SDKROOT}"
      ibtool --reference-external-strings-file --errors --warnings --notices --output-format human-readable-text --compile "${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename \"$1\" .xib`.nib" "${PODS_ROOT}/$1" --sdk "${SDKROOT}"
      ;;
    *.framework)
      echo "mkdir -p ${CONFIGURATION_BUILD_DIR}/${FRAMEWORKS_FOLDER_PATH}"
      mkdir -p "${CONFIGURATION_BUILD_DIR}/${FRAMEWORKS_FOLDER_PATH}"
      echo "rsync -av ${PODS_ROOT}/$1 ${CONFIGURATION_BUILD_DIR}/${FRAMEWORKS_FOLDER_PATH}"
      rsync -av "${PODS_ROOT}/$1" "${CONFIGURATION_BUILD_DIR}/${FRAMEWORKS_FOLDER_PATH}"
      ;;
    *.xcdatamodel)
      echo "xcrun momc \"${PODS_ROOT}/$1\" \"${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename "$1"`.mom\""
      xcrun momc "${PODS_ROOT}/$1" "${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename "$1" .xcdatamodel`.mom"
      ;;
    *.xcdatamodeld)
      echo "xcrun momc \"${PODS_ROOT}/$1\" \"${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename "$1" .xcdatamodeld`.momd\""
      xcrun momc "${PODS_ROOT}/$1" "${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename "$1" .xcdatamodeld`.momd"
      ;;
    *.xcmappingmodel)
      echo "xcrun mapc \"${PODS_ROOT}/$1\" \"${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename "$1" .xcmappingmodel`.cdm\""
      xcrun mapc "${PODS_ROOT}/$1" "${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename "$1" .xcmappingmodel`.cdm"
      ;;
    *.xcassets)
      ;;
    /*)
      echo "$1"
      echo "$1" >> "$RESOURCES_TO_COPY"
      ;;
    *)
      echo "${PODS_ROOT}/$1"
      echo "${PODS_ROOT}/$1" >> "$RESOURCES_TO_COPY"
      ;;
  esac
}
          install_resource "1PasswordExtension/1Password.xcassets"
                    install_resource "Helpshift/helpshift-sdk-ios-v4.10.2/HSResources/HS-Attachment.png"
                    install_resource "Helpshift/helpshift-sdk-ios-v4.10.2/HSResources/HS-Attachment@2x.png"
                    install_resource "Helpshift/helpshift-sdk-ios-v4.10.2/HSResources/HS-Attachment@3x.png"
                    install_resource "Helpshift/helpshift-sdk-ios-v4.10.2/HSResources/HS-camera-button.png"
                    install_resource "Helpshift/helpshift-sdk-ios-v4.10.2/HSResources/HS-camera-button@2x.png"
                    install_resource "Helpshift/helpshift-sdk-ios-v4.10.2/HSResources/HS-camera-button@3x.png"
                    install_resource "Helpshift/helpshift-sdk-ios-v4.10.2/HSResources/HS-delete-button.png"
                    install_resource "Helpshift/helpshift-sdk-ios-v4.10.2/HSResources/HS-delete-button@2x.png"
                    install_resource "Helpshift/helpshift-sdk-ios-v4.10.2/HSResources/HS-delete-button@3x.png"
                    install_resource "Helpshift/helpshift-sdk-ios-v4.10.2/HSResources/HS-no-connection.png"
                    install_resource "Helpshift/helpshift-sdk-ios-v4.10.2/HSResources/HS-no-connection@2x.png"
                    install_resource "Helpshift/helpshift-sdk-ios-v4.10.2/HSResources/HS-powered-by-logo.png"
                    install_resource "Helpshift/helpshift-sdk-ios-v4.10.2/HSResources/HS-powered-by-logo@2x.png"
                    install_resource "Helpshift/helpshift-sdk-ios-v4.10.2/HSResources/HS-powered-by-logo@3x.png"
                    install_resource "Helpshift/helpshift-sdk-ios-v4.10.2/HSResources/HS-screenshot-error.png"
                    install_resource "Helpshift/helpshift-sdk-ios-v4.10.2/HSResources/HS-screenshot-error@2x.png"
                    install_resource "Helpshift/helpshift-sdk-ios-v4.10.2/HSResources/HSChatBubbleBlue.png"
                    install_resource "Helpshift/helpshift-sdk-ios-v4.10.2/HSResources/HSChatBubbleBlue@2x.png"
                    install_resource "Helpshift/helpshift-sdk-ios-v4.10.2/HSResources/HSChatBubbleBlue@3x.png"
                    install_resource "Helpshift/helpshift-sdk-ios-v4.10.2/HSResources/HSChatBubbleWhite.png"
                    install_resource "Helpshift/helpshift-sdk-ios-v4.10.2/HSResources/HSChatBubbleWhite@2x.png"
                    install_resource "Helpshift/helpshift-sdk-ios-v4.10.2/HSResources/HSChatBubbleWhite@3x.png"
                    install_resource "Helpshift/helpshift-sdk-ios-v4.10.2/HSResources/HSConfirmBox.png"
                    install_resource "Helpshift/helpshift-sdk-ios-v4.10.2/HSResources/HSConfirmBox@2x.png"
                    install_resource "Helpshift/helpshift-sdk-ios-v4.10.2/HSResources/HSTutorial.png"
                    install_resource "Helpshift/helpshift-sdk-ios-v4.10.2/HSResources/HSTutorial@2x.png"
                    install_resource "Helpshift/helpshift-sdk-ios-v4.10.2/HSResources/HSTutorial@3x.png"
                    install_resource "Helpshift/helpshift-sdk-ios-v4.10.2/HSResources/HSTutorialiPad.png"
                    install_resource "Helpshift/helpshift-sdk-ios-v4.10.2/HSResources/HSTutorialiPad@2x.png"
                    install_resource "Helpshift/helpshift-sdk-ios-v4.10.2/HSResources/HSTutorialiPad@3x.png"
                    install_resource "Lookback/lookback/HD/Lookback.framework/Versions/A/Resources/GFSettings.storyboard"
                    install_resource "Lookback/lookback/HD/Lookback.framework/Versions/A/Resources/lookback-assets.xcassets"
                    install_resource "Mixpanel/Mixpanel/Media.xcassets/MPArrowLeft.imageset/MPArrowLeft.png"
                    install_resource "Mixpanel/Mixpanel/Media.xcassets/MPArrowLeft.imageset/MPArrowLeft@2x.png"
                    install_resource "Mixpanel/Mixpanel/Media.xcassets/MPArrowRight.imageset/MPArrowRight.png"
                    install_resource "Mixpanel/Mixpanel/Media.xcassets/MPArrowRight.imageset/MPArrowRight@2x.png"
                    install_resource "Mixpanel/Mixpanel/Media.xcassets/MPCheckmark.imageset/MPCheckmark.png"
                    install_resource "Mixpanel/Mixpanel/Media.xcassets/MPCheckmark.imageset/MPCheckmark@2x.png"
                    install_resource "Mixpanel/Mixpanel/Media.xcassets/MPCloseBtn.imageset/MPCloseBtn.png"
                    install_resource "Mixpanel/Mixpanel/Media.xcassets/MPCloseBtn.imageset/MPCloseBtn@2x.png"
                    install_resource "Mixpanel/Mixpanel/Media.xcassets/MPDismissKeyboard.imageset/MPDismissKeyboard.png"
                    install_resource "Mixpanel/Mixpanel/Media.xcassets/MPDismissKeyboard.imageset/MPDismissKeyboard@2x.png"
                    install_resource "Mixpanel/Mixpanel/Media.xcassets/MPLogo.imageset/MPLogo.png"
                    install_resource "Mixpanel/Mixpanel/Media.xcassets/MPLogo.imageset/MPLogo@2x.png"
                    install_resource "Mixpanel/Mixpanel/MPCloseBtn.png"
                    install_resource "Mixpanel/Mixpanel/MPCloseBtn@2x.png"
                    install_resource "Mixpanel/Mixpanel/MPNotification.storyboard"
                    install_resource "Mixpanel/Mixpanel/MPSurvey.storyboard"
                    install_resource "SVProgressHUD/SVProgressHUD/SVProgressHUD.bundle"
                    install_resource "WordPress-AppbotX/Classes/AppbotX.bundle"
                    install_resource "WordPress-iOS-Editor/Assets/icon-posts-editor-inspector.png"
                    install_resource "WordPress-iOS-Editor/Assets/icon-posts-editor-inspector@2x.png"
                    install_resource "WordPress-iOS-Editor/Assets/icon-posts-editor-inspector@3x.png"
                    install_resource "WordPress-iOS-Editor/Assets/icon-posts-editor-preview.png"
                    install_resource "WordPress-iOS-Editor/Assets/icon-posts-editor-preview@2x.png"
                    install_resource "WordPress-iOS-Editor/Assets/icon-posts-editor-preview@3x.png"
                    install_resource "WordPress-iOS-Editor/Assets/icon_format_bold.png"
                    install_resource "WordPress-iOS-Editor/Assets/icon_format_bold@2x.png"
                    install_resource "WordPress-iOS-Editor/Assets/icon_format_bold@3x.png"
                    install_resource "WordPress-iOS-Editor/Assets/icon_format_bold_highlighted.png"
                    install_resource "WordPress-iOS-Editor/Assets/icon_format_bold_highlighted@2x.png"
                    install_resource "WordPress-iOS-Editor/Assets/icon_format_bold_highlighted@3x.png"
                    install_resource "WordPress-iOS-Editor/Assets/icon_format_html.png"
                    install_resource "WordPress-iOS-Editor/Assets/icon_format_html@2x.png"
                    install_resource "WordPress-iOS-Editor/Assets/icon_format_html@3x.png"
                    install_resource "WordPress-iOS-Editor/Assets/icon_format_html_highlighted.png"
                    install_resource "WordPress-iOS-Editor/Assets/icon_format_html_highlighted@2x.png"
                    install_resource "WordPress-iOS-Editor/Assets/icon_format_html_highlighted@3x.png"
                    install_resource "WordPress-iOS-Editor/Assets/icon_format_italic.png"
                    install_resource "WordPress-iOS-Editor/Assets/icon_format_italic@2x.png"
                    install_resource "WordPress-iOS-Editor/Assets/icon_format_italic@3x.png"
                    install_resource "WordPress-iOS-Editor/Assets/icon_format_italic_highlighted.png"
                    install_resource "WordPress-iOS-Editor/Assets/icon_format_italic_highlighted@2x.png"
                    install_resource "WordPress-iOS-Editor/Assets/icon_format_italic_highlighted@3x.png"
                    install_resource "WordPress-iOS-Editor/Assets/icon_format_keyboard.png"
                    install_resource "WordPress-iOS-Editor/Assets/icon_format_keyboard@2x.png"
                    install_resource "WordPress-iOS-Editor/Assets/icon_format_keyboard_highlighted.png"
                    install_resource "WordPress-iOS-Editor/Assets/icon_format_keyboard_highlighted@2x.png"
                    install_resource "WordPress-iOS-Editor/Assets/icon_format_link.png"
                    install_resource "WordPress-iOS-Editor/Assets/icon_format_link@2x.png"
                    install_resource "WordPress-iOS-Editor/Assets/icon_format_link@3x.png"
                    install_resource "WordPress-iOS-Editor/Assets/icon_format_link_highlighted.png"
                    install_resource "WordPress-iOS-Editor/Assets/icon_format_link_highlighted@2x.png"
                    install_resource "WordPress-iOS-Editor/Assets/icon_format_link_highlighted@3x.png"
                    install_resource "WordPress-iOS-Editor/Assets/icon_format_media.png"
                    install_resource "WordPress-iOS-Editor/Assets/icon_format_media@2x.png"
                    install_resource "WordPress-iOS-Editor/Assets/icon_format_media@3x.png"
                    install_resource "WordPress-iOS-Editor/Assets/icon_format_media_highlighted.png"
                    install_resource "WordPress-iOS-Editor/Assets/icon_format_media_highlighted@2x.png"
                    install_resource "WordPress-iOS-Editor/Assets/icon_format_media_highlighted@3x.png"
                    install_resource "WordPress-iOS-Editor/Assets/icon_format_more.png"
                    install_resource "WordPress-iOS-Editor/Assets/icon_format_more@2x.png"
                    install_resource "WordPress-iOS-Editor/Assets/icon_format_more@3x.png"
                    install_resource "WordPress-iOS-Editor/Assets/icon_format_more_highlighted.png"
                    install_resource "WordPress-iOS-Editor/Assets/icon_format_more_highlighted@2x.png"
                    install_resource "WordPress-iOS-Editor/Assets/icon_format_more_highlighted@3x.png"
                    install_resource "WordPress-iOS-Editor/Assets/icon_format_ol.png"
                    install_resource "WordPress-iOS-Editor/Assets/icon_format_ol@2x.png"
                    install_resource "WordPress-iOS-Editor/Assets/icon_format_ol@3x.png"
                    install_resource "WordPress-iOS-Editor/Assets/icon_format_ol_highlighted.png"
                    install_resource "WordPress-iOS-Editor/Assets/icon_format_ol_highlighted@2x.png"
                    install_resource "WordPress-iOS-Editor/Assets/icon_format_ol_highlighted@3x.png"
                    install_resource "WordPress-iOS-Editor/Assets/icon_format_quote.png"
                    install_resource "WordPress-iOS-Editor/Assets/icon_format_quote@2x.png"
                    install_resource "WordPress-iOS-Editor/Assets/icon_format_quote@3x.png"
                    install_resource "WordPress-iOS-Editor/Assets/icon_format_quote_highlighted.png"
                    install_resource "WordPress-iOS-Editor/Assets/icon_format_quote_highlighted@2x.png"
                    install_resource "WordPress-iOS-Editor/Assets/icon_format_quote_highlighted@3x.png"
                    install_resource "WordPress-iOS-Editor/Assets/icon_format_strikethrough.png"
                    install_resource "WordPress-iOS-Editor/Assets/icon_format_strikethrough@2x.png"
                    install_resource "WordPress-iOS-Editor/Assets/icon_format_strikethrough@3x.png"
                    install_resource "WordPress-iOS-Editor/Assets/icon_format_strikethrough_highlighted.png"
                    install_resource "WordPress-iOS-Editor/Assets/icon_format_strikethrough_highlighted@2x.png"
                    install_resource "WordPress-iOS-Editor/Assets/icon_format_strikethrough_highlighted@3x.png"
                    install_resource "WordPress-iOS-Editor/Assets/icon_format_ul.png"
                    install_resource "WordPress-iOS-Editor/Assets/icon_format_ul@2x.png"
                    install_resource "WordPress-iOS-Editor/Assets/icon_format_ul@3x.png"
                    install_resource "WordPress-iOS-Editor/Assets/icon_format_ul_highlighted.png"
                    install_resource "WordPress-iOS-Editor/Assets/icon_format_ul_highlighted@2x.png"
                    install_resource "WordPress-iOS-Editor/Assets/icon_format_ul_highlighted@3x.png"
                    install_resource "WordPress-iOS-Editor/Assets/icon_format_underline.png"
                    install_resource "WordPress-iOS-Editor/Assets/icon_format_underline@2x.png"
                    install_resource "WordPress-iOS-Editor/Assets/icon_format_underline_highlighted.png"
                    install_resource "WordPress-iOS-Editor/Assets/icon_format_underline_highlighted@2x.png"
                    install_resource "WordPress-iOS-Editor/Assets/icon_format_unlink.png"
                    install_resource "WordPress-iOS-Editor/Assets/icon_format_unlink@2x.png"
                    install_resource "WordPress-iOS-Editor/Assets/icon_format_unlink_highlighted.png"
                    install_resource "WordPress-iOS-Editor/Assets/icon_format_unlink_highlighted@2x.png"
                    install_resource "WordPress-iOS-Editor/Assets/icon_options.png"
                    install_resource "WordPress-iOS-Editor/Assets/icon_options@2x.png"
                    install_resource "WordPress-iOS-Editor/Assets/icon_preview.png"
                    install_resource "WordPress-iOS-Editor/Assets/icon_preview@2x.png"
                    install_resource "WordPress-iOS-Editor/Assets/ZSSbgcolor.png"
                    install_resource "WordPress-iOS-Editor/Assets/ZSSbgcolor@2x.png"
                    install_resource "WordPress-iOS-Editor/Assets/ZSScenterjustify.png"
                    install_resource "WordPress-iOS-Editor/Assets/ZSScenterjustify@2x.png"
                    install_resource "WordPress-iOS-Editor/Assets/ZSSclearstyle.png"
                    install_resource "WordPress-iOS-Editor/Assets/ZSSclearstyle@2x.png"
                    install_resource "WordPress-iOS-Editor/Assets/ZSSforcejustify.png"
                    install_resource "WordPress-iOS-Editor/Assets/ZSSforcejustify@2x.png"
                    install_resource "WordPress-iOS-Editor/Assets/ZSSh1.png"
                    install_resource "WordPress-iOS-Editor/Assets/ZSSh1@2x.png"
                    install_resource "WordPress-iOS-Editor/Assets/ZSSh2.png"
                    install_resource "WordPress-iOS-Editor/Assets/ZSSh2@2x.png"
                    install_resource "WordPress-iOS-Editor/Assets/ZSSh3.png"
                    install_resource "WordPress-iOS-Editor/Assets/ZSSh3@2x.png"
                    install_resource "WordPress-iOS-Editor/Assets/ZSSh4.png"
                    install_resource "WordPress-iOS-Editor/Assets/ZSSh4@2x.png"
                    install_resource "WordPress-iOS-Editor/Assets/ZSSh5.png"
                    install_resource "WordPress-iOS-Editor/Assets/ZSSh5@2x.png"
                    install_resource "WordPress-iOS-Editor/Assets/ZSSh6.png"
                    install_resource "WordPress-iOS-Editor/Assets/ZSSh6@2x.png"
                    install_resource "WordPress-iOS-Editor/Assets/ZSShorizontalrule.png"
                    install_resource "WordPress-iOS-Editor/Assets/ZSShorizontalrule@2x.png"
                    install_resource "WordPress-iOS-Editor/Assets/ZSSindent.png"
                    install_resource "WordPress-iOS-Editor/Assets/ZSSindent@2x.png"
                    install_resource "WordPress-iOS-Editor/Assets/ZSSleftjustify.png"
                    install_resource "WordPress-iOS-Editor/Assets/ZSSleftjustify@2x.png"
                    install_resource "WordPress-iOS-Editor/Assets/ZSSoutdent.png"
                    install_resource "WordPress-iOS-Editor/Assets/ZSSoutdent@2x.png"
                    install_resource "WordPress-iOS-Editor/Assets/ZSSquicklink.png"
                    install_resource "WordPress-iOS-Editor/Assets/ZSSquicklink@2x.png"
                    install_resource "WordPress-iOS-Editor/Assets/ZSSredo.png"
                    install_resource "WordPress-iOS-Editor/Assets/ZSSredo@2x.png"
                    install_resource "WordPress-iOS-Editor/Assets/ZSSrightjustify.png"
                    install_resource "WordPress-iOS-Editor/Assets/ZSSrightjustify@2x.png"
                    install_resource "WordPress-iOS-Editor/Assets/ZSSsubscript.png"
                    install_resource "WordPress-iOS-Editor/Assets/ZSSsubscript@2x.png"
                    install_resource "WordPress-iOS-Editor/Assets/ZSSsuperscript.png"
                    install_resource "WordPress-iOS-Editor/Assets/ZSSsuperscript@2x.png"
                    install_resource "WordPress-iOS-Editor/Assets/ZSStextcolor.png"
                    install_resource "WordPress-iOS-Editor/Assets/ZSStextcolor@2x.png"
                    install_resource "WordPress-iOS-Editor/Assets/ZSSundo.png"
                    install_resource "WordPress-iOS-Editor/Assets/ZSSundo@2x.png"
                    install_resource "WordPress-iOS-Editor/Assets/editor.html"
                    install_resource "WordPress-iOS-Editor/Assets/jquery.js"
                    install_resource "WordPress-iOS-Editor/Assets/jquery.mobile-events.min.js"
                    install_resource "WordPress-iOS-Editor/Assets/js-beautifier.js"
                    install_resource "WordPress-iOS-Editor/Assets/rangy-core.js"
                    install_resource "WordPress-iOS-Editor/Assets/rangy-cssclassapplier.js"
                    install_resource "WordPress-iOS-Editor/Assets/rangy-selectionsaverestore.js"
                    install_resource "WordPress-iOS-Editor/Assets/rangy-serializer.js"
                    install_resource "WordPress-iOS-Editor/Assets/shortcode.js"
                    install_resource "WordPress-iOS-Editor/Assets/underscore-min.js"
                    install_resource "WordPress-iOS-Editor/Assets/WPHybridCallbacker.js"
                    install_resource "WordPress-iOS-Editor/Assets/WPHybridLogger.js"
                    install_resource "WordPress-iOS-Editor/Assets/wpload.js"
                    install_resource "WordPress-iOS-Editor/Assets/wpsave.js"
                    install_resource "WordPress-iOS-Editor/Assets/ZSSRichTextEditor.js"
                    install_resource "WordPress-iOS-Editor/Assets/wpposter.svg"
                    install_resource "WordPress-iOS-Editor/Assets/editor.css"
                    install_resource "google-plus-ios-sdk/google-plus-ios-sdk-1.7.1/GooglePlus.bundle"
                    install_resource "${BUILT_PRODUCTS_DIR}/DataModel.bundle"
                    install_resource "${BUILT_PRODUCTS_DIR}/HockeySDKResources.bundle"
                    install_resource "${BUILT_PRODUCTS_DIR}/WPMediaPicker.bundle"
                    install_resource "${BUILT_PRODUCTS_DIR}/WordPress-iOS-Shared.bundle"
                    install_resource "${BUILT_PRODUCTS_DIR}/WordPressCom-Stats-iOS.bundle"
          
rsync -avr --copy-links --no-relative --exclude '*/.svn/*' --files-from="$RESOURCES_TO_COPY" / "${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}"
if [[ "${ACTION}" == "install" ]]; then
  rsync -avr --copy-links --no-relative --exclude '*/.svn/*' --files-from="$RESOURCES_TO_COPY" / "${INSTALL_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}"
fi
rm -f "$RESOURCES_TO_COPY"

if [[ -n "${WRAPPER_EXTENSION}" ]] && [ "`xcrun --find actool`" ] && [ `find . -name '*.xcassets' | wc -l` -ne 0 ]
then
  case "${TARGETED_DEVICE_FAMILY}" in
    1,2)
      TARGET_DEVICE_ARGS="--target-device ipad --target-device iphone"
      ;;
    1)
      TARGET_DEVICE_ARGS="--target-device iphone"
      ;;
    2)
      TARGET_DEVICE_ARGS="--target-device ipad"
      ;;
    *)
      TARGET_DEVICE_ARGS="--target-device mac"
      ;;
  esac
  find "${PWD}" -name "*.xcassets" -print0 | xargs -0 actool --output-format human-readable-text --notices --warnings --platform "${PLATFORM_NAME}" --minimum-deployment-target "${IPHONEOS_DEPLOYMENT_TARGET}" ${TARGET_DEVICE_ARGS} --compress-pngs --compile "${BUILT_PRODUCTS_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}"
fi
