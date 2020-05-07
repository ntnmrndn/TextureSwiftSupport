//
//  MenuViewController.swift
//  Demo
//
//  Created by muukii on 2020/04/21.
//  Copyright © 2020 muukii. All rights reserved.
//

import Foundation

import AsyncDisplayKit
import TextureSwiftSupport
import GlossButtonNode
import TypedTextAttributes

fileprivate let descriptor = GlossButtonDescriptor(bodyStyle: .init(layout: .horizontal()), surfaceStyle: .bodyOnly)

final class MenuViewController: PlainDisplayNodeViewController {
  
  private let openSampleButtonNode = GlossButtonNode()
  private let topLabelNode = ASTextNode()
  
  override init() {
    
    super.init()
    view.backgroundColor = .white
    
    topLabelNode.attributedText = .init(string: "Attatched on safe-area")
        
    openSampleButtonNode.setDescriptor(descriptor.title("OpenSample".styled { $0 }), for: .normal)
    openSampleButtonNode.onTap = { [weak self] in
      let controller = InstagramPostCellViewController()
      self?.navigationController?.pushViewController(controller, animated: true)
    }

  }
    
  override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
    LayoutSpec {
      
      ZStackLayout {
        
        topLabelNode
          .padding(UIEdgeInsets(top: 0, left: 0, bottom: .infinity, right: .infinity))
        
        CenterLayout {
          VStackLayout {
            openSampleButtonNode
          }
        }
        
      }
      .padding(capturedSafeAreaInsets)
      
    }
  }
}