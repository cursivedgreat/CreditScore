# DemoLibrary

A description of this package.

# Important
Supports only iOS 13 and above

## Public Interfaces
1. Model `Response.swift` is visible to client. All 
2. View `DemoLibrary.swift` and its `initializer` are available for public interface.
3. ViewModel `LibraryViewModel` and `initializer` are also available to public for passing the data to library required for rendering required views.

## Uses:

Create an instance of model `CreditScore`  and pass it to `DemoLibrary` view's initializer as dependency.
```
import DemoLibrary

var body: some View {
    DemoLibrary(withViewModel: LibraryViewModel(withResponse: CreditScore(), inLandscape: false))
}
```

## Architecture
Library follows MVVM design pattern.
1. View has reference of its ViewModel, not vice-versa
2. ViewModel has reference to Model,m not vice-versa
3. View holds `no` reference to Model and vice-versa


