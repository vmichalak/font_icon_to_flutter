import 'package:font_icon_to_flutter/src/model/icon_mapping.dart';
import 'package:font_icon_to_flutter/src/parser/iconly_io_icon_parser.dart';
import 'package:font_icon_to_flutter/src/parser/lucide_icon_parser.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  final parser = LucideIconParser();

  group('LucideIconParser().parse()', () {
    test('parse an empty input', () {
      expect(parser.parse(''), const Iterable<IconMapping>.empty());
    });

    test('parse an invalid input', () {
      const input = '''
          Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed pretium 
          maximus nulla at convallis. Mauris rutrum ex vel lacus interdum 
          pulvinar. In efficitur euismod condimentum. Aenean id augue blandit, 
          scelerisque ex ut, tincidunt dolor. Cras venenatis lacus quam, eu 
          maximus erat dapibus eget. Fusce et lacinia magna. Nulla consequat 
          nisl et augue vestibulum commodo. Vestibulum ac libero vitae ipsum 
          mattis consequat. Morbi at lacus facilisis, rhoncus est quis, 
          efficitur lacus. Nam eget posuere eros. Aenean vehicula dignissim 
          ligula sit amet finibus. Sed nec egestas ex, varius pulvinar sem. 
          Curabitur fermentum tortor eleifend luctus cursus. Cras efficitur 
          vulputate tellus, et volutpat ipsum sodales at.''';
      expect(parser.parse(input), const Iterable<IconMapping>.empty());
    });

    test('parse a valid input', () {
      const input = r'''
          /@font-face {
            font-family: "lucide";
            src: url('lucide.eot?t=1733401308309'); /* IE9*/
            src: url('lucide.eot?t=1733401308309#iefix') format('embedded-opentype'), /* IE6-IE8 */
            url("lucide.woff2?t=1733401308309") format("woff2"),
            url("lucide.woff?t=1733401308309") format("woff"),
            url('lucide.ttf?t=1733401308309') format('truetype'), /* chrome, firefox, opera, Safari, Android, iOS 4.2+*/
            url('lucide.svg?t=1733401308309#lucide') format('svg'); /* iOS 4.1- */
          }
          
          [class^="icon-"], [class*=" icon-"] {
            font-family: 'lucide' !important;font-size: inherit;
            font-style:normal;
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale;
          }
          
          
          .icon-a-arrow-down:before { content: "\e589"; }''';
      final output = parser.parse(input);
      const expected = IconMapping(key: 'aArrowDown', codePoint: 'e589');
      expect(output.length, 1);
      expect(output.first, expected);
    });
  });
}
