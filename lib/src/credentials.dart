// Copyright (c) 2016, project contributors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

/// AWS credentials.
class Credentials {
  /// AWS access key
  final String accessKey;

  /// AWS secret key
  final String secretKey;

  /// AWS credentials.
  Credentials({this.accessKey, this.secretKey}) {
    assert(accessKey != null);
    assert(secretKey != null);
  }
}
