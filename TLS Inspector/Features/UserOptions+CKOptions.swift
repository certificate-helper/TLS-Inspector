import UIKit
import CertificateKit

extension UserOptions {
    public static func getterParameters(hostAddress: String) -> CKGetterParameters {
        let parameters = CKGetterParameters()

        parameters.hostAddress = hostAddress
        parameters.queryServerInfo = UserOptions.getHTTPHeaders
        parameters.checkOCSP = UserOptions.queryOCSP
        parameters.checkCRL = UserOptions.checkCRL
        switch UserOptions.cryptoEngine {
        case .NetworkFramework:
            parameters.cryptoEngine = CRYPTO_ENGINE_NETWORK_FRAMEWORK
        case .SecureTransport:
            parameters.cryptoEngine = CRYPTO_ENGINE_SECURE_TRANSPORT
        case .OpenSSL:
            parameters.cryptoEngine = CRYPTO_ENGINE_OPENSSL
        }
        parameters.ciphers = UserOptions.preferredCiphers

        switch UserOptions.ipVersion {
        case .Automatic:
            parameters.ipVersion = IP_VERSION_AUTOMATIC
        case .IPv4:
            parameters.ipVersion = IP_VERSION_IPV4
        case .IPv6:
            parameters.ipVersion = IP_VERSION_IPV6
        }

        return parameters
    }
}
