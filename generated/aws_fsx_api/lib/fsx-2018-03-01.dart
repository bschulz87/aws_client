// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name

import 'dart:convert';
import 'dart:typed_data';

import 'package:shared_aws_api/shared.dart' as _s;
import 'package:shared_aws_api/shared.dart'
    show
        Uint8ListConverter,
        Uint8ListListConverter,
        rfc822fromJson,
        rfc822toJson,
        iso8601fromJson,
        iso8601toJson,
        unixFromJson,
        unixToJson;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

part 'fsx-2018-03-01.g.dart';

/// Amazon FSx is a fully managed service that makes it easy for storage and
/// application administrators to launch and use shared file storage.
class FSx {
  final _s.JsonProtocol _protocol;
  FSx({
    @_s.required String region,
    @_s.required _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: 'fsx',
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Cancels an existing Amazon FSx for Lustre data repository task if that
  /// task is in either the <code>PENDING</code> or <code>EXECUTING</code>
  /// state. When you cancel a task, Amazon FSx does the following.
  ///
  /// <ul>
  /// <li>
  /// Any files that FSx has already exported are not reverted.
  /// </li>
  /// <li>
  /// FSx continues to export any files that are "in-flight" when the cancel
  /// operation is received.
  /// </li>
  /// <li>
  /// FSx does not export any files that have not yet been exported.
  /// </li>
  /// </ul>
  ///
  /// May throw [BadRequest].
  /// May throw [UnsupportedOperation].
  /// May throw [DataRepositoryTaskNotFound].
  /// May throw [DataRepositoryTaskEnded].
  /// May throw [InternalServerError].
  ///
  /// Parameter [taskId] :
  /// Specifies the data repository task to cancel.
  Future<CancelDataRepositoryTaskResponse> cancelDataRepositoryTask({
    @_s.required String taskId,
  }) async {
    ArgumentError.checkNotNull(taskId, 'taskId');
    _s.validateStringLength(
      'taskId',
      taskId,
      12,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'taskId',
      taskId,
      r'''^(task-[0-9a-f]{17,})$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSSimbaAPIService_v20180301.CancelDataRepositoryTask'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TaskId': taskId,
      },
    );

    return CancelDataRepositoryTaskResponse.fromJson(jsonResponse.body);
  }

  /// Creates a backup of an existing Amazon FSx for Windows File Server file
  /// system. Creating regular backups for your file system is a best practice
  /// that complements the replication that Amazon FSx for Windows File Server
  /// performs for your file system. It also enables you to restore from user
  /// modification of data.
  ///
  /// If a backup with the specified client request token exists, and the
  /// parameters match, this operation returns the description of the existing
  /// backup. If a backup specified client request token exists, and the
  /// parameters don't match, this operation returns
  /// <code>IncompatibleParameterError</code>. If a backup with the specified
  /// client request token doesn't exist, <code>CreateBackup</code> does the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// Creates a new Amazon FSx backup with an assigned ID, and an initial
  /// lifecycle state of <code>CREATING</code>.
  /// </li>
  /// <li>
  /// Returns the description of the backup.
  /// </li>
  /// </ul>
  /// By using the idempotent operation, you can retry a
  /// <code>CreateBackup</code> operation without the risk of creating an extra
  /// backup. This approach can be useful when an initial call fails in a way
  /// that makes it unclear whether a backup was created. If you use the same
  /// client request token and the initial call created a backup, the operation
  /// returns a successful result because all the parameters are the same.
  ///
  /// The <code>CreateFileSystem</code> operation returns while the backup's
  /// lifecycle state is still <code>CREATING</code>. You can check the file
  /// system creation status by calling the <a>DescribeBackups</a> operation,
  /// which returns the backup state along with other information.
  /// <note> <p/> </note>
  ///
  /// May throw [BadRequest].
  /// May throw [UnsupportedOperation].
  /// May throw [FileSystemNotFound].
  /// May throw [BackupInProgress].
  /// May throw [IncompatibleParameterError].
  /// May throw [ServiceLimitExceeded].
  /// May throw [InternalServerError].
  ///
  /// Parameter [fileSystemId] :
  /// The ID of the file system to back up.
  ///
  /// Parameter [clientRequestToken] :
  /// (Optional) A string of up to 64 ASCII characters that Amazon FSx uses to
  /// ensure idempotent creation. This string is automatically filled on your
  /// behalf when you use the AWS Command Line Interface (AWS CLI) or an AWS
  /// SDK.
  ///
  /// Parameter [tags] :
  /// The tags to apply to the backup at backup creation. The key value of the
  /// <code>Name</code> tag appears in the console as the backup name.
  Future<CreateBackupResponse> createBackup({
    @_s.required String fileSystemId,
    String clientRequestToken,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(fileSystemId, 'fileSystemId');
    _s.validateStringLength(
      'fileSystemId',
      fileSystemId,
      11,
      21,
      isRequired: true,
    );
    _s.validateStringPattern(
      'fileSystemId',
      fileSystemId,
      r'''^(fs-[0-9a-f]{8,})$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      1,
      63,
    );
    _s.validateStringPattern(
      'clientRequestToken',
      clientRequestToken,
      r'''[A-za-z0-9_.-]{0,63}$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSSimbaAPIService_v20180301.CreateBackup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'FileSystemId': fileSystemId,
        'ClientRequestToken': clientRequestToken,
        'Tags': tags,
      },
    );

    return CreateBackupResponse.fromJson(jsonResponse.body);
  }

  /// Creates an Amazon FSx for Lustre data repository task. You use data
  /// repository tasks to perform bulk operations between your Amazon FSx file
  /// system and its linked data repository. An example of a data repository
  /// task is exporting any data and metadata changes, including POSIX metadata,
  /// to files, directories, and symbolic links (symlinks) from your FSx file
  /// system to its linked data repository. A
  /// <code>CreateDataRepositoryTask</code> operation will fail if a data
  /// repository is not linked to the FSx file system. To learn more about data
  /// repository tasks, see <a
  /// href="https://docs.aws.amazon.com/fsx/latest/LustreGuide/data-repository-tasks.html">Using
  /// Data Repository Tasks</a>. To learn more about linking a data repository
  /// to your file system, see <a
  /// href="https://docs.aws.amazon.com/fsx/latest/LustreGuide/export-data-repository.html#export-prefix">Setting
  /// the Export Prefix</a>.
  ///
  /// May throw [BadRequest].
  /// May throw [UnsupportedOperation].
  /// May throw [FileSystemNotFound].
  /// May throw [IncompatibleParameterError].
  /// May throw [ServiceLimitExceeded].
  /// May throw [InternalServerError].
  /// May throw [DataRepositoryTaskExecuting].
  ///
  /// Parameter [report] :
  /// Defines whether or not Amazon FSx provides a CompletionReport once the
  /// task has completed. A CompletionReport provides a detailed report on the
  /// files that Amazon FSx processed that meet the criteria specified by the
  /// <code>Scope</code> parameter. For more information, see <a
  /// href="https://docs.aws.amazon.com/fsx/latest/LustreGuide/task-completion-report.html">Working
  /// with Task Completion Reports</a>.
  ///
  /// Parameter [type] :
  /// Specifies the type of data repository task to create.
  ///
  /// Parameter [paths] :
  /// (Optional) The path or paths on the Amazon FSx file system to use when the
  /// data repository task is processed. The default path is the file system
  /// root directory. The paths you provide need to be relative to the mount
  /// point of the file system. If the mount point is <code>/mnt/fsx</code> and
  /// <code>/mnt/fsx/path1</code> is a directory or file on the file system you
  /// want to export, then the path to provide is <code>path1</code>. If a path
  /// that you provide isn't valid, the task fails.
  Future<CreateDataRepositoryTaskResponse> createDataRepositoryTask({
    @_s.required String fileSystemId,
    @_s.required CompletionReport report,
    @_s.required DataRepositoryTaskType type,
    String clientRequestToken,
    List<String> paths,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(fileSystemId, 'fileSystemId');
    _s.validateStringLength(
      'fileSystemId',
      fileSystemId,
      11,
      21,
      isRequired: true,
    );
    _s.validateStringPattern(
      'fileSystemId',
      fileSystemId,
      r'''^(fs-[0-9a-f]{8,})$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(report, 'report');
    ArgumentError.checkNotNull(type, 'type');
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      1,
      63,
    );
    _s.validateStringPattern(
      'clientRequestToken',
      clientRequestToken,
      r'''[A-za-z0-9_.-]{0,63}$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSSimbaAPIService_v20180301.CreateDataRepositoryTask'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'FileSystemId': fileSystemId,
        'Report': report,
        'Type': type,
        'ClientRequestToken': clientRequestToken,
        'Paths': paths,
        'Tags': tags,
      },
    );

    return CreateDataRepositoryTaskResponse.fromJson(jsonResponse.body);
  }

  /// Creates a new, empty Amazon FSx file system.
  ///
  /// If a file system with the specified client request token exists and the
  /// parameters match, <code>CreateFileSystem</code> returns the description of
  /// the existing file system. If a file system specified client request token
  /// exists and the parameters don't match, this call returns
  /// <code>IncompatibleParameterError</code>. If a file system with the
  /// specified client request token doesn't exist,
  /// <code>CreateFileSystem</code> does the following:
  ///
  /// <ul>
  /// <li>
  /// Creates a new, empty Amazon FSx file system with an assigned ID, and an
  /// initial lifecycle state of <code>CREATING</code>.
  /// </li>
  /// <li>
  /// Returns the description of the file system.
  /// </li>
  /// </ul>
  /// This operation requires a client request token in the request that Amazon
  /// FSx uses to ensure idempotent creation. This means that calling the
  /// operation multiple times with the same client request token has no effect.
  /// By using the idempotent operation, you can retry a
  /// <code>CreateFileSystem</code> operation without the risk of creating an
  /// extra file system. This approach can be useful when an initial call fails
  /// in a way that makes it unclear whether a file system was created. Examples
  /// are if a transport level timeout occurred, or your connection was reset.
  /// If you use the same client request token and the initial call created a
  /// file system, the client receives success as long as the parameters are the
  /// same.
  /// <note>
  /// The <code>CreateFileSystem</code> call returns while the file system's
  /// lifecycle state is still <code>CREATING</code>. You can check the
  /// file-system creation status by calling the <a>DescribeFileSystems</a>
  /// operation, which returns the file system state along with other
  /// information.
  /// </note>
  ///
  /// May throw [BadRequest].
  /// May throw [ActiveDirectoryError].
  /// May throw [IncompatibleParameterError].
  /// May throw [InvalidImportPath].
  /// May throw [InvalidExportPath].
  /// May throw [InvalidNetworkSettings].
  /// May throw [InvalidPerUnitStorageThroughput].
  /// May throw [ServiceLimitExceeded].
  /// May throw [InternalServerError].
  /// May throw [MissingFileSystemConfiguration].
  ///
  /// Parameter [fileSystemType] :
  /// The type of Amazon FSx file system to create, either <code>WINDOWS</code>
  /// or <code>LUSTRE</code>.
  ///
  /// Parameter [storageCapacity] :
  /// Sets the storage capacity of the file system that you're creating.
  ///
  /// For Lustre file systems:
  ///
  /// <ul>
  /// <li>
  /// For <code>SCRATCH_2</code> and <code>PERSISTENT_1</code> deployment types,
  /// valid values are 1.2, 2.4, and increments of 2.4 TiB.
  /// </li>
  /// <li>
  /// For <code>SCRATCH_1</code> deployment type, valid values are 1.2, 2.4, and
  /// increments of 3.6 TiB.
  /// </li>
  /// </ul>
  /// For Windows file systems:
  ///
  /// <ul>
  /// <li>
  /// If <code>StorageType=SSD</code>, valid values are 32 GiB - 65,536 GiB (64
  /// TiB).
  /// </li>
  /// <li>
  /// If <code>StorageType=HDD</code>, valid values are 2000 GiB - 65,536 GiB
  /// (64 TiB).
  /// </li>
  /// </ul>
  ///
  /// Parameter [subnetIds] :
  /// Specifies the IDs of the subnets that the file system will be accessible
  /// from. For Windows <code>MULTI_AZ_1</code> file system deployment types,
  /// provide exactly two subnet IDs, one for the preferred file server and one
  /// for the standby file server. You specify one of these subnets as the
  /// preferred subnet using the <code>WindowsConfiguration &gt;
  /// PreferredSubnetID</code> property.
  ///
  /// For Windows <code>SINGLE_AZ_1</code> and <code>SINGLE_AZ_2</code> file
  /// system deployment types and Lustre file systems, provide exactly one
  /// subnet ID. The file server is launched in that subnet's Availability Zone.
  ///
  /// Parameter [clientRequestToken] :
  /// (Optional) A string of up to 64 ASCII characters that Amazon FSx uses to
  /// ensure idempotent creation. This string is automatically filled on your
  /// behalf when you use the AWS Command Line Interface (AWS CLI) or an AWS
  /// SDK.
  ///
  /// Parameter [securityGroupIds] :
  /// A list of IDs specifying the security groups to apply to all network
  /// interfaces created for file system access. This list isn't returned in
  /// later requests to describe the file system.
  ///
  /// Parameter [storageType] :
  /// Sets the storage type for the Amazon FSx for Windows file system you're
  /// creating. Valid values are <code>SSD</code> and <code>HDD</code>.
  ///
  /// <ul>
  /// <li>
  /// Set to <code>SSD</code> to use solid state drive storage. SSD is supported
  /// on all Windows deployment types.
  /// </li>
  /// <li>
  /// Set to <code>HDD</code> to use hard disk drive storage. HDD is supported
  /// on <code>SINGLE_AZ_2</code> and <code>MULTI_AZ_1</code> Windows file
  /// system deployment types.
  /// </li>
  /// </ul>
  /// Default value is <code>SSD</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/fsx/latest/WindowsGuide/optimize-fsx-tco.html#saz-maz-storage-type">
  /// Storage Type Options</a> in the <i>Amazon FSx for Windows User Guide</i>.
  ///
  /// Parameter [tags] :
  /// The tags to apply to the file system being created. The key value of the
  /// <code>Name</code> tag appears in the console as the file system name.
  ///
  /// Parameter [windowsConfiguration] :
  /// The Microsoft Windows configuration for the file system being created.
  Future<CreateFileSystemResponse> createFileSystem({
    @_s.required FileSystemType fileSystemType,
    @_s.required int storageCapacity,
    @_s.required List<String> subnetIds,
    String clientRequestToken,
    String kmsKeyId,
    CreateFileSystemLustreConfiguration lustreConfiguration,
    List<String> securityGroupIds,
    StorageType storageType,
    List<Tag> tags,
    CreateFileSystemWindowsConfiguration windowsConfiguration,
  }) async {
    ArgumentError.checkNotNull(fileSystemType, 'fileSystemType');
    ArgumentError.checkNotNull(storageCapacity, 'storageCapacity');
    _s.validateNumRange(
      'storageCapacity',
      storageCapacity,
      0,
      1152921504606846976,
      isRequired: true,
    );
    ArgumentError.checkNotNull(subnetIds, 'subnetIds');
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      1,
      63,
    );
    _s.validateStringPattern(
      'clientRequestToken',
      clientRequestToken,
      r'''[A-za-z0-9_.-]{0,63}$''',
    );
    _s.validateStringLength(
      'kmsKeyId',
      kmsKeyId,
      1,
      2048,
    );
    _s.validateStringPattern(
      'kmsKeyId',
      kmsKeyId,
      r'''^.{1,2048}$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSSimbaAPIService_v20180301.CreateFileSystem'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'FileSystemType': fileSystemType,
        'StorageCapacity': storageCapacity,
        'SubnetIds': subnetIds,
        'ClientRequestToken': clientRequestToken,
        'KmsKeyId': kmsKeyId,
        'LustreConfiguration': lustreConfiguration,
        'SecurityGroupIds': securityGroupIds,
        'StorageType': storageType,
        'Tags': tags,
        'WindowsConfiguration': windowsConfiguration,
      },
    );

    return CreateFileSystemResponse.fromJson(jsonResponse.body);
  }

  /// Creates a new Amazon FSx file system from an existing Amazon FSx for
  /// Windows File Server backup.
  ///
  /// If a file system with the specified client request token exists and the
  /// parameters match, this operation returns the description of the file
  /// system. If a client request token specified by the file system exists and
  /// the parameters don't match, this call returns
  /// <code>IncompatibleParameterError</code>. If a file system with the
  /// specified client request token doesn't exist, this operation does the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// Creates a new Amazon FSx file system from backup with an assigned ID, and
  /// an initial lifecycle state of <code>CREATING</code>.
  /// </li>
  /// <li>
  /// Returns the description of the file system.
  /// </li>
  /// </ul>
  /// Parameters like Active Directory, default share name, automatic backup,
  /// and backup settings default to the parameters of the file system that was
  /// backed up, unless overridden. You can explicitly supply other settings.
  ///
  /// By using the idempotent operation, you can retry a
  /// <code>CreateFileSystemFromBackup</code> call without the risk of creating
  /// an extra file system. This approach can be useful when an initial call
  /// fails in a way that makes it unclear whether a file system was created.
  /// Examples are if a transport level timeout occurred, or your connection was
  /// reset. If you use the same client request token and the initial call
  /// created a file system, the client receives success as long as the
  /// parameters are the same.
  /// <note>
  /// The <code>CreateFileSystemFromBackup</code> call returns while the file
  /// system's lifecycle state is still <code>CREATING</code>. You can check the
  /// file-system creation status by calling the <a>DescribeFileSystems</a>
  /// operation, which returns the file system state along with other
  /// information.
  /// </note>
  ///
  /// May throw [BadRequest].
  /// May throw [ActiveDirectoryError].
  /// May throw [IncompatibleParameterError].
  /// May throw [InvalidNetworkSettings].
  /// May throw [ServiceLimitExceeded].
  /// May throw [BackupNotFound].
  /// May throw [InternalServerError].
  /// May throw [MissingFileSystemConfiguration].
  ///
  /// Parameter [subnetIds] :
  /// Specifies the IDs of the subnets that the file system will be accessible
  /// from. For Windows <code>MULTI_AZ_1</code> file system deployment types,
  /// provide exactly two subnet IDs, one for the preferred file server and one
  /// for the standby file server. You specify one of these subnets as the
  /// preferred subnet using the <code>WindowsConfiguration &gt;
  /// PreferredSubnetID</code> property.
  ///
  /// For Windows <code>SINGLE_AZ_1</code> and <code>SINGLE_AZ_2</code>
  /// deployment types and Lustre file systems, provide exactly one subnet ID.
  /// The file server is launched in that subnet's Availability Zone.
  ///
  /// Parameter [clientRequestToken] :
  /// (Optional) A string of up to 64 ASCII characters that Amazon FSx uses to
  /// ensure idempotent creation. This string is automatically filled on your
  /// behalf when you use the AWS Command Line Interface (AWS CLI) or an AWS
  /// SDK.
  ///
  /// Parameter [securityGroupIds] :
  /// A list of IDs for the security groups that apply to the specified network
  /// interfaces created for file system access. These security groups apply to
  /// all network interfaces. This value isn't returned in later
  /// DescribeFileSystem requests.
  ///
  /// Parameter [storageType] :
  /// Sets the storage type for the Windows file system you're creating from a
  /// backup. Valid values are <code>SSD</code> and <code>HDD</code>.
  ///
  /// <ul>
  /// <li>
  /// Set to <code>SSD</code> to use solid state drive storage. Supported on all
  /// Windows deployment types.
  /// </li>
  /// <li>
  /// Set to <code>HDD</code> to use hard disk drive storage. Supported on
  /// <code>SINGLE_AZ_2</code> and <code>MULTI_AZ_1</code> Windows file system
  /// deployment types.
  /// </li>
  /// </ul>
  /// Default value is <code>SSD</code>.
  /// <note>
  /// HDD and SSD storage types have different minimum storage capacity
  /// requirements. A restored file system's storage capacity is tied to the
  /// file system that was backed up. You can create a file system that uses HDD
  /// storage from a backup of a file system that used SSD storage only if the
  /// original SSD file system had a storage capacity of at least 2000 GiB.
  /// </note>
  ///
  /// Parameter [tags] :
  /// The tags to be applied to the file system at file system creation. The key
  /// value of the <code>Name</code> tag appears in the console as the file
  /// system name.
  ///
  /// Parameter [windowsConfiguration] :
  /// The configuration for this Microsoft Windows file system.
  Future<CreateFileSystemFromBackupResponse> createFileSystemFromBackup({
    @_s.required String backupId,
    @_s.required List<String> subnetIds,
    String clientRequestToken,
    List<String> securityGroupIds,
    StorageType storageType,
    List<Tag> tags,
    CreateFileSystemWindowsConfiguration windowsConfiguration,
  }) async {
    ArgumentError.checkNotNull(backupId, 'backupId');
    _s.validateStringLength(
      'backupId',
      backupId,
      12,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'backupId',
      backupId,
      r'''^(backup-[0-9a-f]{8,})$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(subnetIds, 'subnetIds');
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      1,
      63,
    );
    _s.validateStringPattern(
      'clientRequestToken',
      clientRequestToken,
      r'''[A-za-z0-9_.-]{0,63}$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSSimbaAPIService_v20180301.CreateFileSystemFromBackup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'BackupId': backupId,
        'SubnetIds': subnetIds,
        'ClientRequestToken': clientRequestToken,
        'SecurityGroupIds': securityGroupIds,
        'StorageType': storageType,
        'Tags': tags,
        'WindowsConfiguration': windowsConfiguration,
      },
    );

    return CreateFileSystemFromBackupResponse.fromJson(jsonResponse.body);
  }

  /// Deletes an Amazon FSx for Windows File Server backup, deleting its
  /// contents. After deletion, the backup no longer exists, and its data is
  /// gone.
  ///
  /// The <code>DeleteBackup</code> call returns instantly. The backup will not
  /// show up in later <code>DescribeBackups</code> calls.
  /// <important>
  /// The data in a deleted backup is also deleted and can't be recovered by any
  /// means.
  /// </important>
  ///
  /// May throw [BadRequest].
  /// May throw [BackupInProgress].
  /// May throw [BackupNotFound].
  /// May throw [BackupRestoring].
  /// May throw [IncompatibleParameterError].
  /// May throw [InternalServerError].
  ///
  /// Parameter [backupId] :
  /// The ID of the backup you want to delete.
  ///
  /// Parameter [clientRequestToken] :
  /// (Optional) A string of up to 64 ASCII characters that Amazon FSx uses to
  /// ensure idempotent deletion. This is automatically filled on your behalf
  /// when using the AWS CLI or SDK.
  Future<DeleteBackupResponse> deleteBackup({
    @_s.required String backupId,
    String clientRequestToken,
  }) async {
    ArgumentError.checkNotNull(backupId, 'backupId');
    _s.validateStringLength(
      'backupId',
      backupId,
      12,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'backupId',
      backupId,
      r'''^(backup-[0-9a-f]{8,})$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      1,
      63,
    );
    _s.validateStringPattern(
      'clientRequestToken',
      clientRequestToken,
      r'''[A-za-z0-9_.-]{0,63}$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSSimbaAPIService_v20180301.DeleteBackup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'BackupId': backupId,
        'ClientRequestToken': clientRequestToken,
      },
    );

    return DeleteBackupResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a file system, deleting its contents. After deletion, the file
  /// system no longer exists, and its data is gone. Any existing automatic
  /// backups will also be deleted.
  ///
  /// By default, when you delete an Amazon FSx for Windows File Server file
  /// system, a final backup is created upon deletion. This final backup is not
  /// subject to the file system's retention policy, and must be manually
  /// deleted.
  ///
  /// The <code>DeleteFileSystem</code> action returns while the file system has
  /// the <code>DELETING</code> status. You can check the file system deletion
  /// status by calling the <a>DescribeFileSystems</a> action, which returns a
  /// list of file systems in your account. If you pass the file system ID for a
  /// deleted file system, the <a>DescribeFileSystems</a> returns a
  /// <code>FileSystemNotFound</code> error.
  /// <note>
  /// Deleting an Amazon FSx for Lustre file system will fail with a 400
  /// BadRequest if a data repository task is in a <code>PENDING</code> or
  /// <code>EXECUTING</code> state.
  /// </note> <important>
  /// The data in a deleted file system is also deleted and can't be recovered
  /// by any means.
  /// </important>
  ///
  /// May throw [BadRequest].
  /// May throw [IncompatibleParameterError].
  /// May throw [FileSystemNotFound].
  /// May throw [ServiceLimitExceeded].
  /// May throw [InternalServerError].
  ///
  /// Parameter [fileSystemId] :
  /// The ID of the file system you want to delete.
  ///
  /// Parameter [clientRequestToken] :
  /// (Optional) A string of up to 64 ASCII characters that Amazon FSx uses to
  /// ensure idempotent deletion. This is automatically filled on your behalf
  /// when using the AWS CLI or SDK.
  Future<DeleteFileSystemResponse> deleteFileSystem({
    @_s.required String fileSystemId,
    String clientRequestToken,
    DeleteFileSystemWindowsConfiguration windowsConfiguration,
  }) async {
    ArgumentError.checkNotNull(fileSystemId, 'fileSystemId');
    _s.validateStringLength(
      'fileSystemId',
      fileSystemId,
      11,
      21,
      isRequired: true,
    );
    _s.validateStringPattern(
      'fileSystemId',
      fileSystemId,
      r'''^(fs-[0-9a-f]{8,})$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      1,
      63,
    );
    _s.validateStringPattern(
      'clientRequestToken',
      clientRequestToken,
      r'''[A-za-z0-9_.-]{0,63}$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSSimbaAPIService_v20180301.DeleteFileSystem'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'FileSystemId': fileSystemId,
        'ClientRequestToken': clientRequestToken,
        'WindowsConfiguration': windowsConfiguration,
      },
    );

    return DeleteFileSystemResponse.fromJson(jsonResponse.body);
  }

  /// Returns the description of specific Amazon FSx for Windows File Server
  /// backups, if a <code>BackupIds</code> value is provided for that backup.
  /// Otherwise, it returns all backups owned by your AWS account in the AWS
  /// Region of the endpoint that you're calling.
  ///
  /// When retrieving all backups, you can optionally specify the
  /// <code>MaxResults</code> parameter to limit the number of backups in a
  /// response. If more backups remain, Amazon FSx returns a
  /// <code>NextToken</code> value in the response. In this case, send a later
  /// request with the <code>NextToken</code> request parameter set to the value
  /// of <code>NextToken</code> from the last response.
  ///
  /// This action is used in an iterative process to retrieve a list of your
  /// backups. <code>DescribeBackups</code> is called first without a
  /// <code>NextToken</code>value. Then the action continues to be called with
  /// the <code>NextToken</code> parameter set to the value of the last
  /// <code>NextToken</code> value until a response has no
  /// <code>NextToken</code>.
  ///
  /// When using this action, keep the following in mind:
  ///
  /// <ul>
  /// <li>
  /// The implementation might return fewer than <code>MaxResults</code> file
  /// system descriptions while still including a <code>NextToken</code> value.
  /// </li>
  /// <li>
  /// The order of backups returned in the response of one
  /// <code>DescribeBackups</code> call and the order of backups returned across
  /// the responses of a multi-call iteration is unspecified.
  /// </li>
  /// </ul>
  ///
  /// May throw [BadRequest].
  /// May throw [FileSystemNotFound].
  /// May throw [BackupNotFound].
  /// May throw [InternalServerError].
  ///
  /// Parameter [backupIds] :
  /// (Optional) IDs of the backups you want to retrieve (String). This
  /// overrides any filters. If any IDs are not found, BackupNotFound will be
  /// thrown.
  ///
  /// Parameter [filters] :
  /// (Optional) Filters structure. Supported names are file-system-id and
  /// backup-type.
  ///
  /// Parameter [maxResults] :
  /// (Optional) Maximum number of backups to return in the response (integer).
  /// This parameter value must be greater than 0. The number of items that
  /// Amazon FSx returns is the minimum of the <code>MaxResults</code> parameter
  /// specified in the request and the service's internal maximum number of
  /// items per page.
  ///
  /// Parameter [nextToken] :
  /// (Optional) Opaque pagination token returned from a previous
  /// <code>DescribeBackups</code> operation (String). If a token present, the
  /// action continues the list from where the returning call left off.
  Future<DescribeBackupsResponse> describeBackups({
    List<String> backupIds,
    List<Filter> filters,
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      255,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''^(?:[A-Za-z0-9+\/]{4})*(?:[A-Za-z0-9+\/]{2}==|[A-Za-z0-9+\/]{3}=)?$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSSimbaAPIService_v20180301.DescribeBackups'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'BackupIds': backupIds,
        'Filters': filters,
        'MaxResults': maxResults,
        'NextToken': nextToken,
      },
    );

    return DescribeBackupsResponse.fromJson(jsonResponse.body);
  }

  /// Returns the description of specific Amazon FSx for Lustre data repository
  /// tasks, if one or more <code>TaskIds</code> values are provided in the
  /// request, or if filters are used in the request. You can use filters to
  /// narrow the response to include just tasks for specific file systems, or
  /// tasks in a specific lifecycle state. Otherwise, it returns all data
  /// repository tasks owned by your AWS account in the AWS Region of the
  /// endpoint that you're calling.
  ///
  /// When retrieving all tasks, you can paginate the response by using the
  /// optional <code>MaxResults</code> parameter to limit the number of tasks
  /// returned in a response. If more tasks remain, Amazon FSx returns a
  /// <code>NextToken</code> value in the response. In this case, send a later
  /// request with the <code>NextToken</code> request parameter set to the value
  /// of <code>NextToken</code> from the last response.
  ///
  /// May throw [BadRequest].
  /// May throw [FileSystemNotFound].
  /// May throw [DataRepositoryTaskNotFound].
  /// May throw [InternalServerError].
  ///
  /// Parameter [filters] :
  /// (Optional) You can use filters to narrow the
  /// <code>DescribeDataRepositoryTasks</code> response to include just tasks
  /// for specific file systems, or tasks in a specific lifecycle state.
  ///
  /// Parameter [taskIds] :
  /// (Optional) IDs of the tasks whose descriptions you want to retrieve
  /// (String).
  Future<DescribeDataRepositoryTasksResponse> describeDataRepositoryTasks({
    List<DataRepositoryTaskFilter> filters,
    int maxResults,
    String nextToken,
    List<String> taskIds,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      255,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''^(?:[A-Za-z0-9+\/]{4})*(?:[A-Za-z0-9+\/]{2}==|[A-Za-z0-9+\/]{3}=)?$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSSimbaAPIService_v20180301.DescribeDataRepositoryTasks'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Filters': filters,
        'MaxResults': maxResults,
        'NextToken': nextToken,
        'TaskIds': taskIds,
      },
    );

    return DescribeDataRepositoryTasksResponse.fromJson(jsonResponse.body);
  }

  /// Returns the description of specific Amazon FSx file systems, if a
  /// <code>FileSystemIds</code> value is provided for that file system.
  /// Otherwise, it returns descriptions of all file systems owned by your AWS
  /// account in the AWS Region of the endpoint that you're calling.
  ///
  /// When retrieving all file system descriptions, you can optionally specify
  /// the <code>MaxResults</code> parameter to limit the number of descriptions
  /// in a response. If more file system descriptions remain, Amazon FSx returns
  /// a <code>NextToken</code> value in the response. In this case, send a later
  /// request with the <code>NextToken</code> request parameter set to the value
  /// of <code>NextToken</code> from the last response.
  ///
  /// This action is used in an iterative process to retrieve a list of your
  /// file system descriptions. <code>DescribeFileSystems</code> is called first
  /// without a <code>NextToken</code>value. Then the action continues to be
  /// called with the <code>NextToken</code> parameter set to the value of the
  /// last <code>NextToken</code> value until a response has no
  /// <code>NextToken</code>.
  ///
  /// When using this action, keep the following in mind:
  ///
  /// <ul>
  /// <li>
  /// The implementation might return fewer than <code>MaxResults</code> file
  /// system descriptions while still including a <code>NextToken</code> value.
  /// </li>
  /// <li>
  /// The order of file systems returned in the response of one
  /// <code>DescribeFileSystems</code> call and the order of file systems
  /// returned across the responses of a multicall iteration is unspecified.
  /// </li>
  /// </ul>
  ///
  /// May throw [BadRequest].
  /// May throw [FileSystemNotFound].
  /// May throw [InternalServerError].
  ///
  /// Parameter [fileSystemIds] :
  /// (Optional) IDs of the file systems whose descriptions you want to retrieve
  /// (String).
  ///
  /// Parameter [maxResults] :
  /// (Optional) Maximum number of file systems to return in the response
  /// (integer). This parameter value must be greater than 0. The number of
  /// items that Amazon FSx returns is the minimum of the
  /// <code>MaxResults</code> parameter specified in the request and the
  /// service's internal maximum number of items per page.
  ///
  /// Parameter [nextToken] :
  /// (Optional) Opaque pagination token returned from a previous
  /// <code>DescribeFileSystems</code> operation (String). If a token present,
  /// the action continues the list from where the returning call left off.
  Future<DescribeFileSystemsResponse> describeFileSystems({
    List<String> fileSystemIds,
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      255,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''^(?:[A-Za-z0-9+\/]{4})*(?:[A-Za-z0-9+\/]{2}==|[A-Za-z0-9+\/]{3}=)?$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSSimbaAPIService_v20180301.DescribeFileSystems'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'FileSystemIds': fileSystemIds,
        'MaxResults': maxResults,
        'NextToken': nextToken,
      },
    );

    return DescribeFileSystemsResponse.fromJson(jsonResponse.body);
  }

  /// Lists tags for an Amazon FSx file systems and backups in the case of
  /// Amazon FSx for Windows File Server.
  ///
  /// When retrieving all tags, you can optionally specify the
  /// <code>MaxResults</code> parameter to limit the number of tags in a
  /// response. If more tags remain, Amazon FSx returns a <code>NextToken</code>
  /// value in the response. In this case, send a later request with the
  /// <code>NextToken</code> request parameter set to the value of
  /// <code>NextToken</code> from the last response.
  ///
  /// This action is used in an iterative process to retrieve a list of your
  /// tags. <code>ListTagsForResource</code> is called first without a
  /// <code>NextToken</code>value. Then the action continues to be called with
  /// the <code>NextToken</code> parameter set to the value of the last
  /// <code>NextToken</code> value until a response has no
  /// <code>NextToken</code>.
  ///
  /// When using this action, keep the following in mind:
  ///
  /// <ul>
  /// <li>
  /// The implementation might return fewer than <code>MaxResults</code> file
  /// system descriptions while still including a <code>NextToken</code> value.
  /// </li>
  /// <li>
  /// The order of tags returned in the response of one
  /// <code>ListTagsForResource</code> call and the order of tags returned
  /// across the responses of a multi-call iteration is unspecified.
  /// </li>
  /// </ul>
  ///
  /// May throw [BadRequest].
  /// May throw [InternalServerError].
  /// May throw [ResourceNotFound].
  /// May throw [NotServiceResourceError].
  /// May throw [ResourceDoesNotSupportTagging].
  ///
  /// Parameter [resourceARN] :
  /// The ARN of the Amazon FSx resource that will have its tags listed.
  ///
  /// Parameter [maxResults] :
  /// (Optional) Maximum number of tags to return in the response (integer).
  /// This parameter value must be greater than 0. The number of items that
  /// Amazon FSx returns is the minimum of the <code>MaxResults</code> parameter
  /// specified in the request and the service's internal maximum number of
  /// items per page.
  ///
  /// Parameter [nextToken] :
  /// (Optional) Opaque pagination token returned from a previous
  /// <code>ListTagsForResource</code> operation (String). If a token present,
  /// the action continues the list from where the returning call left off.
  Future<ListTagsForResourceResponse> listTagsForResource({
    @_s.required String resourceARN,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(resourceARN, 'resourceARN');
    _s.validateStringLength(
      'resourceARN',
      resourceARN,
      8,
      512,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceARN',
      resourceARN,
      r'''^arn:(?=[^:]+:fsx:[^:]+:\d{12}:)((|(?=[a-z0-9-.]{1,63})(?!\d{1,3}(\.\d{1,3}){3})(?![^:]*-{2})(?![^:]*-\.)(?![^:]*\.-)[a-z0-9].*(?<!-)):){4}(?!/).{0,1024}$''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      255,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''^(?:[A-Za-z0-9+\/]{4})*(?:[A-Za-z0-9+\/]{2}==|[A-Za-z0-9+\/]{3}=)?$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSSimbaAPIService_v20180301.ListTagsForResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceARN': resourceARN,
        'MaxResults': maxResults,
        'NextToken': nextToken,
      },
    );

    return ListTagsForResourceResponse.fromJson(jsonResponse.body);
  }

  /// Tags an Amazon FSx resource.
  ///
  /// May throw [BadRequest].
  /// May throw [InternalServerError].
  /// May throw [ResourceNotFound].
  /// May throw [NotServiceResourceError].
  /// May throw [ResourceDoesNotSupportTagging].
  ///
  /// Parameter [resourceARN] :
  /// The Amazon Resource Name (ARN) of the Amazon FSx resource that you want to
  /// tag.
  ///
  /// Parameter [tags] :
  /// A list of tags for the resource. If a tag with a given key already exists,
  /// the value is replaced by the one specified in this parameter.
  Future<void> tagResource({
    @_s.required String resourceARN,
    @_s.required List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(resourceARN, 'resourceARN');
    _s.validateStringLength(
      'resourceARN',
      resourceARN,
      8,
      512,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceARN',
      resourceARN,
      r'''^arn:(?=[^:]+:fsx:[^:]+:\d{12}:)((|(?=[a-z0-9-.]{1,63})(?!\d{1,3}(\.\d{1,3}){3})(?![^:]*-{2})(?![^:]*-\.)(?![^:]*\.-)[a-z0-9].*(?<!-)):){4}(?!/).{0,1024}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tags, 'tags');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSSimbaAPIService_v20180301.TagResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceARN': resourceARN,
        'Tags': tags,
      },
    );

    return TagResourceResponse.fromJson(jsonResponse.body);
  }

  /// This action removes a tag from an Amazon FSx resource.
  ///
  /// May throw [BadRequest].
  /// May throw [InternalServerError].
  /// May throw [ResourceNotFound].
  /// May throw [NotServiceResourceError].
  /// May throw [ResourceDoesNotSupportTagging].
  ///
  /// Parameter [resourceARN] :
  /// The ARN of the Amazon FSx resource to untag.
  ///
  /// Parameter [tagKeys] :
  /// A list of keys of tags on the resource to untag. In case the tag key
  /// doesn't exist, the call will still succeed to be idempotent.
  Future<void> untagResource({
    @_s.required String resourceARN,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceARN, 'resourceARN');
    _s.validateStringLength(
      'resourceARN',
      resourceARN,
      8,
      512,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceARN',
      resourceARN,
      r'''^arn:(?=[^:]+:fsx:[^:]+:\d{12}:)((|(?=[a-z0-9-.]{1,63})(?!\d{1,3}(\.\d{1,3}){3})(?![^:]*-{2})(?![^:]*-\.)(?![^:]*\.-)[a-z0-9].*(?<!-)):){4}(?!/).{0,1024}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSSimbaAPIService_v20180301.UntagResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceARN': resourceARN,
        'TagKeys': tagKeys,
      },
    );

    return UntagResourceResponse.fromJson(jsonResponse.body);
  }

  /// Updates a file system configuration.
  ///
  /// May throw [BadRequest].
  /// May throw [UnsupportedOperation].
  /// May throw [IncompatibleParameterError].
  /// May throw [InternalServerError].
  /// May throw [FileSystemNotFound].
  /// May throw [MissingFileSystemConfiguration].
  ///
  /// Parameter [clientRequestToken] :
  /// (Optional) A string of up to 64 ASCII characters that Amazon FSx uses to
  /// ensure idempotent updates. This string is automatically filled on your
  /// behalf when you use the AWS Command Line Interface (AWS CLI) or an AWS
  /// SDK.
  ///
  /// Parameter [windowsConfiguration] :
  /// The configuration update for this Microsoft Windows file system. The only
  /// supported options are for backup and maintenance and for self-managed
  /// Active Directory configuration.
  Future<UpdateFileSystemResponse> updateFileSystem({
    @_s.required String fileSystemId,
    String clientRequestToken,
    UpdateFileSystemLustreConfiguration lustreConfiguration,
    UpdateFileSystemWindowsConfiguration windowsConfiguration,
  }) async {
    ArgumentError.checkNotNull(fileSystemId, 'fileSystemId');
    _s.validateStringLength(
      'fileSystemId',
      fileSystemId,
      11,
      21,
      isRequired: true,
    );
    _s.validateStringPattern(
      'fileSystemId',
      fileSystemId,
      r'''^(fs-[0-9a-f]{8,})$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      1,
      63,
    );
    _s.validateStringPattern(
      'clientRequestToken',
      clientRequestToken,
      r'''[A-za-z0-9_.-]{0,63}$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSSimbaAPIService_v20180301.UpdateFileSystem'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'FileSystemId': fileSystemId,
        'ClientRequestToken': clientRequestToken,
        'LustreConfiguration': lustreConfiguration,
        'WindowsConfiguration': windowsConfiguration,
      },
    );

    return UpdateFileSystemResponse.fromJson(jsonResponse.body);
  }
}

/// The Microsoft AD attributes of the Amazon FSx for Windows File Server file
/// system.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ActiveDirectoryBackupAttributes {
  /// The ID of the AWS Managed Microsoft Active Directory instance to which the
  /// file system is joined.
  @_s.JsonKey(name: 'ActiveDirectoryId')
  final String activeDirectoryId;

  /// The fully qualified domain name of the self-managed AD directory.
  @_s.JsonKey(name: 'DomainName')
  final String domainName;

  ActiveDirectoryBackupAttributes({
    this.activeDirectoryId,
    this.domainName,
  });
  factory ActiveDirectoryBackupAttributes.fromJson(Map<String, dynamic> json) =>
      _$ActiveDirectoryBackupAttributesFromJson(json);
}

/// A backup of an Amazon FSx for Windows File Server file system. You can
/// create a new file system from a backup to protect against data loss.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Backup {
  /// The ID of the backup.
  @_s.JsonKey(name: 'BackupId')
  final String backupId;

  /// The time when a particular backup was created.
  @_s.JsonKey(name: 'CreationTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime creationTime;

  /// Metadata of the file system associated with the backup. This metadata is
  /// persisted even if the file system is deleted.
  @_s.JsonKey(name: 'FileSystem')
  final FileSystem fileSystem;

  /// The lifecycle status of the backup.
  @_s.JsonKey(name: 'Lifecycle')
  final BackupLifecycle lifecycle;

  /// The type of the backup.
  @_s.JsonKey(name: 'Type')
  final BackupType type;

  /// The configuration of the self-managed Microsoft Active Directory (AD) to
  /// which the Windows File Server instance is joined.
  @_s.JsonKey(name: 'DirectoryInformation')
  final ActiveDirectoryBackupAttributes directoryInformation;

  /// Details explaining any failures that occur when creating a backup.
  @_s.JsonKey(name: 'FailureDetails')
  final BackupFailureDetails failureDetails;

  /// The ID of the AWS Key Management Service (AWS KMS) key used to encrypt this
  /// backup of the Amazon FSx for Windows file system's data at rest. Amazon FSx
  /// for Lustre does not support KMS encryption.
  @_s.JsonKey(name: 'KmsKeyId')
  final String kmsKeyId;
  @_s.JsonKey(name: 'ProgressPercent')
  final int progressPercent;

  /// The Amazon Resource Name (ARN) for the backup resource.
  @_s.JsonKey(name: 'ResourceARN')
  final String resourceARN;

  /// Tags associated with a particular file system.
  @_s.JsonKey(name: 'Tags')
  final List<Tag> tags;

  Backup({
    @_s.required this.backupId,
    @_s.required this.creationTime,
    @_s.required this.fileSystem,
    @_s.required this.lifecycle,
    @_s.required this.type,
    this.directoryInformation,
    this.failureDetails,
    this.kmsKeyId,
    this.progressPercent,
    this.resourceARN,
    this.tags,
  });
  factory Backup.fromJson(Map<String, dynamic> json) => _$BackupFromJson(json);
}

/// If backup creation fails, this structure contains the details of that
/// failure.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BackupFailureDetails {
  /// A message describing the backup creation failure.
  @_s.JsonKey(name: 'Message')
  final String message;

  BackupFailureDetails({
    this.message,
  });
  factory BackupFailureDetails.fromJson(Map<String, dynamic> json) =>
      _$BackupFailureDetailsFromJson(json);
}

/// The lifecycle status of the backup.
enum BackupLifecycle {
  @_s.JsonValue('AVAILABLE')
  available,
  @_s.JsonValue('CREATING')
  creating,
  @_s.JsonValue('DELETED')
  deleted,
  @_s.JsonValue('FAILED')
  failed,
}

/// The type of the backup.
enum BackupType {
  @_s.JsonValue('AUTOMATIC')
  automatic,
  @_s.JsonValue('USER_INITIATED')
  userInitiated,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CancelDataRepositoryTaskResponse {
  /// The lifecycle status of the data repository task, as follows:
  ///
  /// <ul>
  /// <li>
  /// <code>PENDING</code> - Amazon FSx has not started the task.
  /// </li>
  /// <li>
  /// <code>EXECUTING</code> - Amazon FSx is processing the task.
  /// </li>
  /// <li>
  /// <code>FAILED</code> - Amazon FSx was not able to complete the task. For
  /// example, there may be files the task failed to process. The
  /// <a>DataRepositoryTaskFailureDetails</a> property provides more information
  /// about task failures.
  /// </li>
  /// <li>
  /// <code>SUCCEEDED</code> - FSx completed the task successfully.
  /// </li>
  /// <li>
  /// <code>CANCELED</code> - Amazon FSx canceled the task and it did not
  /// complete.
  /// </li>
  /// <li>
  /// <code>CANCELING</code> - FSx is in process of canceling the task.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Lifecycle')
  final DataRepositoryTaskLifecycle lifecycle;

  /// The ID of the task being canceled.
  @_s.JsonKey(name: 'TaskId')
  final String taskId;

  CancelDataRepositoryTaskResponse({
    this.lifecycle,
    this.taskId,
  });
  factory CancelDataRepositoryTaskResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CancelDataRepositoryTaskResponseFromJson(json);
}

/// Provides a report detailing the data repository task results of the files
/// processed that match the criteria specified in the report <code>Scope</code>
/// parameter. FSx delivers the report to the file system's linked data
/// repository in Amazon S3, using the path specified in the report
/// <code>Path</code> parameter. You can specify whether or not a report gets
/// generated for a task using the <code>Enabled</code> parameter.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CompletionReport {
  /// Set <code>Enabled</code> to <code>True</code> to generate a
  /// <code>CompletionReport</code> when the task completes. If set to
  /// <code>true</code>, then you need to provide a report <code>Scope</code>,
  /// <code>Path</code>, and <code>Format</code>. Set <code>Enabled</code> to
  /// <code>False</code> if you do not want a <code>CompletionReport</code>
  /// generated when the task completes.
  @_s.JsonKey(name: 'Enabled')
  final bool enabled;

  /// Required if <code>Enabled</code> is set to <code>true</code>. Specifies the
  /// format of the <code>CompletionReport</code>.
  /// <code>REPORT_CSV_20191124</code> is the only format currently supported.
  /// When <code>Format</code> is set to <code>REPORT_CSV_20191124</code>, the
  /// <code>CompletionReport</code> is provided in CSV format, and is delivered to
  /// <code>{path}/task-{id}/failures.csv</code>.
  @_s.JsonKey(name: 'Format')
  final ReportFormat format;

  /// Required if <code>Enabled</code> is set to <code>true</code>. Specifies the
  /// location of the report on the file system's linked S3 data repository. An
  /// absolute path that defines where the completion report will be stored in the
  /// destination location. The <code>Path</code> you provide must be located
  /// within the file system’s ExportPath. An example <code>Path</code> value is
  /// "s3://myBucket/myExportPath/optionalPrefix". The report provides the
  /// following information for each file in the report: FilePath, FileStatus, and
  /// ErrorCode. To learn more about a file system's <code>ExportPath</code>, see
  /// .
  @_s.JsonKey(name: 'Path')
  final String path;

  /// Required if <code>Enabled</code> is set to <code>true</code>. Specifies the
  /// scope of the <code>CompletionReport</code>; <code>FAILED_FILES_ONLY</code>
  /// is the only scope currently supported. When <code>Scope</code> is set to
  /// <code>FAILED_FILES_ONLY</code>, the <code>CompletionReport</code> only
  /// contains information about files that the data repository task failed to
  /// process.
  @_s.JsonKey(name: 'Scope')
  final ReportScope scope;

  CompletionReport({
    @_s.required this.enabled,
    this.format,
    this.path,
    this.scope,
  });
  factory CompletionReport.fromJson(Map<String, dynamic> json) =>
      _$CompletionReportFromJson(json);

  Map<String, dynamic> toJson() => _$CompletionReportToJson(this);
}

/// The response object for the <code>CreateBackup</code> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateBackupResponse {
  /// A description of the backup.
  @_s.JsonKey(name: 'Backup')
  final Backup backup;

  CreateBackupResponse({
    this.backup,
  });
  factory CreateBackupResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateBackupResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateDataRepositoryTaskResponse {
  /// The description of the data repository task that you just created.
  @_s.JsonKey(name: 'DataRepositoryTask')
  final DataRepositoryTask dataRepositoryTask;

  CreateDataRepositoryTaskResponse({
    this.dataRepositoryTask,
  });
  factory CreateDataRepositoryTaskResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CreateDataRepositoryTaskResponseFromJson(json);
}

/// The response object for the <code>CreateFileSystemFromBackup</code>
/// operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateFileSystemFromBackupResponse {
  /// A description of the file system.
  @_s.JsonKey(name: 'FileSystem')
  final FileSystem fileSystem;

  CreateFileSystemFromBackupResponse({
    this.fileSystem,
  });
  factory CreateFileSystemFromBackupResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CreateFileSystemFromBackupResponseFromJson(json);
}

/// The Lustre configuration for the file system being created.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CreateFileSystemLustreConfiguration {
  /// (Optional) Choose <code>SCRATCH_1</code> and <code>SCRATCH_2</code>
  /// deployment types when you need temporary storage and shorter-term processing
  /// of data. The <code>SCRATCH_2</code> deployment type provides in-transit
  /// encryption of data and higher burst throughput capacity than
  /// <code>SCRATCH_1</code>.
  ///
  /// Choose <code>PERSISTENT_1</code> deployment type for longer-term storage and
  /// workloads and encryption of data in transit. To learn more about deployment
  /// types, see <a
  /// href="https://docs.aws.amazon.com/fsx/latest/LustreGuide/lustre-deployment-types.html">
  /// FSx for Lustre Deployment Options</a>.
  ///
  /// Encryption of data in-transit is automatically enabled when you access a
  /// <code>SCRATCH_2</code> or <code>PERSISTENT_1</code> file system from Amazon
  /// EC2 instances that <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/data-
  /// protection.html">support this feature</a>. (Default =
  /// <code>SCRATCH_1</code>)
  ///
  /// Encryption of data in-transit for <code>SCRATCH_2</code> and
  /// <code>PERSISTENT_1</code> deployment types is supported when accessed from
  /// supported instance types in supported AWS Regions. To learn more, <a
  /// href="https://docs.aws.amazon.com/fsx/latest/LustreGuide/encryption-in-transit-fsxl.html">Encrypting
  /// Data in Transit</a>.
  @_s.JsonKey(name: 'DeploymentType')
  final LustreDeploymentType deploymentType;

  /// (Optional) The path in Amazon S3 where the root of your Amazon FSx file
  /// system is exported. The path must use the same Amazon S3 bucket as specified
  /// in ImportPath. You can provide an optional prefix to which new and changed
  /// data is to be exported from your Amazon FSx for Lustre file system. If an
  /// <code>ExportPath</code> value is not provided, Amazon FSx sets a default
  /// export path, <code>s3://import-bucket/FSxLustre[creation-timestamp]</code>.
  /// The timestamp is in UTC format, for example
  /// <code>s3://import-bucket/FSxLustre20181105T222312Z</code>.
  ///
  /// The Amazon S3 export bucket must be the same as the import bucket specified
  /// by <code>ImportPath</code>. If you only specify a bucket name, such as
  /// <code>s3://import-bucket</code>, you get a 1:1 mapping of file system
  /// objects to S3 bucket objects. This mapping means that the input data in S3
  /// is overwritten on export. If you provide a custom prefix in the export path,
  /// such as <code>s3://import-bucket/[custom-optional-prefix]</code>, Amazon FSx
  /// exports the contents of your file system to that export prefix in the Amazon
  /// S3 bucket.
  @_s.JsonKey(name: 'ExportPath')
  final String exportPath;

  /// (Optional) The path to the Amazon S3 bucket (including the optional prefix)
  /// that you're using as the data repository for your Amazon FSx for Lustre file
  /// system. The root of your FSx for Lustre file system will be mapped to the
  /// root of the Amazon S3 bucket you select. An example is
  /// <code>s3://import-bucket/optional-prefix</code>. If you specify a prefix
  /// after the Amazon S3 bucket name, only object keys with that prefix are
  /// loaded into the file system.
  @_s.JsonKey(name: 'ImportPath')
  final String importPath;

  /// (Optional) For files imported from a data repository, this value determines
  /// the stripe count and maximum amount of data per file (in MiB) stored on a
  /// single physical disk. The maximum number of disks that a single file can be
  /// striped across is limited by the total number of disks that make up the file
  /// system.
  ///
  /// The default chunk size is 1,024 MiB (1 GiB) and can go as high as 512,000
  /// MiB (500 GiB). Amazon S3 objects have a maximum size of 5 TB.
  @_s.JsonKey(name: 'ImportedFileChunkSize')
  final int importedFileChunkSize;

  /// Required for the <code>PERSISTENT_1</code> deployment type, describes the
  /// amount of read and write throughput for each 1 tebibyte of storage, in
  /// MB/s/TiB. File system throughput capacity is calculated by multiplying ﬁle
  /// system storage capacity (TiB) by the PerUnitStorageThroughput (MB/s/TiB).
  /// For a 2.4 TiB ﬁle system, provisioning 50 MB/s/TiB of
  /// PerUnitStorageThroughput yields 117 MB/s of ﬁle system throughput. You pay
  /// for the amount of throughput that you provision.
  ///
  /// Valid values are 50, 100, 200.
  @_s.JsonKey(name: 'PerUnitStorageThroughput')
  final int perUnitStorageThroughput;

  /// The preferred time to perform weekly maintenance, in the UTC time zone.
  @_s.JsonKey(name: 'WeeklyMaintenanceStartTime')
  final String weeklyMaintenanceStartTime;

  CreateFileSystemLustreConfiguration({
    this.deploymentType,
    this.exportPath,
    this.importPath,
    this.importedFileChunkSize,
    this.perUnitStorageThroughput,
    this.weeklyMaintenanceStartTime,
  });
  Map<String, dynamic> toJson() =>
      _$CreateFileSystemLustreConfigurationToJson(this);
}

/// The response object returned after the file system is created.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateFileSystemResponse {
  /// The configuration of the file system that was created.
  @_s.JsonKey(name: 'FileSystem')
  final FileSystem fileSystem;

  CreateFileSystemResponse({
    this.fileSystem,
  });
  factory CreateFileSystemResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateFileSystemResponseFromJson(json);
}

/// The configuration object for the Microsoft Windows file system used in
/// <code>CreateFileSystem</code> and <code>CreateFileSystemFromBackup</code>
/// operations.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CreateFileSystemWindowsConfiguration {
  /// The throughput of an Amazon FSx file system, measured in megabytes per
  /// second, in 2 to the <i>n</i>th increments, between 2^3 (8) and 2^11 (2048).
  @_s.JsonKey(name: 'ThroughputCapacity')
  final int throughputCapacity;

  /// The ID for an existing AWS Managed Microsoft Active Directory (AD) instance
  /// that the file system should join when it's created.
  @_s.JsonKey(name: 'ActiveDirectoryId')
  final String activeDirectoryId;

  /// The number of days to retain automatic backups. The default is to retain
  /// backups for 7 days. Setting this value to 0 disables the creation of
  /// automatic backups. The maximum retention period for backups is 35 days.
  @_s.JsonKey(name: 'AutomaticBackupRetentionDays')
  final int automaticBackupRetentionDays;

  /// A boolean flag indicating whether tags for the file system should be copied
  /// to backups. This value defaults to false. If it's set to true, all tags for
  /// the file system are copied to all automatic and user-initiated backups where
  /// the user doesn't specify tags. If this value is true, and you specify one or
  /// more tags, only the specified tags are copied to backups. If you specify one
  /// or more tags when creating a user-initiated backup, no tags are copied from
  /// the file system, regardless of this value.
  @_s.JsonKey(name: 'CopyTagsToBackups')
  final bool copyTagsToBackups;

  /// The preferred time to take daily automatic backups, formatted HH:MM in the
  /// UTC time zone.
  @_s.JsonKey(name: 'DailyAutomaticBackupStartTime')
  final String dailyAutomaticBackupStartTime;

  /// Specifies the file system deployment type, valid values are the following:
  ///
  /// <ul>
  /// <li>
  /// <code>MULTI_AZ_1</code> - Deploys a high availability file system that is
  /// configured for Multi-AZ redundancy to tolerate temporary Availability Zone
  /// (AZ) unavailability. You can only deploy a Multi-AZ file system in AWS
  /// Regions that have a minimum of three Availability Zones. Also supports HDD
  /// storage type
  /// </li>
  /// <li>
  /// <code>SINGLE_AZ_1</code> - (Default) Choose to deploy a file system that is
  /// configured for single AZ redundancy.
  /// </li>
  /// <li>
  /// <code>SINGLE_AZ_2</code> - The latest generation Single AZ file system.
  /// Specifies a file system that is configured for single AZ redundancy and
  /// supports HDD storage type.
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/fsx/latest/WindowsGuide/high-availability-multiAZ.html">
  /// Availability and Durability: Single-AZ and Multi-AZ File Systems</a>.
  @_s.JsonKey(name: 'DeploymentType')
  final WindowsDeploymentType deploymentType;

  /// Required when <code>DeploymentType</code> is set to <code>MULTI_AZ_1</code>.
  /// This specifies the subnet in which you want the preferred file server to be
  /// located. For in-AWS applications, we recommend that you launch your clients
  /// in the same Availability Zone (AZ) as your preferred file server to reduce
  /// cross-AZ data transfer costs and minimize latency.
  @_s.JsonKey(name: 'PreferredSubnetId')
  final String preferredSubnetId;
  @_s.JsonKey(name: 'SelfManagedActiveDirectoryConfiguration')
  final SelfManagedActiveDirectoryConfiguration
      selfManagedActiveDirectoryConfiguration;

  /// The preferred start time to perform weekly maintenance, formatted d:HH:MM in
  /// the UTC time zone.
  @_s.JsonKey(name: 'WeeklyMaintenanceStartTime')
  final String weeklyMaintenanceStartTime;

  CreateFileSystemWindowsConfiguration({
    @_s.required this.throughputCapacity,
    this.activeDirectoryId,
    this.automaticBackupRetentionDays,
    this.copyTagsToBackups,
    this.dailyAutomaticBackupStartTime,
    this.deploymentType,
    this.preferredSubnetId,
    this.selfManagedActiveDirectoryConfiguration,
    this.weeklyMaintenanceStartTime,
  });
  Map<String, dynamic> toJson() =>
      _$CreateFileSystemWindowsConfigurationToJson(this);
}

/// The data repository configuration object for Lustre file systems returned in
/// the response of the <code>CreateFileSystem</code> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DataRepositoryConfiguration {
  /// The export path to the Amazon S3 bucket (and prefix) that you are using to
  /// store new and changed Lustre file system files in S3.
  @_s.JsonKey(name: 'ExportPath')
  final String exportPath;

  /// The import path to the Amazon S3 bucket (and optional prefix) that you're
  /// using as the data repository for your FSx for Lustre file system, for
  /// example <code>s3://import-bucket/optional-prefix</code>. If a prefix is
  /// specified after the Amazon S3 bucket name, only object keys with that prefix
  /// are loaded into the file system.
  @_s.JsonKey(name: 'ImportPath')
  final String importPath;

  /// For files imported from a data repository, this value determines the stripe
  /// count and maximum amount of data per file (in MiB) stored on a single
  /// physical disk. The maximum number of disks that a single file can be striped
  /// across is limited by the total number of disks that make up the file system.
  ///
  /// The default chunk size is 1,024 MiB (1 GiB) and can go as high as 512,000
  /// MiB (500 GiB). Amazon S3 objects have a maximum size of 5 TB.
  @_s.JsonKey(name: 'ImportedFileChunkSize')
  final int importedFileChunkSize;

  DataRepositoryConfiguration({
    this.exportPath,
    this.importPath,
    this.importedFileChunkSize,
  });
  factory DataRepositoryConfiguration.fromJson(Map<String, dynamic> json) =>
      _$DataRepositoryConfigurationFromJson(json);
}

/// A description of the data repository task. You use data repository tasks to
/// perform bulk transfer operations between your Amazon FSx file system and its
/// linked data repository.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DataRepositoryTask {
  @_s.JsonKey(name: 'CreationTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime creationTime;
  @_s.JsonKey(name: 'FileSystemId')
  final String fileSystemId;

  /// The lifecycle status of the data repository task, as follows:
  ///
  /// <ul>
  /// <li>
  /// <code>PENDING</code> - Amazon FSx has not started the task.
  /// </li>
  /// <li>
  /// <code>EXECUTING</code> - Amazon FSx is processing the task.
  /// </li>
  /// <li>
  /// <code>FAILED</code> - Amazon FSx was not able to complete the task. For
  /// example, there may be files the task failed to process. The
  /// <a>DataRepositoryTaskFailureDetails</a> property provides more information
  /// about task failures.
  /// </li>
  /// <li>
  /// <code>SUCCEEDED</code> - FSx completed the task successfully.
  /// </li>
  /// <li>
  /// <code>CANCELED</code> - Amazon FSx canceled the task and it did not
  /// complete.
  /// </li>
  /// <li>
  /// <code>CANCELING</code> - FSx is in process of canceling the task.
  /// </li>
  /// </ul> <note>
  /// You cannot delete an FSx for Lustre file system if there are data repository
  /// tasks for the file system in the <code>PENDING</code> or
  /// <code>EXECUTING</code> states. Please retry when the data repository task is
  /// finished (with a status of <code>CANCELED</code>, <code>SUCCEEDED</code>, or
  /// <code>FAILED</code>). You can use the DescribeDataRepositoryTask action to
  /// monitor the task status. Contact the FSx team if you need to delete your
  /// file system immediately.
  /// </note>
  @_s.JsonKey(name: 'Lifecycle')
  final DataRepositoryTaskLifecycle lifecycle;

  /// The system-generated, unique 17-digit ID of the data repository task.
  @_s.JsonKey(name: 'TaskId')
  final String taskId;

  /// The type of data repository task; EXPORT_TO_REPOSITORY is the only type
  /// currently supported.
  @_s.JsonKey(name: 'Type')
  final DataRepositoryTaskType type;

  /// The time that Amazon FSx completed processing the task, populated after the
  /// task is complete.
  @_s.JsonKey(name: 'EndTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime endTime;

  /// Failure message describing why the task failed, it is populated only when
  /// <code>Lifecycle</code> is set to <code>FAILED</code>.
  @_s.JsonKey(name: 'FailureDetails')
  final DataRepositoryTaskFailureDetails failureDetails;

  /// An array of paths on the Amazon FSx for Lustre file system that specify the
  /// data for the data repository task to process. For example, in an
  /// EXPORT_TO_REPOSITORY task, the paths specify which data to export to the
  /// linked data repository.
  ///
  /// (Default) If <code>Paths</code> is not specified, Amazon FSx uses the file
  /// system root directory.
  @_s.JsonKey(name: 'Paths')
  final List<String> paths;
  @_s.JsonKey(name: 'Report')
  final CompletionReport report;
  @_s.JsonKey(name: 'ResourceARN')
  final String resourceARN;

  /// The time that Amazon FSx began processing the task.
  @_s.JsonKey(name: 'StartTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime startTime;

  /// Provides the status of the number of files that the task has processed
  /// successfully and failed to process.
  @_s.JsonKey(name: 'Status')
  final DataRepositoryTaskStatus status;
  @_s.JsonKey(name: 'Tags')
  final List<Tag> tags;

  DataRepositoryTask({
    @_s.required this.creationTime,
    @_s.required this.fileSystemId,
    @_s.required this.lifecycle,
    @_s.required this.taskId,
    @_s.required this.type,
    this.endTime,
    this.failureDetails,
    this.paths,
    this.report,
    this.resourceARN,
    this.startTime,
    this.status,
    this.tags,
  });
  factory DataRepositoryTask.fromJson(Map<String, dynamic> json) =>
      _$DataRepositoryTaskFromJson(json);
}

/// Provides information about why a data repository task failed. Only populated
/// when the task <code>Lifecycle</code> is set to <code>FAILED</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DataRepositoryTaskFailureDetails {
  @_s.JsonKey(name: 'Message')
  final String message;

  DataRepositoryTaskFailureDetails({
    this.message,
  });
  factory DataRepositoryTaskFailureDetails.fromJson(
          Map<String, dynamic> json) =>
      _$DataRepositoryTaskFailureDetailsFromJson(json);
}

/// (Optional) An array of filter objects you can use to filter the response of
/// data repository tasks you will see in the the response. You can filter the
/// tasks returned in the response by one or more file system IDs, task
/// lifecycles, and by task type. A filter object consists of a filter
/// <code>Name</code>, and one or more <code>Values</code> for the filter.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DataRepositoryTaskFilter {
  /// Name of the task property to use in filtering the tasks returned in the
  /// response.
  ///
  /// <ul>
  /// <li>
  /// Use <code>file-system-id</code> to retrieve data repository tasks for
  /// specific file systems.
  /// </li>
  /// <li>
  /// Use <code>task-lifecycle</code> to retrieve data repository tasks with one
  /// or more specific lifecycle states, as follows: CANCELED, EXECUTING, FAILED,
  /// PENDING, and SUCCEEDED.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Name')
  final DataRepositoryTaskFilterName name;

  /// Use Values to include the specific file system IDs and task lifecycle states
  /// for the filters you are using.
  @_s.JsonKey(name: 'Values')
  final List<String> values;

  DataRepositoryTaskFilter({
    this.name,
    this.values,
  });
  Map<String, dynamic> toJson() => _$DataRepositoryTaskFilterToJson(this);
}

enum DataRepositoryTaskFilterName {
  @_s.JsonValue('file-system-id')
  fileSystemId,
  @_s.JsonValue('task-lifecycle')
  taskLifecycle,
}

enum DataRepositoryTaskLifecycle {
  @_s.JsonValue('PENDING')
  pending,
  @_s.JsonValue('EXECUTING')
  executing,
  @_s.JsonValue('FAILED')
  failed,
  @_s.JsonValue('SUCCEEDED')
  succeeded,
  @_s.JsonValue('CANCELED')
  canceled,
  @_s.JsonValue('CANCELING')
  canceling,
}

/// Provides the task status showing a running total of the total number of
/// files to be processed, the number successfully processed, and the number of
/// files the task failed to process.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DataRepositoryTaskStatus {
  /// A running total of the number of files that the task failed to process.
  @_s.JsonKey(name: 'FailedCount')
  final int failedCount;

  /// The time at which the task status was last updated.
  @_s.JsonKey(
      name: 'LastUpdatedTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime lastUpdatedTime;

  /// A running total of the number of files that the task has successfully
  /// processed.
  @_s.JsonKey(name: 'SucceededCount')
  final int succeededCount;

  /// The total number of files that the task will process. While a task is
  /// executing, the sum of <code>SucceededCount</code> plus
  /// <code>FailedCount</code> may not equal <code>TotalCount</code>. When the
  /// task is complete, <code>TotalCount</code> equals the sum of
  /// <code>SucceededCount</code> plus <code>FailedCount</code>.
  @_s.JsonKey(name: 'TotalCount')
  final int totalCount;

  DataRepositoryTaskStatus({
    this.failedCount,
    this.lastUpdatedTime,
    this.succeededCount,
    this.totalCount,
  });
  factory DataRepositoryTaskStatus.fromJson(Map<String, dynamic> json) =>
      _$DataRepositoryTaskStatusFromJson(json);
}

enum DataRepositoryTaskType {
  @_s.JsonValue('EXPORT_TO_REPOSITORY')
  exportToRepository,
}

/// The response object for <code>DeleteBackup</code> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteBackupResponse {
  /// The ID of the backup deleted.
  @_s.JsonKey(name: 'BackupId')
  final String backupId;

  /// The lifecycle of the backup. Should be <code>DELETED</code>.
  @_s.JsonKey(name: 'Lifecycle')
  final BackupLifecycle lifecycle;

  DeleteBackupResponse({
    this.backupId,
    this.lifecycle,
  });
  factory DeleteBackupResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteBackupResponseFromJson(json);
}

/// The response object for the <code>DeleteFileSystem</code> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteFileSystemResponse {
  /// The ID of the file system being deleted.
  @_s.JsonKey(name: 'FileSystemId')
  final String fileSystemId;

  /// The file system lifecycle for the deletion request. Should be
  /// <code>DELETING</code>.
  @_s.JsonKey(name: 'Lifecycle')
  final FileSystemLifecycle lifecycle;
  @_s.JsonKey(name: 'WindowsResponse')
  final DeleteFileSystemWindowsResponse windowsResponse;

  DeleteFileSystemResponse({
    this.fileSystemId,
    this.lifecycle,
    this.windowsResponse,
  });
  factory DeleteFileSystemResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteFileSystemResponseFromJson(json);
}

/// The configuration object for the Microsoft Windows file system used in the
/// <code>DeleteFileSystem</code> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DeleteFileSystemWindowsConfiguration {
  /// A set of tags for your final backup.
  @_s.JsonKey(name: 'FinalBackupTags')
  final List<Tag> finalBackupTags;

  /// By default, Amazon FSx for Windows takes a final backup on your behalf when
  /// the <code>DeleteFileSystem</code> operation is invoked. Doing this helps
  /// protect you from data loss, and we highly recommend taking the final backup.
  /// If you want to skip this backup, use this flag to do so.
  @_s.JsonKey(name: 'SkipFinalBackup')
  final bool skipFinalBackup;

  DeleteFileSystemWindowsConfiguration({
    this.finalBackupTags,
    this.skipFinalBackup,
  });
  Map<String, dynamic> toJson() =>
      _$DeleteFileSystemWindowsConfigurationToJson(this);
}

/// The response object for the Microsoft Windows file system used in the
/// <code>DeleteFileSystem</code> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteFileSystemWindowsResponse {
  /// The ID of the final backup for this file system.
  @_s.JsonKey(name: 'FinalBackupId')
  final String finalBackupId;

  /// The set of tags applied to the final backup.
  @_s.JsonKey(name: 'FinalBackupTags')
  final List<Tag> finalBackupTags;

  DeleteFileSystemWindowsResponse({
    this.finalBackupId,
    this.finalBackupTags,
  });
  factory DeleteFileSystemWindowsResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteFileSystemWindowsResponseFromJson(json);
}

/// Response object for <code>DescribeBackups</code> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeBackupsResponse {
  /// Any array of backups.
  @_s.JsonKey(name: 'Backups')
  final List<Backup> backups;

  /// This is present if there are more backups than returned in the response
  /// (String). You can use the <code>NextToken</code> value in the later request
  /// to fetch the backups.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  DescribeBackupsResponse({
    this.backups,
    this.nextToken,
  });
  factory DescribeBackupsResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeBackupsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeDataRepositoryTasksResponse {
  /// The collection of data repository task descriptions returned.
  @_s.JsonKey(name: 'DataRepositoryTasks')
  final List<DataRepositoryTask> dataRepositoryTasks;
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  DescribeDataRepositoryTasksResponse({
    this.dataRepositoryTasks,
    this.nextToken,
  });
  factory DescribeDataRepositoryTasksResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeDataRepositoryTasksResponseFromJson(json);
}

/// The response object for <code>DescribeFileSystems</code> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeFileSystemsResponse {
  /// An array of file system descriptions.
  @_s.JsonKey(name: 'FileSystems')
  final List<FileSystem> fileSystems;

  /// Present if there are more file systems than returned in the response
  /// (String). You can use the <code>NextToken</code> value in the later request
  /// to fetch the descriptions.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  DescribeFileSystemsResponse({
    this.fileSystems,
    this.nextToken,
  });
  factory DescribeFileSystemsResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeFileSystemsResponseFromJson(json);
}

/// A description of a specific Amazon FSx file system.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class FileSystem {
  /// The time that the file system was created, in seconds (since
  /// 1970-01-01T00:00:00Z), also known as Unix time.
  @_s.JsonKey(name: 'CreationTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime creationTime;

  /// The DNS name for the file system.
  @_s.JsonKey(name: 'DNSName')
  final String dNSName;
  @_s.JsonKey(name: 'FailureDetails')
  final FileSystemFailureDetails failureDetails;

  /// The system-generated, unique 17-digit ID of the file system.
  @_s.JsonKey(name: 'FileSystemId')
  final String fileSystemId;

  /// The type of Amazon FSx file system, either <code>LUSTRE</code> or
  /// <code>WINDOWS</code>.
  @_s.JsonKey(name: 'FileSystemType')
  final FileSystemType fileSystemType;

  /// The ID of the AWS Key Management Service (AWS KMS) key used to encrypt the
  /// file system's data for Amazon FSx for Windows File Server file systems and
  /// persistent Amazon FSx for Lustre file systems at rest. In either case, if
  /// not specified, the Amazon FSx managed key is used. The scratch Amazon FSx
  /// for Lustre file systems are always encrypted at rest using Amazon FSx
  /// managed keys. For more information, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/APIReference/API_Encrypt.html">Encrypt</a>
  /// in the <i>AWS Key Management Service API Reference</i>.
  @_s.JsonKey(name: 'KmsKeyId')
  final String kmsKeyId;

  /// The lifecycle status of the file system, following are the possible values
  /// and what they mean:
  ///
  /// <ul>
  /// <li>
  /// <code>AVAILABLE</code> - The file system is in a healthy state, and is
  /// reachable and available for use.
  /// </li>
  /// <li>
  /// <code>CREATING</code> - Amazon FSx is creating the new file system.
  /// </li>
  /// <li>
  /// <code>DELETING</code> - Amazon FSx is deleting an existing file system.
  /// </li>
  /// <li>
  /// <code>FAILED</code> - An existing file system has experienced an
  /// unrecoverable failure. When creating a new file system, Amazon FSx was
  /// unable to create the file system.
  /// </li>
  /// <li>
  /// <code>MISCONFIGURED</code> indicates that the file system is in a failed but
  /// recoverable state.
  /// </li>
  /// <li>
  /// <code>UPDATING</code> indicates that the file system is undergoing a
  /// customer initiated update.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Lifecycle')
  final FileSystemLifecycle lifecycle;
  @_s.JsonKey(name: 'LustreConfiguration')
  final LustreFileSystemConfiguration lustreConfiguration;

  /// The IDs of the elastic network interface from which a specific file system
  /// is accessible. The elastic network interface is automatically created in the
  /// same VPC that the Amazon FSx file system was created in. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-eni.html">Elastic
  /// Network Interfaces</a> in the <i>Amazon EC2 User Guide.</i>
  ///
  /// For an Amazon FSx for Windows File Server file system, you can have one
  /// network interface ID. For an Amazon FSx for Lustre file system, you can have
  /// more than one.
  @_s.JsonKey(name: 'NetworkInterfaceIds')
  final List<String> networkInterfaceIds;

  /// The AWS account that created the file system. If the file system was created
  /// by an AWS Identity and Access Management (IAM) user, the AWS account to
  /// which the IAM user belongs is the owner.
  @_s.JsonKey(name: 'OwnerId')
  final String ownerId;

  /// The Amazon Resource Name (ARN) for the file system resource.
  @_s.JsonKey(name: 'ResourceARN')
  final String resourceARN;

  /// The storage capacity of the file system in gigabytes (GB).
  @_s.JsonKey(name: 'StorageCapacity')
  final int storageCapacity;

  /// The storage type of the file system. Valid values are <code>SSD</code> and
  /// <code>HDD</code>. If set to <code>SSD</code>, the file system uses solid
  /// state drive storage. If set to <code>HDD</code>, the file system uses hard
  /// disk drive storage.
  @_s.JsonKey(name: 'StorageType')
  final StorageType storageType;

  /// Specifies the IDs of the subnets that the file system is accessible from.
  /// For Windows <code>MULTI_AZ_1</code> file system deployment type, there are
  /// two subnet IDs, one for the preferred file server and one for the standby
  /// file server. The preferred file server subnet identified in the
  /// <code>PreferredSubnetID</code> property. All other file systems have only
  /// one subnet ID.
  ///
  /// For Lustre file systems, and Single-AZ Windows file systems, this is the ID
  /// of the subnet that contains the endpoint for the file system. For
  /// <code>MULTI_AZ_1</code> Windows file systems, the endpoint for the file
  /// system is available in the <code>PreferredSubnetID</code>.
  @_s.JsonKey(name: 'SubnetIds')
  final List<String> subnetIds;

  /// The tags to associate with the file system. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Using_Tags.html">Tagging
  /// Your Amazon EC2 Resources</a> in the <i>Amazon EC2 User Guide</i>.
  @_s.JsonKey(name: 'Tags')
  final List<Tag> tags;

  /// The ID of the primary VPC for the file system.
  @_s.JsonKey(name: 'VpcId')
  final String vpcId;

  /// The configuration for this Microsoft Windows file system.
  @_s.JsonKey(name: 'WindowsConfiguration')
  final WindowsFileSystemConfiguration windowsConfiguration;

  FileSystem({
    this.creationTime,
    this.dNSName,
    this.failureDetails,
    this.fileSystemId,
    this.fileSystemType,
    this.kmsKeyId,
    this.lifecycle,
    this.lustreConfiguration,
    this.networkInterfaceIds,
    this.ownerId,
    this.resourceARN,
    this.storageCapacity,
    this.storageType,
    this.subnetIds,
    this.tags,
    this.vpcId,
    this.windowsConfiguration,
  });
  factory FileSystem.fromJson(Map<String, dynamic> json) =>
      _$FileSystemFromJson(json);
}

/// A structure providing details of any failures that occur when creating the
/// file system has failed.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class FileSystemFailureDetails {
  /// A message describing any failures that occurred during file system creation.
  @_s.JsonKey(name: 'Message')
  final String message;

  FileSystemFailureDetails({
    this.message,
  });
  factory FileSystemFailureDetails.fromJson(Map<String, dynamic> json) =>
      _$FileSystemFailureDetailsFromJson(json);
}

/// The lifecycle status of the file system.
enum FileSystemLifecycle {
  @_s.JsonValue('AVAILABLE')
  available,
  @_s.JsonValue('CREATING')
  creating,
  @_s.JsonValue('FAILED')
  failed,
  @_s.JsonValue('DELETING')
  deleting,
  @_s.JsonValue('MISCONFIGURED')
  misconfigured,
  @_s.JsonValue('UPDATING')
  updating,
}

/// An enumeration specifying the currently ongoing maintenance operation.
enum FileSystemMaintenanceOperation {
  @_s.JsonValue('PATCHING')
  patching,
  @_s.JsonValue('BACKING_UP')
  backingUp,
}

/// The type of file system.
enum FileSystemType {
  @_s.JsonValue('WINDOWS')
  windows,
  @_s.JsonValue('LUSTRE')
  lustre,
}

/// A filter used to restrict the results of describe calls. You can use
/// multiple filters to return results that meet all applied filter
/// requirements.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class Filter {
  /// The name for this filter.
  @_s.JsonKey(name: 'Name')
  final FilterName name;

  /// The values of the filter. These are all the values for any of the applied
  /// filters.
  @_s.JsonKey(name: 'Values')
  final List<String> values;

  Filter({
    this.name,
    this.values,
  });
  Map<String, dynamic> toJson() => _$FilterToJson(this);
}

/// The name for a filter.
enum FilterName {
  @_s.JsonValue('file-system-id')
  fileSystemId,
  @_s.JsonValue('backup-type')
  backupType,
}

/// The response object for <code>ListTagsForResource</code> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsForResourceResponse {
  /// This is present if there are more tags than returned in the response
  /// (String). You can use the <code>NextToken</code> value in the later request
  /// to fetch the tags.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// A list of tags on the resource.
  @_s.JsonKey(name: 'Tags')
  final List<Tag> tags;

  ListTagsForResourceResponse({
    this.nextToken,
    this.tags,
  });
  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTagsForResourceResponseFromJson(json);
}

enum LustreDeploymentType {
  @_s.JsonValue('SCRATCH_1')
  scratch_1,
  @_s.JsonValue('SCRATCH_2')
  scratch_2,
  @_s.JsonValue('PERSISTENT_1')
  persistent_1,
}

/// The configuration for the Amazon FSx for Lustre file system.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class LustreFileSystemConfiguration {
  @_s.JsonKey(name: 'DataRepositoryConfiguration')
  final DataRepositoryConfiguration dataRepositoryConfiguration;

  /// The deployment type of the FSX for Lustre file system.
  @_s.JsonKey(name: 'DeploymentType')
  final LustreDeploymentType deploymentType;

  /// You use the <code>MountName</code> value when mounting the file system.
  ///
  /// For the <code>SCRATCH_1</code> deployment type, this value is always
  /// "<code>fsx</code>". For <code>SCRATCH_2</code> and <code>PERSISTENT_1</code>
  /// deployment types, this value is a string that is unique within an AWS
  /// Region.
  @_s.JsonKey(name: 'MountName')
  final String mountName;

  /// Per unit storage throughput represents the megabytes per second of read or
  /// write throughput per 1 tebibyte of storage provisioned. File system
  /// throughput capacity is equal to Storage capacity (TiB) *
  /// PerUnitStorageThroughput (MB/s/TiB). This option is only valid for
  /// <code>PERSISTENT_1</code> deployment types. Valid values are 50, 100, 200.
  @_s.JsonKey(name: 'PerUnitStorageThroughput')
  final int perUnitStorageThroughput;

  /// The UTC time that you want to begin your weekly maintenance window.
  @_s.JsonKey(name: 'WeeklyMaintenanceStartTime')
  final String weeklyMaintenanceStartTime;

  LustreFileSystemConfiguration({
    this.dataRepositoryConfiguration,
    this.deploymentType,
    this.mountName,
    this.perUnitStorageThroughput,
    this.weeklyMaintenanceStartTime,
  });
  factory LustreFileSystemConfiguration.fromJson(Map<String, dynamic> json) =>
      _$LustreFileSystemConfigurationFromJson(json);
}

enum ReportFormat {
  @_s.JsonValue('REPORT_CSV_20191124')
  reportCsv_20191124,
}

enum ReportScope {
  @_s.JsonValue('FAILED_FILES_ONLY')
  failedFilesOnly,
}

/// The configuration of the self-managed Microsoft Active Directory (AD)
/// directory to which the Windows File Server instance is joined.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SelfManagedActiveDirectoryAttributes {
  /// A list of up to two IP addresses of DNS servers or domain controllers in the
  /// self-managed AD directory.
  @_s.JsonKey(name: 'DnsIps')
  final List<String> dnsIps;

  /// The fully qualified domain name of the self-managed AD directory.
  @_s.JsonKey(name: 'DomainName')
  final String domainName;

  /// The name of the domain group whose members have administrative privileges
  /// for the FSx file system.
  @_s.JsonKey(name: 'FileSystemAdministratorsGroup')
  final String fileSystemAdministratorsGroup;

  /// The fully qualified distinguished name of the organizational unit within the
  /// self-managed AD directory to which the Windows File Server instance is
  /// joined.
  @_s.JsonKey(name: 'OrganizationalUnitDistinguishedName')
  final String organizationalUnitDistinguishedName;

  /// The user name for the service account on your self-managed AD domain that
  /// FSx uses to join to your AD domain.
  @_s.JsonKey(name: 'UserName')
  final String userName;

  SelfManagedActiveDirectoryAttributes({
    this.dnsIps,
    this.domainName,
    this.fileSystemAdministratorsGroup,
    this.organizationalUnitDistinguishedName,
    this.userName,
  });
  factory SelfManagedActiveDirectoryAttributes.fromJson(
          Map<String, dynamic> json) =>
      _$SelfManagedActiveDirectoryAttributesFromJson(json);
}

/// The configuration that Amazon FSx uses to join the Windows File Server
/// instance to your self-managed (including on-premises) Microsoft Active
/// Directory (AD) directory.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class SelfManagedActiveDirectoryConfiguration {
  /// A list of up to two IP addresses of DNS servers or domain controllers in the
  /// self-managed AD directory. The IP addresses need to be either in the same
  /// VPC CIDR range as the one in which your Amazon FSx file system is being
  /// created, or in the private IP version 4 (IPv4) address ranges, as specified
  /// in <a href="http://www.faqs.org/rfcs/rfc1918.html">RFC 1918</a>:
  ///
  /// <ul>
  /// <li>
  /// 10.0.0.0 - 10.255.255.255 (10/8 prefix)
  /// </li>
  /// <li>
  /// 172.16.0.0 - 172.31.255.255 (172.16/12 prefix)
  /// </li>
  /// <li>
  /// 192.168.0.0 - 192.168.255.255 (192.168/16 prefix)
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'DnsIps')
  final List<String> dnsIps;

  /// The fully qualified domain name of the self-managed AD directory, such as
  /// <code>corp.example.com</code>.
  @_s.JsonKey(name: 'DomainName')
  final String domainName;

  /// The password for the service account on your self-managed AD domain that
  /// Amazon FSx will use to join to your AD domain.
  @_s.JsonKey(name: 'Password')
  final String password;

  /// The user name for the service account on your self-managed AD domain that
  /// Amazon FSx will use to join to your AD domain. This account must have the
  /// permission to join computers to the domain in the organizational unit
  /// provided in <code>OrganizationalUnitDistinguishedName</code>, or in the
  /// default location of your AD domain.
  @_s.JsonKey(name: 'UserName')
  final String userName;

  /// (Optional) The name of the domain group whose members are granted
  /// administrative privileges for the file system. Administrative privileges
  /// include taking ownership of files and folders, setting audit controls (audit
  /// ACLs) on files and folders, and administering the file system remotely by
  /// using the FSx Remote PowerShell. The group that you specify must already
  /// exist in your domain. If you don't provide one, your AD domain's Domain
  /// Admins group is used.
  @_s.JsonKey(name: 'FileSystemAdministratorsGroup')
  final String fileSystemAdministratorsGroup;

  /// (Optional) The fully qualified distinguished name of the organizational unit
  /// within your self-managed AD directory that the Windows File Server instance
  /// will join. Amazon FSx only accepts OU as the direct parent of the file
  /// system. An example is <code>OU=FSx,DC=yourdomain,DC=corp,DC=com</code>. To
  /// learn more, see <a href="https://tools.ietf.org/html/rfc2253">RFC 2253</a>.
  /// If none is provided, the FSx file system is created in the default location
  /// of your self-managed AD directory.
  /// <important>
  /// Only Organizational Unit (OU) objects can be the direct parent of the file
  /// system that you're creating.
  /// </important>
  @_s.JsonKey(name: 'OrganizationalUnitDistinguishedName')
  final String organizationalUnitDistinguishedName;

  SelfManagedActiveDirectoryConfiguration({
    @_s.required this.dnsIps,
    @_s.required this.domainName,
    @_s.required this.password,
    @_s.required this.userName,
    this.fileSystemAdministratorsGroup,
    this.organizationalUnitDistinguishedName,
  });
  Map<String, dynamic> toJson() =>
      _$SelfManagedActiveDirectoryConfigurationToJson(this);
}

/// The configuration that Amazon FSx uses to join the Windows File Server
/// instance to the self-managed Microsoft Active Directory (AD) directory.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class SelfManagedActiveDirectoryConfigurationUpdates {
  /// A list of up to two IP addresses of DNS servers or domain controllers in the
  /// self-managed AD directory.
  @_s.JsonKey(name: 'DnsIps')
  final List<String> dnsIps;

  /// The password for the service account on your self-managed AD domain that
  /// Amazon FSx will use to join to your AD domain.
  @_s.JsonKey(name: 'Password')
  final String password;

  /// The user name for the service account on your self-managed AD domain that
  /// Amazon FSx will use to join to your AD domain. This account must have the
  /// permission to join computers to the domain in the organizational unit
  /// provided in <code>OrganizationalUnitDistinguishedName</code>.
  @_s.JsonKey(name: 'UserName')
  final String userName;

  SelfManagedActiveDirectoryConfigurationUpdates({
    this.dnsIps,
    this.password,
    this.userName,
  });
  Map<String, dynamic> toJson() =>
      _$SelfManagedActiveDirectoryConfigurationUpdatesToJson(this);
}

/// The storage type for your Amazon FSx file system.
enum StorageType {
  @_s.JsonValue('SSD')
  ssd,
  @_s.JsonValue('HDD')
  hdd,
}

/// Specifies a key-value pair for a resource tag.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Tag {
  /// A value that specifies the <code>TagKey</code>, the name of the tag. Tag
  /// keys must be unique for the resource to which they are attached.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// A value that specifies the <code>TagValue</code>, the value assigned to the
  /// corresponding tag key. Tag values can be null and don't have to be unique in
  /// a tag set. For example, you can have a key-value pair in a tag set of
  /// <code>finances : April</code> and also of <code>payroll : April</code>.
  @_s.JsonKey(name: 'Value')
  final String value;

  Tag({
    this.key,
    this.value,
  });
  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);

  Map<String, dynamic> toJson() => _$TagToJson(this);
}

/// The response object for the <code>TagResource</code> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TagResourceResponse {
  TagResourceResponse();
  factory TagResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$TagResourceResponseFromJson(json);
}

/// The response object for <code>UntagResource</code> action.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UntagResourceResponse {
  UntagResourceResponse();
  factory UntagResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$UntagResourceResponseFromJson(json);
}

/// The configuration object for Amazon FSx for Lustre file systems used in the
/// <code>UpdateFileSystem</code> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class UpdateFileSystemLustreConfiguration {
  /// The preferred time to perform weekly maintenance, in the UTC time zone.
  @_s.JsonKey(name: 'WeeklyMaintenanceStartTime')
  final String weeklyMaintenanceStartTime;

  UpdateFileSystemLustreConfiguration({
    this.weeklyMaintenanceStartTime,
  });
  Map<String, dynamic> toJson() =>
      _$UpdateFileSystemLustreConfigurationToJson(this);
}

/// The response object for the <code>UpdateFileSystem</code> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateFileSystemResponse {
  /// A description of the file system that was updated.
  @_s.JsonKey(name: 'FileSystem')
  final FileSystem fileSystem;

  UpdateFileSystemResponse({
    this.fileSystem,
  });
  factory UpdateFileSystemResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateFileSystemResponseFromJson(json);
}

/// Updates the Microsoft Windows configuration for an existing Amazon FSx for
/// Windows File Server file system. Amazon FSx overwrites existing properties
/// with non-null values provided in the request. If you don't specify a
/// non-null value for a property, that property is not updated.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class UpdateFileSystemWindowsConfiguration {
  /// The number of days to retain automatic backups. Setting this to 0 disables
  /// automatic backups. You can retain automatic backups for a maximum of 35
  /// days.
  @_s.JsonKey(name: 'AutomaticBackupRetentionDays')
  final int automaticBackupRetentionDays;

  /// The preferred time to take daily automatic backups, in the UTC time zone.
  @_s.JsonKey(name: 'DailyAutomaticBackupStartTime')
  final String dailyAutomaticBackupStartTime;

  /// The configuration Amazon FSx uses to join the Windows File Server instance
  /// to the self-managed Microsoft AD directory.
  @_s.JsonKey(name: 'SelfManagedActiveDirectoryConfiguration')
  final SelfManagedActiveDirectoryConfigurationUpdates
      selfManagedActiveDirectoryConfiguration;

  /// The preferred time to perform weekly maintenance, in the UTC time zone.
  @_s.JsonKey(name: 'WeeklyMaintenanceStartTime')
  final String weeklyMaintenanceStartTime;

  UpdateFileSystemWindowsConfiguration({
    this.automaticBackupRetentionDays,
    this.dailyAutomaticBackupStartTime,
    this.selfManagedActiveDirectoryConfiguration,
    this.weeklyMaintenanceStartTime,
  });
  Map<String, dynamic> toJson() =>
      _$UpdateFileSystemWindowsConfigurationToJson(this);
}

enum WindowsDeploymentType {
  @_s.JsonValue('MULTI_AZ_1')
  multiAz_1,
  @_s.JsonValue('SINGLE_AZ_1')
  singleAz_1,
  @_s.JsonValue('SINGLE_AZ_2')
  singleAz_2,
}

/// The configuration for this Microsoft Windows file system.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class WindowsFileSystemConfiguration {
  /// The ID for an existing Microsoft Active Directory instance that the file
  /// system should join when it's created.
  @_s.JsonKey(name: 'ActiveDirectoryId')
  final String activeDirectoryId;

  /// The number of days to retain automatic backups. Setting this to 0 disables
  /// automatic backups. You can retain automatic backups for a maximum of 35
  /// days.
  @_s.JsonKey(name: 'AutomaticBackupRetentionDays')
  final int automaticBackupRetentionDays;

  /// A boolean flag indicating whether tags on the file system should be copied
  /// to backups. This value defaults to false. If it's set to true, all tags on
  /// the file system are copied to all automatic backups and any user-initiated
  /// backups where the user doesn't specify any tags. If this value is true, and
  /// you specify one or more tags, only the specified tags are copied to backups.
  /// If you specify one or more tags when creating a user-initiated backup, no
  /// tags are copied from the file system, regardless of this value.
  @_s.JsonKey(name: 'CopyTagsToBackups')
  final bool copyTagsToBackups;

  /// The preferred time to take daily automatic backups, in the UTC time zone.
  @_s.JsonKey(name: 'DailyAutomaticBackupStartTime')
  final String dailyAutomaticBackupStartTime;

  /// Specifies the file system deployment type, valid values are the following:
  ///
  /// <ul>
  /// <li>
  /// <code>MULTI_AZ_1</code> - Specifies a high availability file system that is
  /// configured for Multi-AZ redundancy to tolerate temporary Availability Zone
  /// (AZ) unavailability, and supports SSD and HDD storage.
  /// </li>
  /// <li>
  /// <code>SINGLE_AZ_1</code> - (Default) Specifies a file system that is
  /// configured for single AZ redundancy, only supports SSD storage.
  /// </li>
  /// <li>
  /// <code>SINGLE_AZ_2</code> - Latest generation Single AZ file system.
  /// Specifies a file system that is configured for single AZ redundancy and
  /// supports SSD and HDD storage.
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/fsx/latest/WindowsGuide/high-availability-multiAZ.html">Single-AZ
  /// and Multi-AZ File Systems</a>.
  @_s.JsonKey(name: 'DeploymentType')
  final WindowsDeploymentType deploymentType;

  /// The list of maintenance operations in progress for this file system.
  @_s.JsonKey(name: 'MaintenanceOperationsInProgress')
  final List<String> maintenanceOperationsInProgress;

  /// For <code>MULTI_AZ_1</code> deployment types, the IP address of the primary,
  /// or preferred, file server.
  ///
  /// Use this IP address when mounting the file system on Linux SMB clients or
  /// Windows SMB clients that are not joined to a Microsoft Active Directory.
  /// Applicable for all Windows file system deployment types. This IP address is
  /// temporarily unavailable when the file system is undergoing maintenance. For
  /// Linux and Windows SMB clients that are joined to an Active Directory, use
  /// the file system's DNSName instead. For more information on mapping and
  /// mounting file shares, see <a
  /// href="https://docs.aws.amazon.com/fsx/latest/WindowsGuide/accessing-file-shares.html">Accessing
  /// File Shares</a>.
  @_s.JsonKey(name: 'PreferredFileServerIp')
  final String preferredFileServerIp;

  /// For <code>MULTI_AZ_1</code> deployment types, it specifies the ID of the
  /// subnet where the preferred file server is located. Must be one of the two
  /// subnet IDs specified in <code>SubnetIds</code> property. Amazon FSx serves
  /// traffic from this subnet except in the event of a failover to the secondary
  /// file server.
  ///
  /// For <code>SINGLE_AZ_1</code> and <code>SINGLE_AZ_2</code> deployment types,
  /// this value is the same as that for <code>SubnetIDs</code>. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/fsx/latest/WindowsGuide/high-availability-multiAZ.html#single-multi-az-resources">Availability
  /// and Durability: Single-AZ and Multi-AZ File Systems</a>
  @_s.JsonKey(name: 'PreferredSubnetId')
  final String preferredSubnetId;

  /// For <code>MULTI_AZ_1</code> deployment types, use this endpoint when
  /// performing administrative tasks on the file system using Amazon FSx Remote
  /// PowerShell.
  ///
  /// For <code>SINGLE_AZ_1</code> and <code>SINGLE_AZ_2</code> deployment types,
  /// this is the DNS name of the file system.
  ///
  /// This endpoint is temporarily unavailable when the file system is undergoing
  /// maintenance.
  @_s.JsonKey(name: 'RemoteAdministrationEndpoint')
  final String remoteAdministrationEndpoint;
  @_s.JsonKey(name: 'SelfManagedActiveDirectoryConfiguration')
  final SelfManagedActiveDirectoryAttributes
      selfManagedActiveDirectoryConfiguration;

  /// The throughput of an Amazon FSx file system, measured in megabytes per
  /// second.
  @_s.JsonKey(name: 'ThroughputCapacity')
  final int throughputCapacity;

  /// The preferred time to perform weekly maintenance, in the UTC time zone.
  @_s.JsonKey(name: 'WeeklyMaintenanceStartTime')
  final String weeklyMaintenanceStartTime;

  WindowsFileSystemConfiguration({
    this.activeDirectoryId,
    this.automaticBackupRetentionDays,
    this.copyTagsToBackups,
    this.dailyAutomaticBackupStartTime,
    this.deploymentType,
    this.maintenanceOperationsInProgress,
    this.preferredFileServerIp,
    this.preferredSubnetId,
    this.remoteAdministrationEndpoint,
    this.selfManagedActiveDirectoryConfiguration,
    this.throughputCapacity,
    this.weeklyMaintenanceStartTime,
  });
  factory WindowsFileSystemConfiguration.fromJson(Map<String, dynamic> json) =>
      _$WindowsFileSystemConfigurationFromJson(json);
}

class ActiveDirectoryError extends _s.GenericAwsException {
  ActiveDirectoryError({String type, String message})
      : super(type: type, code: 'ActiveDirectoryError', message: message);
}

class BackupInProgress extends _s.GenericAwsException {
  BackupInProgress({String type, String message})
      : super(type: type, code: 'BackupInProgress', message: message);
}

class BackupNotFound extends _s.GenericAwsException {
  BackupNotFound({String type, String message})
      : super(type: type, code: 'BackupNotFound', message: message);
}

class BackupRestoring extends _s.GenericAwsException {
  BackupRestoring({String type, String message})
      : super(type: type, code: 'BackupRestoring', message: message);
}

class BadRequest extends _s.GenericAwsException {
  BadRequest({String type, String message})
      : super(type: type, code: 'BadRequest', message: message);
}

class DataRepositoryTaskEnded extends _s.GenericAwsException {
  DataRepositoryTaskEnded({String type, String message})
      : super(type: type, code: 'DataRepositoryTaskEnded', message: message);
}

class DataRepositoryTaskExecuting extends _s.GenericAwsException {
  DataRepositoryTaskExecuting({String type, String message})
      : super(
            type: type, code: 'DataRepositoryTaskExecuting', message: message);
}

class DataRepositoryTaskNotFound extends _s.GenericAwsException {
  DataRepositoryTaskNotFound({String type, String message})
      : super(type: type, code: 'DataRepositoryTaskNotFound', message: message);
}

class FileSystemNotFound extends _s.GenericAwsException {
  FileSystemNotFound({String type, String message})
      : super(type: type, code: 'FileSystemNotFound', message: message);
}

class IncompatibleParameterError extends _s.GenericAwsException {
  IncompatibleParameterError({String type, String message})
      : super(type: type, code: 'IncompatibleParameterError', message: message);
}

class InternalServerError extends _s.GenericAwsException {
  InternalServerError({String type, String message})
      : super(type: type, code: 'InternalServerError', message: message);
}

class InvalidExportPath extends _s.GenericAwsException {
  InvalidExportPath({String type, String message})
      : super(type: type, code: 'InvalidExportPath', message: message);
}

class InvalidImportPath extends _s.GenericAwsException {
  InvalidImportPath({String type, String message})
      : super(type: type, code: 'InvalidImportPath', message: message);
}

class InvalidNetworkSettings extends _s.GenericAwsException {
  InvalidNetworkSettings({String type, String message})
      : super(type: type, code: 'InvalidNetworkSettings', message: message);
}

class InvalidPerUnitStorageThroughput extends _s.GenericAwsException {
  InvalidPerUnitStorageThroughput({String type, String message})
      : super(
            type: type,
            code: 'InvalidPerUnitStorageThroughput',
            message: message);
}

class MissingFileSystemConfiguration extends _s.GenericAwsException {
  MissingFileSystemConfiguration({String type, String message})
      : super(
            type: type,
            code: 'MissingFileSystemConfiguration',
            message: message);
}

class NotServiceResourceError extends _s.GenericAwsException {
  NotServiceResourceError({String type, String message})
      : super(type: type, code: 'NotServiceResourceError', message: message);
}

class ResourceDoesNotSupportTagging extends _s.GenericAwsException {
  ResourceDoesNotSupportTagging({String type, String message})
      : super(
            type: type,
            code: 'ResourceDoesNotSupportTagging',
            message: message);
}

class ResourceNotFound extends _s.GenericAwsException {
  ResourceNotFound({String type, String message})
      : super(type: type, code: 'ResourceNotFound', message: message);
}

class ServiceLimitExceeded extends _s.GenericAwsException {
  ServiceLimitExceeded({String type, String message})
      : super(type: type, code: 'ServiceLimitExceeded', message: message);
}

class UnsupportedOperation extends _s.GenericAwsException {
  UnsupportedOperation({String type, String message})
      : super(type: type, code: 'UnsupportedOperation', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'ActiveDirectoryError': (type, message) =>
      ActiveDirectoryError(type: type, message: message),
  'BackupInProgress': (type, message) =>
      BackupInProgress(type: type, message: message),
  'BackupNotFound': (type, message) =>
      BackupNotFound(type: type, message: message),
  'BackupRestoring': (type, message) =>
      BackupRestoring(type: type, message: message),
  'BadRequest': (type, message) => BadRequest(type: type, message: message),
  'DataRepositoryTaskEnded': (type, message) =>
      DataRepositoryTaskEnded(type: type, message: message),
  'DataRepositoryTaskExecuting': (type, message) =>
      DataRepositoryTaskExecuting(type: type, message: message),
  'DataRepositoryTaskNotFound': (type, message) =>
      DataRepositoryTaskNotFound(type: type, message: message),
  'FileSystemNotFound': (type, message) =>
      FileSystemNotFound(type: type, message: message),
  'IncompatibleParameterError': (type, message) =>
      IncompatibleParameterError(type: type, message: message),
  'InternalServerError': (type, message) =>
      InternalServerError(type: type, message: message),
  'InvalidExportPath': (type, message) =>
      InvalidExportPath(type: type, message: message),
  'InvalidImportPath': (type, message) =>
      InvalidImportPath(type: type, message: message),
  'InvalidNetworkSettings': (type, message) =>
      InvalidNetworkSettings(type: type, message: message),
  'InvalidPerUnitStorageThroughput': (type, message) =>
      InvalidPerUnitStorageThroughput(type: type, message: message),
  'MissingFileSystemConfiguration': (type, message) =>
      MissingFileSystemConfiguration(type: type, message: message),
  'NotServiceResourceError': (type, message) =>
      NotServiceResourceError(type: type, message: message),
  'ResourceDoesNotSupportTagging': (type, message) =>
      ResourceDoesNotSupportTagging(type: type, message: message),
  'ResourceNotFound': (type, message) =>
      ResourceNotFound(type: type, message: message),
  'ServiceLimitExceeded': (type, message) =>
      ServiceLimitExceeded(type: type, message: message),
  'UnsupportedOperation': (type, message) =>
      UnsupportedOperation(type: type, message: message),
};
