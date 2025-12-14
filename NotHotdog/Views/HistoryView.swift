import SwiftUI

struct HistoryView : View {
    @EnvironmentObject var sharedViewModel: HistoryViewModel
    
    var body : some View {
        List(sharedViewModel.results, id: \.self) { i in
            if i.result == "Hotdog!" {
                Text("\(i.timestamp) - \(i.result ?? "N/A")")
                    .foregroundColor(i.result == "Hotdog!" ? .green : .red)
            } else {
                EmptyView()
            }
        }
    }
}

#Preview {
    HistoryView().environmentObject(HistoryViewModel())
}
