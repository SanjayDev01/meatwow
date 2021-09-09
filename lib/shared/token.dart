class TokenHelper {
  // ignore: unused_element
  static Map getTokens(tokenData) {
    // Getting Ref Token
    List refTokenData = tokenData[0].split(";");
    List reftoken = refTokenData[0].split("=");

    List jwtTokenData = tokenData[1].split(";");
    List jwtToken = jwtTokenData[0].split("=");
    return {reftoken[0]: reftoken[1], jwtToken[0]: jwtToken[1]};
  }
}
