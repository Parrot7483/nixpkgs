{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  pytest-asyncio,
  pytest-cov-stub,
  pytestCheckHook,
  pythonOlder,
  setuptools,
  typing-extensions,
}:

buildPythonPackage rec {
  pname = "aiostream";
  version = "0.6.4";
  pyproject = true;

  disabled = pythonOlder "3.9";

  src = fetchFromGitHub {
    owner = "vxgmichel";
    repo = "aiostream";
    tag = "v${version}";
    hash = "sha256-hRbPK1JsB/JQuSjj81YMUAI8eDUyXCOFhdW22ZJ47xU=";
  };

  build-system = [ setuptools ];

  dependencies = [ typing-extensions ];

  nativeCheckInputs = [
    pytest-asyncio
    pytest-cov-stub
    pytestCheckHook
  ];

  pythonImportsCheck = [ "aiostream" ];

  meta = with lib; {
    description = "Generator-based operators for asynchronous iteration";
    homepage = "https://aiostream.readthedocs.io";
    changelog = "https://github.com/vxgmichel/aiostream/releases/tag/v${version}";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [ rmcgibbo ];
  };
}
