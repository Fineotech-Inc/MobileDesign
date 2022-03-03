import Foundation
let imageCache = NSCache<NSString, UIImage>()

extension UIImageView {

    public func loadImageAsync(forURL url: URL?, placeHolderImage: UIImage? = nil) {
        guard let url = url else {
            image = placeHolderImage
            return
        }

        loadImageUsingCache(withUrl: url, placeHolderImage: placeHolderImage)
    }
    
    func loadImageUsingCache(withUrl url : URL, placeHolderImage: UIImage? = nil) {
        // Check cached image
        if let cachedImage = imageCache.object(forKey: url.absoluteString as NSString) {
            image = cachedImage
            return
        }

        let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView(style: .gray)
        addSubview(activityIndicator)
        activityIndicator.startAnimating()
        activityIndicator.center = self.center

        // If not, download image from url
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil, let data = data, let image = UIImage(data: data) else {
                return DispatchQueue.main.async { [weak self] in
                    self?.image = placeHolderImage
                    activityIndicator.removeFromSuperview()
                }
            }

            DispatchQueue.main.async { [weak self] in
                imageCache.setObject(image, forKey: url.absoluteString as NSString)
                self?.image = image
                activityIndicator.removeFromSuperview()
            }
        }.resume()
    }
}
