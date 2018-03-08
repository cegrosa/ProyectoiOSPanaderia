import UIKit

class ProductImages: UIImage{
    static func downloadImage(imageName: String){
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        let urlImagen = "https://ios-vicjod.c9users.io/img/\(imageName).jpg"
        if let url = URL(string: urlImagen) {
            let cola = DispatchQueue(label: "bajar.imagen",
                                     qos: .default,
                                     attributes: .concurrent)
            cola.async {
                if let data = try? Data(contentsOf: url),
                    let imagen = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.save(data: data, name: "\(imageName).jpg")
                        UIApplication.shared.isNetworkActivityIndicatorVisible = false
                        print("Guardada")
                    }
                }
            }
        }
    }
    
    private static func read(name: String) -> UIImage {
        let paths = FileManager.default.urls(for: .documentDirectory,
                                             in: .userDomainMask)
        let imagePath = paths[0].appendingPathComponent(name)
        return UIImage(contentsOfFile: imagePath.path)!
    }
    
    private static func save(data: Data, name: String) {
        let paths = FileManager.default.urls(for: .documentDirectory,
                                             in: .userDomainMask)
        let imagePathJPG = paths[0].appendingPathComponent(name + ".jpg")
        let imagePathPNG = paths[0].appendingPathComponent(name + ".png")
        print(imagePathJPG)
        print(imagePathPNG)
        DispatchQueue.global(qos: DispatchQoS.background.qosClass).async {
            do {
                let getImage = UIImage(data: data)
                try UIImageJPEGRepresentation(getImage!, 100)?.write(
                    to: imagePathJPG)
                try UIImagePNGRepresentation(getImage!)?.write(to: imagePathPNG)
                print("Ok")
            }
            catch {
                print("Excepcion")
                return
            }
        }
    }
}
