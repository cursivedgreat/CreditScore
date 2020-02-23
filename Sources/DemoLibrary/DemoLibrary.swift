import SwiftUI

struct DemoLibrary: View {
    
    @ObservedObject var viewModel: LibraryViewModel
    @Environment(\.verticalSizeClass) var sizeClass
    @State var isPortrait = UIApplication.shared.statusBarOrientation.isLandscape
    
    init(withViewModel viewModel: LibraryViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        List {
            completeDiagram
        }
    }
    
    private var completeDiagram: some View {
        return  AnyView(
            VStack {
                completePieGraphView
                completeSleepingGraphView
        })
//        if isPortrait {
//            return  AnyView(
//                VStack {
//                    completePieGraphView
//                    completeSleepingGraphView
//            })
//        } else {
//            return AnyView(
//                HStack {
//                    completePieGraphView
//                    completeSleepingGraphView
//            })
//        }
    }
    
    private var completePieGraphView: some View {
        let values = viewModel.getLeftViewData()
        let leftDigramViewModel = LeftViewViewModel(
            startScore: values.startValue,
            targetScore: values.targetValue,
            userScore: values.userScore)
        return VStack {
            LeftView(withViewModel: leftDigramViewModel)
            Text("As of \(values.valuationDate).")
                .font(.footnote)
        }
    }
    
    private var completeSleepingGraphView: some View {
        let slabs = self.viewModel.getBarViewData()
        return VStack {
            ForEach(slabs, id: \.start) { slab in
                LineView(withViewModel: LineViewViewModel(withSlab: slab))
            }
        }
    }
}


struct DemoLibrary_PreviewProvider: PreviewProvider {
    static var previews: some View {
        DemoLibrary(withViewModel: LibraryViewModel(withResponse: CreditScore()))
        
    }
}


func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
    coordinator.animate(alongsideTransition: { context in
        if UIApplication.shared.statusBarOrientation.isLandscape {
            // activate landscape changes
        } else {
            // activate portrait changes
        }
    })
}
