import SwiftUI

struct MultipleJumpingBalls: View {
    @State private var ballPositions: [BallPosition] = []
    
    let rectFrame = CGRect(x: 10, y: 30, width: 700, height: 300)

    var shouldShowAnimation: Bool {
        return UIScreen.main.bounds.width > 400
    }

    var body: some View {
        if shouldShowAnimation {
            ZStack {
                // Set the background to clear
                Color.clear

                VStack {
                    ForEach(ballPositions, id: \.id) { ballPosition in
                        AnimatedBall()
                            .position(ballPosition.position)
                    }
                }
                .clipped()  // Clip the VStack to the bounds of the ZStack

                Text("iNews")
                    .font(.system(size: 60, weight: .thin))
                    .foregroundColor(.blue)
                    .position(x: rectFrame.midX, y: rectFrame.midY)
            }
            .frame(width: rectFrame.width, height: rectFrame.height) // Ensure the ZStack has a fixed size
            .onAppear {
                startContinuousJumping()
            }
        } else {
            // Placeholder or alternative content when the width is less than 400
            Text("Animation not available for small screens")
        }
    }

    func startContinuousJumping() {
        for _ in 0..<10 { // You can adjust the number of balls
            jump()
        }
    }

    func jump() {
        let newPosition = BallPosition(id: UUID(), position: randomPosition())

        withAnimation(Animation.easeInOut(duration: 1.0)) {
            ballPositions.append(newPosition)
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            withAnimation {
                ballPositions.removeFirst()
                jump()
            }
        }
    }

    func randomPosition() -> CGPoint {
        let x = CGFloat.random(in: rectFrame.minX...rectFrame.maxX)
        let y = CGFloat.random(in: rectFrame.minY...rectFrame.maxY)
        return CGPoint(x: x, y: y)
    }
}

struct AnimatedBall: View {
    var body: some View {
        Circle()
            .foregroundColor(.blue)
            .frame(width: 20, height: 20)
    }
}

struct BallPosition: Identifiable {
    let id: UUID
    let position: CGPoint
}

extension BallPosition: Hashable {
    static func == (lhs: BallPosition, rhs: BallPosition) -> Bool {
        return lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

struct MultipleJumpingBalls_Previews: PreviewProvider {
    static var previews: some View {
        MultipleJumpingBalls()
    }
}
