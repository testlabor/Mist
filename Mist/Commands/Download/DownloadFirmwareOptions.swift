//
//  DownloadFirmwareOptions.swift
//  Mist
//
//  Created by Nindi Gill on 30/5/2022.
//

import ArgumentParser
import Foundation

struct DownloadFirmwareOptions: ParsableArguments {

    @Argument(help: """
    Specify a macOS name, version or build to download:
    * macOS Monterey
    * macOS Big Sur
    * macOS Catalina
    * macOS Mojave
    * macOS High Sierra
    * 12.x (macOS Monterey)
    * 11.x (macOS Big Sur)
    * 10.15.x (macOS Catalina)
    * 10.14.x (macOS Mojave)
    * 10.13.x (macOS High Sierra)
    * 21F (macOS Monterey 12.4.x)
    * 20G (macOS Big Sur 11.6.x)
    * 19H (macOS Catalina 10.15.7)
    * 18G (macOS Mojave 10.14.6)
    * 17G (macOS High Sierra 10.13.6)
    Note: Specifying a macOS name will assume the latest version and build of that particular macOS.
    Note: Specifying a macOS version will assume the latest build of that particular macOS.
    """)
    var searchString: String

    @Flag(name: [.customShort("b"), .long], help: """
    Include beta macOS Firmwares in search results.
    """)
    var includeBetas: Bool = false

    @Flag(name: .long, help: """
    Only include macOS Firmwares that are compatible with this Mac in search results.
    """)
    var compatible: Bool = false

    @Flag(name: .shortAndLong, help: """
    Force overwriting existing macOS Downloads matching the provided filename(s).
    Note: Downloads will fail if an existing file is found and this flag is not provided.
    """)
    var force: Bool = false

    @Option(name: .long, help: """
    Specify the macOS Firmware output filename. The following variables will be dynamically substituted:
    * %NAME% will be replaced with 'macOS Monterey'
    * %VERSION% will be replaced with '12.0'
    * %BUILD% will be replaced with '21A5304g'
    """)
    var firmwareName: String = .filenameTemplate + ".ipsw"

    @Option(name: .shortAndLong, help: """
    Specify the output directory. The following variables will be dynamically substituted:
    * %NAME% will be replaced with 'macOS Monterey'
    * %VERSION% will be replaced with '12.0'
    * %BUILD% will be replaced with '21A5304g'
    Note: Parent directories will be created automatically.
    """)
    var outputDirectory: String = .outputDirectory

    @Option(name: .shortAndLong, help: """
    Specify the temporary downloads directory.
    Note: Parent directories will be created automatically.
    """)
    var temporaryDirectory: String = .temporaryDirectory

    @Option(name: [.customShort("e"), .customLong("export")], help: """
    Specify the path to export the download results to one of the following formats:
    * /path/to/export.json (JSON file)
    * /path/to/export.plist (Property List file)
    * /path/to/export.yaml (YAML file)
    The following variables will be dynamically substituted:
    * %NAME% will be replaced with 'macOS Monterey'
    * %VERSION% will be replaced with '12.0'
    * %BUILD% will be replaced with '21A5304g'
    Note: The file extension will determine the output file format.
    Note: Parent directories will be created automatically.
    """)
    var exportPath: String?

    @Option(name: .long, help: """
    Number of times to attempt resuming a download before failing.
    """)
    var retries: Int = 10

    @Option(name: .long, help: """
    Number of seconds to wait before attempting to resume a download.
    """)
    var retryDelay: Int = 30

    @Flag(name: .shortAndLong, help: """
    Suppress verbose output.
    """)
    var quiet: Bool = false
}
