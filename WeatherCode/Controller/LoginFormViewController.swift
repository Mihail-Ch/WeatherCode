//
//  LoginFormViewController.swift
//  WeatherCode
//
//  Created by Михаил Чертов on 14.05.2023.
//

import UIKit

class LoginFormViewController: UIViewController {
    
    //MARK: - UI
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = true
        scrollView.isDirectionalLockEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        //scrollView.backgroundColor = .blue
      //  scrollView.frame = view.bounds
      //  scrollView.contentSize = contentSize
        return scrollView
    }()
    
//    private var contentSize: CGSize {
//        CGSize(width: view.frame.width, height: view.frame.height + 400)
//    }
    
    private lazy var titleWeather: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 40)
      //  label.font = UIFont(name: "", size: 40)
        label.text = "Weather"
        return label
    }()
    
    private lazy var loginTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20)
        label.text = "Login"
        return label
    }()
    
    private lazy var loginTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.placeholder = "input email"
        return textField
    }()
    
    private lazy var passwordTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20)
        label.text = "Password"
        return label
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.placeholder = "input password"
        return textField
    }()
    
    private lazy var inputButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("input", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.tintColor = .black
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 7
        button.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
        return button
    }()
    
    //MARK: - Life Cicle
    
    override func loadView() {
        super.loadView()
        addUI()
        createUIConstraints()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //убираем клавиатуру по нажатию
        hideKeyboardGesture()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    //MARK: - Create UI
    
    private func addUI() {
        view.addSubview(scrollView)
        scrollView.addSubview(titleWeather)
        scrollView.addSubview(loginTitle)
        scrollView.addSubview(loginTextField)
        scrollView.addSubview(passwordTitle)
        scrollView.addSubview(passwordTextField)
        scrollView.addSubview(inputButton)
    }
    
    private func createUIConstraints() {

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            titleWeather.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor, constant: 70),
            titleWeather.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            
            loginTitle.topAnchor.constraint(equalTo: titleWeather.bottomAnchor, constant: 50),
            loginTitle.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),

            loginTextField.topAnchor.constraint(equalTo: loginTitle.bottomAnchor, constant: 10),
            loginTextField.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            loginTextField.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor, constant: 20),
            loginTextField.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor, constant: 20),
            
            passwordTitle.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 20),
            passwordTitle.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            
            passwordTextField.topAnchor.constraint(equalTo: passwordTitle.bottomAnchor, constant: 10),
            passwordTextField.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor, constant: 20),
            passwordTextField.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor, constant: 20),
            
            inputButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 40),
            inputButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            inputButton.widthAnchor.constraint(equalToConstant: scrollView.bounds.width / 2),
            inputButton.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor, constant: 20)
        ])
    }
    
    // MARK: - objc && func
    
    @objc func loginButtonPressed(_ sender: UIButton!) {
        let login = loginTextField.text
        let password = passwordTextField.text
        
        if login == "admin" && password == "123456" {
            print("Успешная авторизация")
        } else {
            print("Неуспешная авторизация")
        }
        
    }
    
    private func hideKeyboardGesture() {
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        scrollView.addGestureRecognizer(hideKeyboardGesture)
    }
    
    //Keyboard appears
    
    @objc func keyboardWasShown(notification: Notification) {
        // size
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
        
        self.scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }
    
    // Keyboard disappears
    
    @objc func keyboardWillBeHidden(notification: Notification) {
        // Indentation at the scrollView, 0
        let contentInsets = UIEdgeInsets.zero
        scrollView.contentInset = contentInsets
    }
    
    @objc func hideKeyboard() {
        self.scrollView.endEditing(true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
