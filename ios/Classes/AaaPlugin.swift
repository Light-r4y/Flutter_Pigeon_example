import Flutter
import UIKit

class AaaApiImpl:AaaFlutterApi, AaaApi{
    
    init(binaryMessenger: FlutterBinaryMessenger) {
        super.init(binaryMessenger: binaryMessenger)
    }
    
    func bbb(name: String, completion: @escaping (Result<String, Error>) -> Void) {
        print("native bbb(): " + name)
        completion(.success("bbb: " + name))
//        ccc { result in
//            switch result{
//            case .success(()):
//                print("Func ccc Success")
//                return
//            case .failure(let error):
//                print("Func ccc error: " + error.message!)
//            }
//            
//        }
        ddd()

    }
    
    func ddd(){
        ccc{ result in
            switch result{
            case .success(()):
                print("Func ddd->ccc() Success")
            case .failure(let error):
                print("Func ddd->ccc() error: " + error.message!)
            }
        }
    }

}


public class AaaPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let instance = AaaApiImpl(binaryMessenger: registrar.messenger())
        AaaApiSetup.setUp(binaryMessenger: registrar.messenger(), api: instance)
    }
}
