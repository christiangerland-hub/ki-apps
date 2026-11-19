import UIKit

/// Erzeugt aus dem Protokolltext eine PDF-Datei (A4, mehrseitig).
struct ProtocolPDFRenderer {
    /// A4 in Punkt (72 dpi).
    private let pageRect = CGRect(x: 0, y: 0, width: 595.2, height: 841.8)
    private let margin: CGFloat = 50

    func renderPDF(text: String, to url: URL) throws {
        let paragraph = NSMutableParagraphStyle()
        paragraph.lineSpacing = 3
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 11),
            .paragraphStyle: paragraph,
        ]
        let attributed = NSAttributedString(string: text, attributes: attributes)

        let textStorage = NSTextStorage(attributedString: attributed)
        let layoutManager = NSLayoutManager()
        textStorage.addLayoutManager(layoutManager)

        let textSize = CGSize(width: pageRect.width - 2 * margin, height: pageRect.height - 2 * margin)
        let renderer = UIGraphicsPDFRenderer(bounds: pageRect)

        try renderer.writePDF(to: url) { context in
            var glyphIndex = 0
            repeat {
                let container = NSTextContainer(size: textSize)
                container.lineFragmentPadding = 0
                layoutManager.addTextContainer(container)
                let range = layoutManager.glyphRange(for: container)
                guard range.length > 0 else { break }
                context.beginPage()
                layoutManager.drawGlyphs(forGlyphRange: range, at: CGPoint(x: margin, y: margin))
                glyphIndex = NSMaxRange(range)
            } while glyphIndex < layoutManager.numberOfGlyphs
        }
    }

    /// Schreibt das PDF in einen temporären Ordner und gibt die Datei zurück.
    func temporaryPDF(for meeting: Meeting, exporter: ProtocolTextExporter = ProtocolTextExporter()) throws -> URL {
        let url = FileManager.default.temporaryDirectory
            .appendingPathComponent(exporter.fileName(for: meeting))
            .appendingPathExtension("pdf")
        try renderPDF(text: exporter.text(for: meeting), to: url)
        return url
    }
}
