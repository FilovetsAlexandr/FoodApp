//
//  MainTabBarController.swift
//  FoodApp
//
//  Created by Alexandr Filovets on 12.01.24.
//

import UIKit

class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        generateTabBar()
        setTabBarApperance()
    }
    
    private func generateTabBar() {
        viewControllers = [
            generateVC(viewController: MenuView(), title: "Меню", image: UIImage(systemName: "takeoutbag.and.cup.and.straw")),
            generateVC(viewController: ContactsView(), title: "Контакты", image: UIImage(systemName: "mappin.and.ellipse")),
            generateVC(viewController: ProfileView(), title: "Профиль", image: UIImage(systemName: "person.fill")),
            generateVC(viewController: BasketView(), title: "Корзина", image: UIImage(systemName: "basket.fill"))
        ]
        
    }
    private func generateVC(viewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        return viewController
    }
    
    private func setTabBarApperance() {
        let positionOnX: CGFloat = 10
        let positionOnY: CGFloat = 14
        let width = tabBar.bounds.width - positionOnX * 2
        let height = tabBar.bounds.height + positionOnY * 2
        
        let roundLayer = CAShapeLayer()
        
        let bezierPath = UIBezierPath(
            roundedRect: CGRect(
                x: positionOnX,
                y: tabBar.bounds.minY - positionOnY,
                width: width,
                height: height
            ),
            cornerRadius: height / 2
        )
        
        roundLayer.path = bezierPath.cgPath
        
        tabBar.layer.insertSublayer(roundLayer, at: 0)
        
        tabBar.itemWidth = width / 5
        tabBar.itemPositioning = .centered
        
        roundLayer.fillColor = UIColor.mainWhite.cgColor
        
        tabBar.tintColor = .tabBarItemAccent
        tabBar.unselectedItemTintColor = .tabBarItemLight
    }
}
