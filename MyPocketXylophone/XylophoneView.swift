//
//  XylophoneView.swift
//  MyPocketXylophone
//
//  Created by Юлия Филимонова on 05.07.2022.
//

import UIKit

class XylophoneView: UIView {
    
    weak var delegate: TapDelegate?
    
    private let labels = ["C", "D", "E", "F", "G", "A", "B"]
    private let colors: [UIColor] = [.red, .orange ,.systemYellow, .systemGreen,
                                     .blue, .systemIndigo, .purple]
    
    private let stackButtons: UIStackView = {
        let stackButtons = UIStackView()
        stackButtons.translatesAutoresizingMaskIntoConstraints = false
        stackButtons.alignment = .center
        stackButtons.axis = .vertical
        stackButtons.distribution = .fillEqually
        stackButtons.spacing = 5
        return stackButtons
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemGray5
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(stackButtons)

        NSLayoutConstraint.activate([
            stackButtons.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            stackButtons.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10),
            stackButtons.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackButtons.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])

        for i in labels.indices {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle(labels[i], for: .normal)
            button.setTitleColor(.systemGray2, for: .highlighted)
            button.titleLabel?.font = .boldSystemFont(ofSize: 25)
            button.tintColor = .white
            button.backgroundColor = colors[i]
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.systemGray.cgColor
            button.layer.cornerRadius = 30
            button.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 20) *
                                          (1 - CGFloat(i) * 0.05)).isActive = true
            button.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
            stackButtons.addArrangedSubview(button)
        }
    }

    @objc private func tapAction(_ button: UIButton) {
        guard let note = button.currentTitle else { return }
        delegate?.tapNote(musicNote: note)
    }

}
