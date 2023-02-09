# See http://mirrors.ctan.org/support/latexmk/latexmk.pdf

@default_files = ('main.tex');

# Enable pdf output
$pdf_mode = 1;

# Extra files to be cleaned on 'latexmk -c'
$clean_ext = "pdata run.xml %R-blx.bib bbl nav out snm acn acr alg glg glo gls ist vrb";

# Allow for compiling glossaries
add_cus_dep('glo', 'gls', 0, 'run_makeglossaries');
add_cus_dep('acn', 'acr', 0, 'run_makeglossaries');
sub run_makeglossaries {
  if ( $silent ) {
    system "makeglossaries -q '$_[0]'";
  }
  else {
    system "makeglossaries '$_[0]'";
  };
}
