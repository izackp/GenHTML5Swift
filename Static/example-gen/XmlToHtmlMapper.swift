//
//  XmlToHtmlMapper.swift
//  HTMLStandard
//
//  Generated on 07/04/2025. 
//  THIS FILE IS GENERATED. DO NOT EDIT.
//

public func xmlToHtmlMapper(_ name:String, _ attributes:[String:String], _ parser:XMLParser?) throws -> NHTMLRenderable {
    switch name {
        case "head":
            return try Head(attributes, parser)
        case "progress":
            return try Progress(attributes, parser)
        case "colgroup":
            return try Colgroup(attributes, parser)
        case "footer":
            return try Footer(attributes, parser)
        case "q":
            return try Q(attributes, parser)
        case "base":
            return try Base(attributes, parser)
        case "rt":
            return try Rt(attributes, parser)
        case "th":
            return try Th(attributes, parser)
        case "iframe":
            return try Iframe(attributes, parser)
        case "optgroup":
            return try Optgroup(attributes, parser)
        case "noscript":
            return try Noscript(attributes, parser)
        case "svg":
            return try Svg(attributes, parser)
        case "source":
            return try Source(attributes, parser)
        case "h1":
            return try H1(attributes, parser)
        case "h3":
            return try H3(attributes, parser)
        case "hr":
            return try Hr(attributes, parser)
        case "code":
            return try Code(attributes, parser)
        case "table":
            return try Table(attributes, parser)
        case "area":
            return try Area(attributes, parser)
        case "template":
            return try Template(attributes, parser)
        case "select":
            return try Select(attributes, parser)
        case "article":
            return try Article(attributes, parser)
        case "blockquote":
            return try Blockquote(attributes, parser)
        case "sup":
            return try Sup(attributes, parser)
        case "dialog":
            return try Dialog(attributes, parser)
        case "strong":
            return try Strong(attributes, parser)
        case "bdo":
            return try Bdo(attributes, parser)
        case "dfn":
            return try Dfn(attributes, parser)
        case "i":
            return try I(attributes, parser)
        case "address":
            return try Address(attributes, parser)
        case "small":
            return try Small(attributes, parser)
        case "a":
            return try A(attributes, parser)
        case "mark":
            return try Mark(attributes, parser)
        case "html":
            return try Html(attributes, parser)
        case "ul":
            return try Ul(attributes, parser)
        case "u":
            return try U(attributes, parser)
        case "video":
            return try Video(attributes, parser)
        case "input":
            return try Input(attributes, parser)
        case "textarea":
            return try Textarea(attributes, parser)
        case "track":
            return try Track(attributes, parser)
        case "sub":
            return try Sub(attributes, parser)
        case "main":
            return try Main(attributes, parser)
        case "option":
            return try Option(attributes, parser)
        case "del":
            return try Del(attributes, parser)
        case "wbr":
            return try Wbr(attributes, parser)
        case "h2":
            return try H2(attributes, parser)
        case "section":
            return try Section(attributes, parser)
        case "script":
            return try Script(attributes, parser)
        case "ruby":
            return try Ruby(attributes, parser)
        case "aside":
            return try Aside(attributes, parser)
        case "label":
            return try Label(attributes, parser)
        case "embed":
            return try Embed(attributes, parser)
        case "h5":
            return try H5(attributes, parser)
        case "em":
            return try Em(attributes, parser)
        case "tbody":
            return try Tbody(attributes, parser)
        case "var":
            return try Var(attributes, parser)
        case "math":
            return try Math(attributes, parser)
        case "picture":
            return try Picture(attributes, parser)
        case "figure":
            return try Figure(attributes, parser)
        case "slot":
            return try Slot(attributes, parser)
        case "dl":
            return try Dl(attributes, parser)
        case "audio":
            return try Audio(attributes, parser)
        case "tr":
            return try Tr(attributes, parser)
        case "data":
            return try Data(attributes, parser)
        case "dt":
            return try Dt(attributes, parser)
        case "form":
            return try Form(attributes, parser)
        case "thead":
            return try Thead(attributes, parser)
        case "bdi":
            return try Bdi(attributes, parser)
        case "legend":
            return try Legend(attributes, parser)
        case "style":
            return try Style(attributes, parser)
        case "object":
            return try Object(attributes, parser)
        case "header":
            return try Header(attributes, parser)
        case "samp":
            return try Samp(attributes, parser)
        case "link":
            return try Link(attributes, parser)
        case "menu":
            return try Menu(attributes, parser)
        case "li":
            return try Li(attributes, parser)
        case "b":
            return try B(attributes, parser)
        case "ins":
            return try Ins(attributes, parser)
        case "s":
            return try S(attributes, parser)
        case "hgroup":
            return try Hgroup(attributes, parser)
        case "meter":
            return try Meter(attributes, parser)
        case "col":
            return try Col(attributes, parser)
        case "meta":
            return try Meta(attributes, parser)
        case "fieldset":
            return try Fieldset(attributes, parser)
        case "p":
            return try P(attributes, parser)
        case "rp":
            return try Rp(attributes, parser)
        case "span":
            return try Span(attributes, parser)
        case "h6":
            return try H6(attributes, parser)
        case "abbr":
            return try Abbr(attributes, parser)
        case "param":
            return try Param(attributes, parser)
        case "br":
            return try Br(attributes, parser)
        case "tfoot":
            return try Tfoot(attributes, parser)
        case "ol":
            return try Ol(attributes, parser)
        case "caption":
            return try Caption(attributes, parser)
        case "head":
            return try Head(attributes, parser)
        case "h4":
            return try H4(attributes, parser)
        case "dd":
            return try Dd(attributes, parser)
        case "datalist":
            return try Datalist(attributes, parser)
        case "body":
            return try Body(attributes, parser)
        case "map":
            return try Map(attributes, parser)
        case "details":
            return try Details(attributes, parser)
        case "cite":
            return try Cite(attributes, parser)
        case "canvas":
            return try Canvas(attributes, parser)
        case "pre":
            return try Pre(attributes, parser)
        case "button":
            return try Button(attributes, parser)
        case "output":
            return try Output(attributes, parser)
        case "kbd":
            return try Kbd(attributes, parser)
        case "figcaption":
            return try Figcaption(attributes, parser)
        case "div":
            return try Div(attributes, parser)
        case "title":
            return try Title(attributes, parser)
        case "img":
            return try Img(attributes, parser)
        case "summary":
            return try Summary(attributes, parser)
        case "nav":
            return try Nav(attributes, parser)
        case "time":
            return try Time(attributes, parser)
        case "td":
            return try Td(attributes, parser)

        default:
            throw AppError("Unknown or unhandled xml tag: \(name)")
    }
}