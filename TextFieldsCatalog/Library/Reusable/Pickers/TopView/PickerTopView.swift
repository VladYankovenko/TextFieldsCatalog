//
//  PickerTopView.swift
//  TextFieldsCatalog
//
//  Created by Александр Чаусов on 12/05/2019.
//  Copyright © 2019 Александр Чаусов. All rights reserved.
//

import UIKit

public final class PickerTopView: UIView, ToolBarInterface {

    // MARK: - IBOutlets

    private var topSeparator = UIView()
    private var bottomSeparator = UIView()
    private var returnButton = CommonButton()
    private var leftNavigationButton = IconButton()
    private var rightNavigationButton = IconButton()

    // MARK: - NSLayoutConstraints

    private var leftNavigationButtonWidth: NSLayoutConstraint?

    // MARK: - Public Properties

    public weak var guidedField: GuidedTextField?
    public var configuration = PickerTopViewConfiguration() {
        didSet {
            configureAppearance()
        }
    }

    // MARK: - Initialization

    override public init(frame: CGRect) {
        super.init(frame: frame)
        configureLayout()
        configureAppearance()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    // MARK: - UIView

    override public func awakeFromNib() {
        super.awakeFromNib()
        configureLayout()
        configureAppearance()
    }

    // MARK: - Public Methods

    public func updateNavigationButtons() {
        leftNavigationButton.isHidden = !(guidedField?.havePreviousInput ?? false)
        rightNavigationButton.isHidden = !(guidedField?.haveNextInput ?? false)

        let leftButtonWidth: CGFloat = leftNavigationButton.isHidden ? 0 : 35
        leftNavigationButtonWidth?.constant = leftButtonWidth
        layoutIfNeeded()
    }

}

// MARK: - Configure

private extension PickerTopView {

    func configureAppearance() {
        backgroundColor = configuration.backgroundColor
        configureSeparators()
        configureNavigationButtons()
        configureReturnButton()
    }

    func configureSeparators() {
        topSeparator.backgroundColor = configuration.separatorsColor
        bottomSeparator.backgroundColor = configuration.separatorsColor
    }

    func configureNavigationButtons() {
        leftNavigationButton.setImageForAllState(AssetManager().getImage("leftArrow"),
                                                 normalColor: configuration.button.activeColor,
                                                 pressedColor: configuration.button.highlightedColor)
        leftNavigationButton.addTarget(self, action: #selector(switchToPreviousInput), for: .touchUpInside)
        rightNavigationButton.setImageForAllState(AssetManager().getImage("rightArrow"),
                                                  normalColor: configuration.button.activeColor,
                                                  pressedColor: configuration.button.highlightedColor)
        rightNavigationButton.addTarget(self, action: #selector(switchToNextInput), for: .touchUpInside)
    }

    func configureReturnButton() {
        returnButton.setTitleForAllState(configuration.button.text)
        returnButton.activeTitleColor = configuration.button.activeColor
        returnButton.highlightedTitleColor = configuration.button.highlightedColor
        returnButton.contentEdgeInsets = .init(top: 0, left: 16, bottom: 0, right: 16)
        returnButton.addTarget(self, action: #selector(performAction), for: .touchUpInside)
    }

}

// MARK: - Actions

private extension PickerTopView {

    @objc
    func performAction() {
        guidedField?.processReturnAction()
    }

    @objc
    func switchToPreviousInput() {
        guidedField?.switchToPreviousInput()
    }

    @objc
    func switchToNextInput() {
        guidedField?.switchToNextInput()
    }

}

// MARK: - Layout

private extension PickerTopView {

    func configureLayout() {
        configureTopSeparatorLayout()
        configureReturnButtonLayout()
        configureBottomSeparatorLayout()
        configureLeftNavigationButtonLayout()
        configureRighttNavigationButtonLayout()
    }

    func configureTopSeparatorLayout() {
        addSubview(topSeparator)
        topSeparator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topSeparator.topAnchor.constraint(equalTo: topAnchor),
            topSeparator.leadingAnchor.constraint(equalTo: leadingAnchor),
            topSeparator.trailingAnchor.constraint(equalTo: trailingAnchor),
            topSeparator.heightAnchor.constraint(equalToConstant: 1),
        ])
    }

    func configureReturnButtonLayout() {
        addSubview(returnButton)
        returnButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            returnButton.topAnchor.constraint(equalTo: topAnchor),
            returnButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            returnButton.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    func configureBottomSeparatorLayout() {
        addSubview(bottomSeparator)
        bottomSeparator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bottomSeparator.leadingAnchor.constraint(equalTo: leadingAnchor),
            bottomSeparator.trailingAnchor.constraint(equalTo: trailingAnchor),
            bottomSeparator.bottomAnchor.constraint(equalTo: bottomAnchor),
            bottomSeparator.heightAnchor.constraint(equalToConstant: 1)
        ])
    }

    func configureLeftNavigationButtonLayout() {
        addSubview(leftNavigationButton)
        leftNavigationButton.translatesAutoresizingMaskIntoConstraints = false
        let width = leftNavigationButton.widthAnchor.constraint(equalToConstant: 35)
        NSLayoutConstraint.activate([
            leftNavigationButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            leftNavigationButton.topAnchor.constraint(equalTo: topSeparator.bottomAnchor),
            leftNavigationButton.bottomAnchor.constraint(equalTo: bottomSeparator.topAnchor),
            width
        ])
        self.leftNavigationButtonWidth = width
    }

    func configureRighttNavigationButtonLayout() {
        addSubview(rightNavigationButton)
        rightNavigationButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            rightNavigationButton.leadingAnchor.constraint(equalTo: leftNavigationButton.trailingAnchor),
            rightNavigationButton.topAnchor.constraint(equalTo: topSeparator.bottomAnchor),
            rightNavigationButton.bottomAnchor.constraint(equalTo: bottomSeparator.topAnchor),
            rightNavigationButton.widthAnchor.constraint(equalToConstant: 35)
        ])
    }

}
