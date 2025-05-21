//
//  ExchangeDetailView.swift
//  MercadoBitcoin
//
//

import UIKit

final class ExchangeDetailView: UIViewCode {
    private var exchange: Exchange?
    private let sizeFontTitle: CGFloat = 14
    private let sizeFontValue: CGFloat = 16
    
    // MARK: - Components
    private lazy var exchangeIdTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "ID"
        label.font = .systemFont(ofSize: sizeFontTitle, weight: .semibold)
        return label
    }()
    
    private lazy var exchangeIdValueLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: sizeFontValue)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var startTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Start Trade"
        label.font = .systemFont(ofSize: sizeFontTitle, weight: .semibold)
        return label
    }()
    
    private lazy var startValueLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: sizeFontValue)
        return label
    }()
    
    private lazy var endTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "End Trade"
        label.font = .systemFont(ofSize: sizeFontTitle, weight: .semibold)
        return label
    }()
    
    private lazy var endValueLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: sizeFontValue)
        return label
    }()
    
    private lazy var volumeOneHrsTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Volume 1 hour USD"
        label.font = .systemFont(ofSize: sizeFontTitle, weight: .semibold)
        return label
    }()
    
    private lazy var volumeOneHrsValueLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: sizeFontValue)
        return label
    }()
    
    private lazy var volumeOneDayTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Volume 1 day USD"
        label.font = .systemFont(ofSize: sizeFontTitle, weight: .semibold)
        return label
    }()
    
    private lazy var volumeOneDayValueLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: sizeFontValue)
        return label
    }()
    
    private lazy var volumeOneMthTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Volume 1 month USD"
        label.font = .systemFont(ofSize: sizeFontTitle, weight: .semibold)
        return label
    }()
    
    private lazy var volumeOneMthValueLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: sizeFontValue)
        return label
    }()
    
    private lazy var startStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [startTitleLabel, startValueLabel])
        stack.axis = .vertical
        stack.alignment = .leading
        stack.spacing = 4
        return stack
    }()
    
    private lazy var endStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [endTitleLabel, endValueLabel])
        stack.axis = .vertical
        stack.alignment = .leading
        stack.spacing = 4
        return stack
    }()
    
    private lazy var containerDateStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [startStack, endStack])
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        return stack
    }()
    
    private lazy var volumeOneHrsStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [volumeOneHrsTitleLabel, volumeOneHrsValueLabel])
        stack.axis = .vertical
        stack.alignment = .leading
        stack.spacing = 4
        return stack
    }()
    
    private lazy var volumeOneDayStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [volumeOneDayTitleLabel, volumeOneDayValueLabel])
        stack.axis = .vertical
        stack.alignment = .leading
        stack.spacing = 4
        return stack
    }()
    
    private lazy var containerVolumeStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [volumeOneHrsStack, volumeOneDayStack])
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        return stack
    }()
    
    private lazy var volumeOneMthStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [volumeOneMthTitleLabel, volumeOneMthValueLabel])
        stack.axis = .vertical
        stack.alignment = .leading
        stack.spacing = 4
        return stack
    }()
    
    private lazy var containerVolumeMthStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [volumeOneMthStack])
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        return stack
    }()
    
    // MARK: - LifeCycle
    override func buildHierarchy() {
        addSubview(exchangeIdTitleLabel)
        addSubview(exchangeIdValueLabel)
        addSubview(containerDateStack)
        addSubview(containerVolumeStack)
        addSubview(containerVolumeMthStack)
    }
    
    override func setupConstraints() {
        let marginTopAndBottom: CGFloat = 10
        let marginLeftAndRight: CGFloat = 16
        
        exchangeIdTitleLabel.layout(using: [
            exchangeIdTitleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: marginTopAndBottom),
            exchangeIdTitleLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: marginLeftAndRight),
            exchangeIdTitleLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -marginLeftAndRight)
        ])
        
        exchangeIdValueLabel.layout(using: [
            exchangeIdValueLabel.topAnchor.constraint(equalTo: exchangeIdTitleLabel.bottomAnchor, constant: 3),
            exchangeIdValueLabel.leadingAnchor.constraint(equalTo: exchangeIdTitleLabel.leadingAnchor),
            exchangeIdValueLabel.trailingAnchor.constraint(equalTo: exchangeIdTitleLabel.trailingAnchor)
        ])
        
        containerDateStack.layout(using: [
            containerDateStack.topAnchor.constraint(equalTo: exchangeIdValueLabel.bottomAnchor, constant: marginTopAndBottom),
            containerDateStack.leadingAnchor.constraint(equalTo: exchangeIdValueLabel.leadingAnchor),
            containerDateStack.trailingAnchor.constraint(equalTo: exchangeIdValueLabel.trailingAnchor)
        ])
        
        containerVolumeStack.layout(using: [
            containerVolumeStack.topAnchor.constraint(equalTo: containerDateStack.bottomAnchor, constant: marginTopAndBottom),
            containerVolumeStack.leadingAnchor.constraint(equalTo: containerDateStack.leadingAnchor),
            containerVolumeStack.trailingAnchor.constraint(equalTo: containerDateStack.trailingAnchor)
        ])
        
        containerVolumeMthStack.layout(using: [
            containerVolumeMthStack.topAnchor.constraint(equalTo: containerVolumeStack.bottomAnchor, constant: marginTopAndBottom),
            containerVolumeMthStack.leadingAnchor.constraint(equalTo: containerVolumeStack.leadingAnchor),
            containerVolumeMthStack.trailingAnchor.constraint(equalTo: containerVolumeStack.trailingAnchor)
        ])
    }
    
    override func setupExtraConfigurations() {
        backgroundColor = .white
    }
}

extension ExchangeDetailView {
    func configureView(exchange: Exchange) {
        exchangeIdValueLabel.text = exchange.exchangeId
        startValueLabel.text = exchange.dataTradeStart?.toAmericanDateString()
        endValueLabel.text = exchange.dataTradeEnd?.toAmericanDateString()
        
        volumeOneHrsValueLabel.text = exchange.volumeOneHrsUsd?.toCurrencyString() ?? "0"
        volumeOneDayValueLabel.text = exchange.volumeOneDayUsd?.toCurrencyString() ?? "0"
        volumeOneMthValueLabel.text = exchange.volumeOneMthUsd?.toCurrencyString() ?? "0"
    }
}
