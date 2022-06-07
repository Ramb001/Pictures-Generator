import UIKit

class ViewController: UIViewController {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        return imageView
    }()
    
    private let saveButton: UIButton = {
        let saveButton = UIButton()
        saveButton.backgroundColor = .white
        saveButton.setTitle("Save image", for: .normal)
        saveButton.setTitleColor(.black, for: .normal)
        return saveButton
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Next photo", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    let colors: [UIColor] = [
        .systemRed,
        .systemBlue,
        .systemPink,
        .systemMint,
        .systemGreen,
        .systemGray,
        .systemOrange,
        .systemIndigo,
        .systemPurple
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
        view.addSubview(imageView)
        imageView.frame = CGRect(x: 0, y: 0, width: 375, height: 375)
        imageView.center = view.center
        view.addSubview(button)
        view.addSubview(saveButton)
        getRandomPhoto()
        button.addTarget(self, action: #selector(newPhotoTapButton), for: .touchUpInside)
        saveButton.addTarget(self, action: #selector(saveImg), for: .touchUpInside)
    }
    
    @IBAction func saveImg(_ sender: UIButton) {
            let alert = UIAlertController(title: "SOON", message: "Feature in development", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    
    @objc func newPhotoTapButton(){
        getRandomPhoto()
        view.backgroundColor = colors.randomElement()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        button.frame = CGRect(
            x: 20,
            y: view.frame.size.height-110-view.safeAreaInsets.bottom,
            width: view.frame.size.width-40,
            height: 50)
        button.layer.cornerRadius = 12
        saveButton.frame = CGRect(
            x: 20,
            y: view.frame.size.height-50-view.safeAreaInsets.bottom,
            width: view.frame.size.width-40,
            height: 50)
        saveButton.layer.cornerRadius = 12
        
    }
    
    func getRandomPhoto(){
        let urlString =
            "https://picsum.photos/600"
        let url = URL(string: urlString)!
        guard let data = try? Data(contentsOf: url) else {
            return
        }
        imageView.image = UIImage(data: data)
    }
}

