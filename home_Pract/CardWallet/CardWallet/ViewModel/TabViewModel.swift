//
//  TabViewModel.swift
//  CardWallet
//
//  Created by Tuan on 12/03/2021.
//

import SwiftUI

struct TabViewModel<Content: View>: UIViewRepresentable {
    
    var content: Content
    var rect: CGRect
    var tabs: [Any]
    @Binding var offset: CGFloat
    
    let scrollView = UIScrollView()
    
    init(tabs: [Any], rect: CGRect, offset: Binding<CGFloat>, @ViewBuilder content: ()-> Content) {
        self.content = content()
        self._offset = offset
        self.rect    = rect
        self.tabs    = tabs
    }
    
    func makeCoordinator() -> Coordinator {
        return TabViewModel.Coordinator(parent: self)
    }
    
    func makeUIView(context: Context) -> UIScrollView {
        
        setUpScrollView()
        
        scrollView.contentSize = CGSize(width: rect.width * CGFloat(tabs.count), height: rect.height)
        scrollView.contentOffset.x = offset
        scrollView.addSubview(extractView())
        return scrollView
    }
    
    func updateUIView(_ uiView: UIScrollView, context: Context) {
        
        if uiView.contentOffset.x != offset {
            uiView.delegate = nil
            UIView.animate(withDuration: 0.4) {
                uiView.contentOffset.x = offset
            } completion: { (status) in
                if status{uiView.delegate = context.coordinator}
            }
        }
    }
    
    func setUpScrollView() {
        scrollView.isPagingEnabled = true
        scrollView.bounces = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        
    }
    
    func extractView() -> UIView {
        let controller = UIHostingController(rootView: HStack(spacing:0){ content }.ignoresSafeArea())
        controller.view.frame = CGRect(x: 0, y: 0, width: rect.width * CGFloat(tabs.count), height: rect.height)
        
        return controller.view!
    }
    
    class Coordinator: NSObject, UIScrollViewDelegate {
        var parent: TabViewModel
        
        init(parent: TabViewModel){
            self.parent = parent
        }
        
        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            parent.offset = scrollView.contentOffset.x
        }
    }
    
}
