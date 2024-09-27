{
  stdenvNoCC,
  lib,
  fetchurl,
}:

stdenvNoCC.mkDerivation rec {
  pname = "kubectl-jq";
  version = "0.0.2";

  src = fetchurl {
    url = "https://github.com/jrockway/kubectl-jq/releases/download/v${version}/kubectl-jq_v${version}_darwin_arm64";
    sha256 = "sha256-8fxfdpgMC09hDrIGNr0rXaGeNPCl7RW2MHbGbkf2WJ4=";
  };

  # Override the unpackPhase to simply copy the binary
  unpackPhase = ''
    mkdir $out
    cp $src $out/kubectl-jq
  '';

  installPhase = ''
    runHook preInstall

    mkdir -p $out/bin
    install -m755 $out/kubectl-jq $out/bin/kubectl-jq

    runHook postInstall
  '';

  meta = with lib; {
    description = "Get kubernetes Pods logs with jq processor";
    mainProgram = "kubectl-jq";
    homepage = "https://github.com/jrockway/kubectl-jq";
    license = licenses.asl20;
    maintainers = with maintainers; [ behoof4mind ];
    platforms = platforms.darwin;
  };
}
