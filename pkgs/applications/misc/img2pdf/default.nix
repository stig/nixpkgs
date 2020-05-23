{ stdenv, python3Packages }:

with python3Packages;

buildPythonApplication rec {
  pname = "img2pdf";
  version = "0.3.6";

  src = fetchPypi {
    inherit pname version;
    sha256 = "1yx0ljbg7phpix507wq584qvspp2jgax7flpp1148pxpc2d51mcc";
  };

  propagatedBuildInputs = [
    pillow
  ];

  meta = with stdenv.lib; {
    description = "Convert images to PDF via direct JPEG inclusion";
    homepage = "https://gitlab.mister-muffin.de/josch/img2pdf";
    license = licenses.lgpl2;
    platforms = platforms.unix;
    maintainers = [ maintainers.veprbl ];
  };
}
