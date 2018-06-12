import 'package:test/test.dart';
import 'package:web3dart/src/mnemonic/utils.dart';
import 'package:web3dart/src/utils/numbers.dart';

void main() {
//  test("Mnemonic List Word Loading Test", () {
//    var mnemonicList = MnemonicUtils.populateWordList();
//
//    mnemonicList.forEach((word) => print(word));
//
//
//  });
//
//  test("Generate Mnemonic List", () {
//    Random random = new Random.secure();
//    var mnemonic = MnemonicUtils.generateMnemonic(new DartRandom(random).nextBytes(32));
//
//   print(mnemonic);
//
//
//  });

//  test("Generate Seed", () {
//    var seed = MnemonicUtils.generateSeed(
//        "industry cram alley magnet odor crew expose flock frame relax rent diesel",
//        "");
//
//    print(bytesToHex(seed));
//  });

//  test("Generate Seed Hexadecimal", () {
//    var seedHex = MnemonicUtils.generateMasterSeedHex(
//        "earn only broken federal uniform delay frozen faith usual kit fluid degree omit work recipe song jeans decide auction evolve skull public vivid rotate",
//        "");
//
//    var seed = hexToBytes(seedHex);
//
//    print("Seed Hex: " + seedHex);
//
//    var passphrase = "Bitcoin seed";
//    var passphraseByteArray = utf8.encode(passphrase);
//
//    Uint8List rootSeed = hmacSha512(seed, passphraseByteArray);
//
//    var rootSeedHex = bytesToHex(rootSeed);
//
//    print("Root Seed Hex: $rootSeedHex | size: ${rootSeed.length}");
//    print("Root Seed Hex (0): ${rootSeed[0].toRadixString(
//        16)} |Root Seed Hex (31): ${rootSeed[31].toRadixString(16)}" +
//        "| Root Seed Hex (32): ${rootSeed[32].toRadixString(
//            16)} | Root Seed Hex (63): ${rootSeed[63].toRadixString(16)}   ");
//
//    var privateKey = new Uint8List(32);
//    var chainCode = new Uint8List(32);
//
//    List.copyRange(privateKey, 0, rootSeed, 0, 32);
//    List.copyRange(chainCode, 0, rootSeed, 32, 64);
//
//    var privateKeyHex = bytesToHex(privateKey);
//    print("Private Key Hex (${privateKey
//        .length}): ${privateKeyHex}  | Chain Code (${chainCode
//        .length}): ${bytesToHex(chainCode)}");
//
//    var publicKey = privateKeyToPublic(privateKey);
//    var publicKeyHex = bytesToHex(publicKey);
//
//    print("PublicKey Hex (L: ${publicKey.length}): $publicKeyHex ");
//  });

//  test("Generate Path Early Tests", () {
//    var seed = MnemonicUtils.generateMasterSeed(
//        "earn only broken federal uniform delay frozen faith usual kit fluid degree omit work recipe song jeans decide auction evolve skull public vivid rotate",
//        "");
//    Uint8List extendedPrivateKey = MnemonicUtils.getRootSeed(seed);
//    var privk = CKDprivHardened(extendedPrivateKey, 19).first;
//    print(bytesToHex(privk));
//  });

//  test("Child Private Key Derivation Test ", () {
//    var data =
//        "003C6CB8D0F6A264C91EA8B5030FADAA8E538B020F0A387421A12DE9319DC9336880000002";
//    var parentPrivateKeyHex =
//        "003C6CB8D0F6A264C91EA8B5030FADAA8E538B020F0A387421A12DE9319DC93368";
//    Uint8List hmac = hmacSha512(
//      hexToBytes(data),
//      hexToBytes(
//          "2A7857631386BA23DACAC34180DD1983734E444FDBF774041578E9B6ADB37C19"),
//    );
//
//    print("hmac: ${ bytesToHex(hmac) }");
//
//    var leftSideHash = new Uint8List(32);
//    List.copyRange(leftSideHash, 0, hmac, 0, 32);
//
//    BigInt cprivk = bytesToInt(leftSideHash) +
//        BigInt.parse(parentPrivateKeyHex, radix: 16) %
//            new ECCurve_secp256k1().n;
//
//    print("Addition: ${ bytesToHex(leftSideHash) } + ${parentPrivateKeyHex}");
//
//    print("cprivk: ${ cprivk
//        .toRadixString(16) }");
//
//    var cpubk = Credentials
//        .fromHexPrivateKey("ca2a7395e1886a34f846b6ed06f00515aa223b8252fbd9989aa0012d1a46f5f1")
//        .publicKey
//        .toRadixString(16);
//





  test("Child Private Key Hardened Derivation Test", () {
    var extendedPrivateKeyHexInput = hexToBytes(
        "3C6CB8D0F6A264C91EA8B5030FADAA8E538B020F0A387421A12DE9319DC933682A7857631386BA23DACAC34180DD1983734E444FDBF774041578E9B6ADB37C19");


    var childPrivateKeyHardened = CKDprivHardened(
      extendedPrivateKeyHexInput,
      2,
    )[0];

    var cprivkHardHex = bytesToHex(childPrivateKeyHardened);

    expect(cprivkHardHex, "cbce0d719ecf7431d88e6a89fa1483e02e35092af60c042b1df2ff59fa424dca");
  });

}
