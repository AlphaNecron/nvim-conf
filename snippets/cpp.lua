return {
  {
    prefix = "cpp",
    body = {
      "#include <bits/stdc++.h>",
      "using namespace std;",
      "",
      "int main() {",
      "\tcin.tie(nullptr)->ios_base::sync_with_stdio(false);",
      "\t$0",
      "\treturn 0;",
      "}",
    },
    desc = "Default C++ template",
  },
  {
    prefix = "fileio",
    body = {
      'freopen("${1:${TM_FILENAME_BASE}}.INP", "r", stdin);',
      'freopen("${1:${TM_FILENAME_BASE}}.OUT", "w", stdout);',
    },
  },
  { prefix = "ull", body = "using ull = unsigned long long;" },
  { prefix = "ll", body = "using ll = long long;" },
  { prefix = "pii", body = "using pii = pair<int, int>;" },
  { prefix = "p2l", body = "using p2l = pair<ll, ll>;" },
  { prefix = "vec", body = "vector<$1> $2;" },
  { prefix = "prevec", body = "vector<$1> $2($3);" },
  { prefix = "vec2d", body = "vector<vector<$1>> $2($3, vector<$1>($4));" },
}
