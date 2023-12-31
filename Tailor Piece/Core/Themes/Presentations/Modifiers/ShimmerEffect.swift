//
//  ShimmerEffect.swift
//  Tailor Piece
//
//  Created by Sae Pasomba on 20/06/23.
//

import SwiftUI

extension View {
    func shimmer(_ config: ShimmerConfig) -> some View {
        self
            .modifier(ShimmerEffectHelper(config: config))
    }
}

fileprivate struct ShimmerEffectHelper: ViewModifier {
    
    var config: ShimmerConfig
    
    @State var moveTo: CGFloat = -5
    
    func body(content: Content) -> some View {
        content
            .hidden()
            .overlay {
                Rectangle()
                    .fill(config.tint)
                    .mask(content)
                    .overlay {
                        GeometryReader {
                            let size = $0.size
                            let extraOffset = $0.size.height / 2.5
                            
                            Rectangle()
                                .fill(config.highlight)
                                .mask {
                                     Rectangle()
                                        .fill(
                                            LinearGradient(colors: [
                                                .white.opacity(0),
                                                config.highlight.opacity(config.highlightOpacity),
                                                .white.opacity(0)
                                            ], startPoint: .top, endPoint: .bottom)
                                        )
                                        .blur(radius: config.blur)
                                        .scaleEffect(4)
                                        .rotationEffect(Angle(degrees: 60))
                                        .offset(x: moveTo > 0 ? extraOffset : -extraOffset)
                                        .offset(x: size.width * moveTo)
                                }
                        }
                        .mask(content)
                    }
            }
            .onAppear {
                DispatchQueue.main.async {
                    moveTo = 5
                }
            }
            .animation(.linear(duration: config.speed).repeatForever(autoreverses: false), value: moveTo)
    }
    
    
}

struct ShimmerConfig {
    var tint: Color
    var highlight: Color
    var blur: CGFloat = 3
    var highlightOpacity: CGFloat = 1
    var speed: CGFloat = 3
}

struct ShimmerEffect_Previews: PreviewProvider {
    static var previews: some View {
        SketsaSubSection()
    }
}

struct ShimmerEffect2_Previews: PreviewProvider {
    static var previews: some View {
        DesignView().environmentObject(Router())
    }
}
