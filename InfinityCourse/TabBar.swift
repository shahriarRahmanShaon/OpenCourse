import SwiftUI

struct TabBar: View {
    @State private var selectedTab: Tab = .home
    @State var tabItemWidth: CGFloat = 0
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Group{
                switch selectedTab {
                case .home:
                    ContentView()
                case .explore:
                    AccountView()
                case .notification:
                    AccountView()
                case .library:
                    AccountView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            HStack {
                ForEach(tabItems) { item in
                    Button {
                        withAnimation {
                            selectedTab = item.tab
                        }
                    }label:{
                        VStack(spacing: 0) {
                            Image(systemName: item.icon)
                                .symbolVariant(.fill)
                                .font(.body.bold())
                                .frame(width: 44, height: 29)
                            Text(item.text)
                                .font(.caption2)
                                .lineLimit(1)
                        }
                        .foregroundStyle(selectedTab == item.tab ? .primary : .secondary)
                        .frame(maxWidth: .infinity)
                        .overlay(
                            GeometryReader{ geo in
                                Color.clear.preference(key: TabPreferenceKay.self, value: geo.size.width)
                            }
                        )
                        .onPreferenceChange(TabPreferenceKay.self, perform: { value in
                            tabItemWidth = value
                        })
                    }
                }
            }
            .padding(.horizontal, 8)
            .padding(.top, 14)
            .frame(height: 88, alignment: .top)
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 34, style: . continuous))
            .background(
                HStack{
                    if selectedTab == .library {Spacer()}
                    if selectedTab == .explore {Spacer()}
                    if selectedTab == .notification {
                        Spacer()
                        Spacer()}
                    Circle().fill(.pink).frame(width: tabItemWidth)
                    if selectedTab == .home {Spacer()}
                    if selectedTab == .explore {
                        Spacer()
                        Spacer()}
                    if selectedTab == .notification {Spacer()}
                    
                }
                    .padding()
            )
            .overlay(
                    HStack{
                        if selectedTab == .library {Spacer()}
                        if selectedTab == .explore {Spacer()}
                        if selectedTab == .notification {
                            Spacer()
                            Spacer()}
                        RoundedRectangle(cornerRadius: 5)
                            .fill(.pink)
                            .frame(width: 30, height: 5)
                            .frame(width: tabItemWidth)
                            .frame(maxHeight: .infinity, alignment: .top)
                        if selectedTab == .home {Spacer()}
                        if selectedTab == .explore {
                            Spacer()
                            Spacer()}
                        if selectedTab == .notification {Spacer()}
                        
                    }
                        .padding(.horizontal, 10)
            )
            .frame(maxHeight: .infinity, alignment: .bottom)
            .ignoresSafeArea()
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
            .previewInterfaceOrientation(.portrait)
    }
}
