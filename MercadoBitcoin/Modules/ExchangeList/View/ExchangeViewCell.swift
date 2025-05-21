//
//  ExchangeViewCell.swift
//  MercadoBitcoin
//
//

import UIKit

class ExchangeViewCell: UITableViewCell {
    
    // MARK: - Components
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .bold)
        label.numberOfLines = 0
        label.accessibilityIdentifier = "exchangeNameLabel"
        return label
    }()
    
    private let exchangeIdLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.numberOfLines = 0
        return label
    }()
    
    private let volumeOneDayUsdLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.accessibilityIdentifier = "exchangeVolumeLabel"
        return label
    }()
    
    private let lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        buildHierarchy()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func buildHierarchy() {
        contentView.addSubview(nameLabel)
        contentView.addSubview(exchangeIdLabel)
        contentView.addSubview(volumeOneDayUsdLabel)
        contentView.addSubview(lineView)
    }

    private func setupConstraints() {
        let marginTopAndBottom: CGFloat = 10
        let marginLeftAndRight: CGFloat = 16
        
        nameLabel.layout(using: [
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: marginTopAndBottom),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: marginLeftAndRight),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -marginLeftAndRight)
        ])
        
        exchangeIdLabel.layout(using: [
            exchangeIdLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: marginTopAndBottom),
            exchangeIdLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            exchangeIdLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor)
        ])
        
        volumeOneDayUsdLabel.layout(using: [
            volumeOneDayUsdLabel.topAnchor.constraint(equalTo: exchangeIdLabel.bottomAnchor, constant: marginTopAndBottom),
            volumeOneDayUsdLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            volumeOneDayUsdLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor)
        ])
        
        lineView.layout(using: [
            lineView.topAnchor.constraint(equalTo: volumeOneDayUsdLabel.bottomAnchor, constant: marginTopAndBottom),
            lineView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            lineView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            lineView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            lineView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    
    func configureView(exchange: Exchange) {
        nameLabel.text = exchange.name
        exchangeIdLabel.text = exchange.exchangeId
        volumeOneDayUsdLabel.text = "Volume 1 day USD: \(exchange.volumeOneDayUsd?.toCurrencyString() ?? "0")"
    }
}
