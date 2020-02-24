import SwiftUI

public struct DemoLibrary: View {
    
    @ObservedObject var viewModel: LibraryViewModel
    
   public init(withViewModel viewModel: LibraryViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        List {
            completePieGraphView
            completeSleepingGraphView
        }
    }
    
    private var completeDiagram: some View {
        if viewModel.isLandscape {
            return AnyView(
                HStack {
                    completePieGraphView
                    completeSleepingGraphView
            })
        } else {
            return  AnyView(
                VStack {
                    completePieGraphView
                    completeSleepingGraphView
            })

        }
    }
    
    private var completePieGraphView: some View {
        let values = viewModel.getLeftViewData()
        let leftDigramViewModel = LeftViewViewModel(
            startScore: values.startValue,
            targetScore: values.targetValue,
            userScore: values.userScore, bgDelta: values.bgDelta)
        return VStack {
            LeftView(withViewModel: leftDigramViewModel)
            Text("As of \(values.valuationDate).")
                .font(.footnote)
        }
    }
    
    private var completeSleepingGraphView: some View {
        let slabs = self.viewModel.getBarViewData()
        return VStack {
            Text("Where You Stand")
                .font(.title)
            
            ForEach(slabs, id: \.start) { slab in
                LineView(withViewModel: LineViewViewModel(withSlab: slab))
            }

        }
    }
}

