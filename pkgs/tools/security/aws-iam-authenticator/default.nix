{ lib, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "aws-iam-authenticator";
  version = "0.5.3";

  src = fetchFromGitHub {
    owner = "kubernetes-sigs";
    repo = pname;
    rev = "v${version}";
    sha256 = "0ga3vf5gn7533iqnxn7kchb6xg5wvk92livlqzkhi5qvqhl1sbw0";
  };

  vendorSha256 = null;

  buildFlagsArray = [ "-ldflags=-s -w -X main.version=v${version}" ];

  subPackages = [ "cmd/aws-iam-authenticator" ];

  meta = with lib; {
    homepage = "https://github.com/kubernetes-sigs/aws-iam-authenticator";
    description = "AWS IAM credentials for Kubernetes authentication";
    license = licenses.asl20;
    maintainers = [ maintainers.srhb ];
  };
}
