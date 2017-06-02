import Foundation
import Files

///
/// Represents an Xcode asset catalog.
///

struct AssetCatalog {

    /// The catalog folder.
    var folder: Folder

    ///
    /// Lists the App Icon Sets in the catalog.
    ///

    func listAppIconSets() throws -> Set<AppIconSet> {

        let appIconSets = try folder.subfolders
            .filter { $0.containsFile(named: "Contents.json") && $0.extension == "appiconset" }
            .map(AppIconSet.init)

        return Set<AppIconSet>(appIconSets)

    }

}
