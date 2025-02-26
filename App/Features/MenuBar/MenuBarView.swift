import ComposableArchitecture
import SwiftUI

struct MenuBarView: View {
	let store: StoreOf<MenuBarReducer>

	var body: some View {
		VStack(alignment: .leading, spacing: .zero) {
			HStack {
				Text(store.remainingTime.toTimer(.hour, .minute, .second))
					.contentTransition(.numericText(countsDown: true))
					.font(.system(.largeTitle))

				Spacer()

				SettingsLink {
					Image(systemName: "gear")
						.resizable()
						.aspectRatio(contentMode: .fit)
						.padding(4)
						.frame(width: 28, height: 28)
				}

				Button(action: {}) {
					Image(systemName: "list.clipboard")
						.resizable()
						.aspectRatio(contentMode: .fit)
						.padding(4)
						.frame(width: 28, height: 28)
				}
			}
		}
		.padding([.horizontal, .top])
	}
}

#Preview {
	MenuBarView(
		store: .init(
			initialState: MenuBarReducer.State(remainingTime: Shared(3600)),
			reducer: { MenuBarReducer() }
		)
	)
	.frame(width: 380)
}
