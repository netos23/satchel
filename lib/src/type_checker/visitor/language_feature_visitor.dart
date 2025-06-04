import '../../antlr/StellaParser.dart';
import '../../antlr/StellaParserBaseVisitor.dart';
import '../model/stella_types_context.dart';

class LanguageFeatureVisitor
    extends StellaParserBaseVisitor<StellaTypesContext> {
  LanguageFeatureVisitor();

  @override
  StellaTypesContext defaultResult() {
    return StellaTypesContext.root();
  }

  @override
  StellaTypesContext? visitAnExtension(AnExtensionContext ctx) {
    return StellaTypesContext.extensions(
      ctx.extensionNames
          .map((t)=> t.text!)
          .map((ext) => LanguageFeatures.from(ext))
          .whereType<LanguageFeatures>()
          .toSet(),
    );
  }
}
