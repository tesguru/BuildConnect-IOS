import SwiftUI

extension Font {
    static func interRegular(_ size: CGFloat) -> Font {
        Font.custom("Inter_18pt-Regular", size: size)
    }

    static func interMedium(_ size: CGFloat) -> Font {
        Font.custom("Inter_18pt-Medium", size: size)
    }

    static func interBold(_ size: CGFloat) -> Font {
        Font.custom("Inter_18pt-Bold", size: size)
    }

    static func interExtraBold(_ size: CGFloat) -> Font {
        Font.custom("Inter_18pt-ExtraBold", size: size)
    }

    static func workSansRegular(_ size: CGFloat) -> Font {
        Font.custom("WorkSans-Regular", size: size)
    }

    static func workSansMedium(_ size: CGFloat) -> Font {
        Font.custom("WorkSans-Medium", size: size)
    }

    static func workSansSemiBold(_ size: CGFloat) -> Font {
        Font.custom("WorkSans-SemiBold", size: size)
    }

    static func workSansExtraBold(_ size: CGFloat) -> Font {
        Font.custom("WorkSans-ExtraBold", size: size)
    }
}
