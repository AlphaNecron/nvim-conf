-- from friendly-snippets gg
return {
  { prefix = "allow", body = "#![allow(${1})]", desc = "#![allow(...)]" },
  { prefix = "deny", body = "#![deny(${1})]", desc = "#![deny(...)]" },
  { prefix = "warn", body = "#![warn(${1})]", desc = "#![warn(...)]" },
  { prefix = "no_std", body = "#![no_std]" },
  { prefix = "no_core", body = "#![no_core]" },
  { prefix = "feature", body = "#![feature(${1})]", desc = "#![feature(...)]" },
  { prefix = "macro_use", body = "#[macro_use(${1})]", desc = "#[macro_use(...)]" },
  { prefix = "repr", body = "#[repr(${1})]", desc = "#[repr(...)]" },
  { prefix = "cfg", body = "#[cfg(${1})]", desc = "#[cfg(...)]" },
  { prefix = "cfg_attr", body = "#[cfg_attr(${1}, ${2})]", desc = "#[cfg_attr(...)]" },
  { prefix = "derive", body = "#[derive(${1})]", desc = "#[derive(...)]" },

  { prefix = "cfg!", body = "cfg!(${1})", desc = "cfg!(...)" },
  { prefix = "column", body = "column!()" },
  { prefix = "concat", body = "concat!(${1})", desc = "concat!(...)" },
  { prefix = "concat_idents", body = "concat_idents!(${1})" },
  { prefix = "debug_assert", body = "debug_assert!(${1});" },
  { prefix = "debug_assert_eq", body = "debug_assert_eq!(${1}, ${2});" },
  { prefix = "env", body = 'env!("${1}")', desc = 'env!("...")' },
  { prefix = "file", body = "file!()" },
  { prefix = "format", body = 'format!("${1}")', desc = 'format!("...")' },
  { prefix = "format_args", body = 'format_args!("${1}")' },
  { prefix = "include", body = 'include!("${1}");' },
  { prefix = "include_bytes", body = 'include_bytes!("${1}")' },
  { prefix = "include_str", body = 'include_str!("${1}")' },
  { prefix = "line", body = "line!()" },
  { prefix = "module_path", body = "module_path!()" },
  { prefix = "option_env", body = 'option_env!("${1}")' },
  { prefix = "panic", body = 'panic!("${1}");' },
  { prefix = "print", body = 'print!("${1}");' },
  { prefix = "println", body = 'println!("${1}");' },
  { prefix = "stringify", body = "stringify!(${1})" },
  { prefix = "thread_local", body = "thread_local!(static ${1:STATIC}: ${2:Type} = ${3:init});" },
  { prefix = "try", body = "try!(${1})" },
  { prefix = "unimplemented", body = "unimplemented!()" },
  { prefix = "unreachable", body = "unreachable!(${1})" },
  { prefix = "vec", body = "vec![${1}]" },
  { prefix = "write", body = 'write!(${1}, "${2}")' },
  { prefix = "writeln", body = 'writeln!(${1}, "${2}")' },
  { prefix = "assert", body = "assert!(${1});" },
  { prefix = "assert_eq", body = "assert_eq!(${1}, ${2});" },

  { prefix = "const", body = "const ${1:CONST}: ${2:Type} = ${3:init};" },
  { prefix = "static", body = "static ${1:STATIC}: ${2:Type} = ${3:init};" },
  { prefix = "type", body = "type ${1:Alias} = ${2:Type};" },

  {
    prefix = "struct",
    body = { "#[derive(Debug)]", "struct ${1:Name} {", "\t${2:field}: ${3:Type}", "}" },
  },
  { prefix = "struct-tuple", body = "struct ${1:Name}(${2:Type});" },
  { prefix = "struct-unit", body = "struct ${1:Name};" },

  {
    prefix = "enum",
    body = { "#[derive(Debug)]", "enum ${1:Name} {", "\t${2:Variant1},", "\t${3:Variant2},", "}" },
  },

  { prefix = "trait", body = { "trait ${1:Name} {", "\t${2}", "}" } },
  { prefix = "impl-trait", body = { "impl ${1:Trait} for ${2:Type} {", "\t${3}", "}" } },

  { prefix = "fn", body = { "fn ${1:name}(${2:arg}: ${3:Type}) -> ${4:RetType} {", "\t${5:todo!();}", "}" } },
  { prefix = "pfn", body = { "pub fn ${1:name}(${2:arg}: ${3:Type}) -> ${4:RetType} {", "\t${5:todo!();}", "}" } },
  { prefix = "afn", body = { "async fn ${1:name}(${2:arg}: ${3:Type}) -> ${4:RetType} {", "\t${5:todo!();}", "}" } },
  {
    prefix = "pafn",
    body = { "pub async fn ${1:name}(${2:arg}: ${3:Type}) -> ${4:RetType} {", "\t${5:todo!();}", "}" },
  },
  { prefix = "main", body = { "fn main() {", "\t${1:todo!();}", "}" } },
  {
    prefix = "inline-fn",
    body = { "#[inline]", "pub fn ${1:name}() {", "\t${2:todo!();}", "}" },
  },

  { prefix = "extern-crate", body = "extern crate ${1:name};" },
  {
    prefix = "extern-fn",
    body = { 'extern "C" fn ${1:name}(${2:arg}: ${3:Type}) -> ${4:RetType} {', "\t${5}", "}" },
  },
  { prefix = "extern-mod", body = { 'extern "C" {', "\t${1}", "}" } },

  { prefix = "if", body = { "if ${1:condition} {", "\t${2:todo!();}", "}" } },
  { prefix = "if-let", body = { "if let ${1:Some(pat)} = ${2:expr} {", "\t${0:todo!();}", "}" } },
  { prefix = "match", body = "match ${1:expr} {}" },
  { prefix = "for", body = { "for ${1:pat} in ${2:expr} {", "\t${3:todo!();}", "}" } },
  { prefix = "while", body = { "while ${1:condition} {", "\t${2:todo!();}", "}" } },
  { prefix = "while-let", body = { "while let ${1:Some(pat)} = ${2:expr} {", "\t${0:todo!();}", "}" } },

  { prefix = "mod-block", body = { "mod ${1:name} {", "\t${2}", "}" } },

  { prefix = "test", body = { "#[test]", "fn ${1:name}() {", "\t${2:todo!();}", "}" } },
  {
    prefix = "modtest",
    body = { "#[cfg(test)]", "mod test {", "\t#[test]", "\tfn ${1:name}() {", "\t\t${2:todo!();}", "\t}", "}" },
  },
  {
    prefix = "bench",
    body = { "#[bench]", "fn ${1:name}(b: &mut test::Bencher) {", "\t${2:b.iter(|| ${3})}", "}" },
  },

  { prefix = "macro_rules", body = { "macro_rules! ${1:name} {", "\t(${2}) => (${3})", "}" } },
}
