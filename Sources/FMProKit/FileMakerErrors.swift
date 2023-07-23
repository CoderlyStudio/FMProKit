//
//  File.swift
//  
//
//  Created by Gianluca Annina on 08/07/23.
//

import Foundation
enum FMError: Error {
    case errorCodeMinus1Unknown
    case errorCode1UserCanceledAction
    case errorCode2MemoryError
    case errorCode3CommandIsUnaivalable
    case errorCode4CommandIsUnknown
    case errorCode5CommandIsInvalid
    case errorCode6FileReadOnly
    case errorCode7RunningOutOfMemory
    case errorCode9InsufficientPrivileges
    case errorCode10RequestedDataIsMissing
    case errorCode11NameIsNotValid
    case errorCode12NameAlreadyExists
    case errorCode13FileOrObjectIsInUse
    case errorCode14OutOfRange
    case errorCode15CantDivideByZero
    case errorCode16OperationFailedRequestRetry
    case errorCode17AttemptToConvertForeignCharacterSetToUTF16Failed
    case errorCode18ClientMustProvideAccountInformationToProceed
    case errorCode19StringContainsCharactersOtherThanASCII
    case errorCode20CommandOrOperationCanceledByTriggeredScript
    case errorCode21RequestNotSupported
    case errorCode100FileMissing
    case errorCode101RecordMissing
    case errorCode102FieldMissing
    case errorCode103RelationshipMissing
    case errorCode104ScriptMissing
    case errorCode105LayoutMissing
    case errorCode106TableMissing
    case errorCode107IndexMissing
    case errorCode108ValueListMissing
    case errorCode109PrivilegeSetMissing
    case errorCode110RelatedTableMissing
    case errorCode111FieldRepetitionInvalid
    case errorCode112WindowMissing
    case errorCode113FunctionMissing
    case errorCode114FileReferenceMissing
    case errorCode115MenuSetMissing
    case errorCode116LayoutObjectMissing
    case errorCode117DataSourceMissing
    case errorCode118ThemeMissing
    case errorCode130FilesDamagedOrMissing
    case errorCode131LanguagePackFilesMissing
    case errorCode200RecordAccessDenied
    case errorCode201FieldCannotBeModified
    case errorCode202FieldAccesDenied
    case errorCode203NoRecordsInFileToPrintOrPasswordDoesNotAllowPrintAccess
    case errorCode205UserDoesNotHaveAccessPrivilegesToCreateNewRecords
    case errorCode206UserDoesNotHavePasswordChangePrivileges
    case errorCode207UserDoesNotHavePrivilegesToChangeDatabaseSchema
    case errorCode208PasswordDoesNotContainEnoughCharacters
    case errorCode209NewPasswordMustBeDifferentFromExistingOne
    case errorCode210UserAccountIsInactive
    case errorCode211PasswordHasExpired
    case errorCode212InvalidUserAccountOrPassword
    case errorCode214TooManyLoginAttempts
    case errorCode215AdministratorPrivilegesCannotBeDuplicated
    case errorCode216GuestAccountCannotBeDuplicated
    case errorCode217UserDoesNotHaveSufficientPrivilegesToModifyAdministratorAccountù
    case errorCode218PasswordAndVerifyPasswordDoNotMatch
    case errorCode219CannotOpenFile
    case errorCode300FileIsLockedOrInUse
    case errorCode301RecordIsInUseByAnotherUser
    case errorCode302TableIsInUseByAnotherUser
    case errorCode303DatabaseSchemaIsInUseByAnotherUser
    case errorCode304LayoutIsInUseByAnotherUser
    case errorCode306RecordModificationIDDoesNotMatch
    case errorCode307TransactionCouldNotBeLockedBecauseOfACommunicationErrorWithTheHost
    case errorCode308ThemeIsLockedAndInUseByAnotherUser
    case errorCode400FindCriteriaAreEmpty
    case errorCode401NoRecordsMatchTheRequest
    case errorCode402SelectedFieldIsNotAMatchFieldForALookup
    case errorCode404SortOrderIsInvalid
    case errorCode405NumberOfRecordsSpecifiedExceedsNumberOfRecordsThatCanBeOmitted
    case errorCode406ReplaceOrReserializeCriteriaAreInvalid
    case errorCode407OneOrBothMatchFieldsAreMissing
    case errorCode408SpecifiedFieldHasInappropriateDataTypeForThisOperation
    case errorCode409ImportOrderIsInvalid
    case errorCode410ExportOrderIsInvalid
    case errorCode412WrongVersionOfFileMakerProUsedToRecoverFile
    case errorCode413SpecifiedFieldHasInappropiateFieldType
    case errorCode414LayoutCannotDisplayTheResult
    case errorCode415OneOrMoreRequiredRelatedRecordsAreNotAvailable
    case errorCode416APrimaryKeyIsRequiredFromTheDataSourceTable
    case errorCode417FileIsNotASupportedDataSource
    case errorCode418InternalFailureInInsertOperationIntoAField
    case errorCode500DateValueDoesNotMeetValidationEntryOptions
    case errorCode501TimeValueDoesNotMeetValidationEntryOptions
    case errorCode502NumberValueDoesNotMeetValidationEntryOptions
    case errorCode503ValueInFieldIsNotWithinTheRangeSpecifiedInValidationEntryOption
    case errorCode504ValueInFieldIsNotUnique
    case errorCode505ValueInFieldIsNotAnExistingValueInTheFile
    case errorCode506ValueInFieldIsNotListedInTheValueListSpecifiedInValidationEntry
    case errorCode507ValueInFieldFailedCalculationTestOfValidationEntryOption
    case errorCode508InvalidValueEnteredInFindMode
    case errorCode509FieldRequiresAValidValue
    case errorCode510RelatedValueIsEmptyOrUnavailable
    case errorCode511ValueInFieldExceedsMaximumFieldSize
    case errorCode512RecordWasAlreadyModifiedByAnotherUser
    case errorCode513NoValidationWasSpecifiedButDataCannotFitIntoTheField
    case errorCode600PrintErrorHasOccured
    case errorCode601CombinedHeaderAndFooterExceedOnePage
    case errorCode602BodyDoesNotFitOnAPageForCurrentColumnSetup
    case errorCode603PrintConnectionList
    case errorCode700FileIsOfTheWrongFileTypeForImport
    case errorCode706EPSFileHasNoPreviewImage
    case errorCode707GraphicTranslator
    case errorCode708CannotImportTheFile
    case errorCode711ImportTranslatorCannotBeFound
    case errorCode714PasswordPrivilegesDoNotAllow
    case errorCode715SpecifiedExcerlWorksheetOrNamedRangeIsMissing
    case errorCode716SQLQueryIsNotAllowedForODBCImport
    case errorCode717ThereIsNotEnoughXMLOrXSLInformationToProceedWithTheImportOrExport
    case errorCode718ErrorInParsingXMLFileUsingXerces
    case errorCode719ErrorInTransformingXMLUsingXSLUsingXalan
    case errorCode720ErrorWhenExportingFormatDoesNotSupportRepeatingFields
    case errorCode721UknownErrorOccuredInTheParserOrTheTransformer
    case errorCode722CannotImportDataIntoFileThatHasNoFields
    case errorCode723YouDoNotHavePermissionToAddRecordsToOrModifyRecordsInTheTargetTable
    case errorCode724YouDoNotHavePermissionToAddRecordsToTheTargetTable
    case errorCode725YouDoNotHavePermissionToModifyRecordsToTheTargetTable
    case errorCode726SourceFileHasMoreRecordsThanTheTargetTable
    case errorCode727TargetTableHasMoreRecordsThanTheSourceFile
    case errorCode729ErrorsOccurredDuringImport
    case errorCode730UnsupportedExcelVersion
    case errorCode731FileYouAreImportingFromContainsNoData
    case errorCode732ThisFileCannotBeInsertedBecauseItContainsOtherFiles
    case errorCode733ATableCannotBeImportedIntoItself
    case errorCode734ThisFileTypeCannotBeDisplayedAsAPicture
    case errorCode735ThisFileTypeCannotBeDisplayedAsAPicture
    case errorCode736TooMuchDataToExportToThisFormat
    case errorCode738TheThemeYouAreImportingAlreadyExists
    case errorCode800UnableToCreateFileOnDisk
    case errorCode801UnableToCreateTemporaryFileOnSystemDisk
    case errorCode802UnableToOpenFile
    case errorCode803FileIsSingleUserOrHostCannotBeFound
    case errorCode804FileCannotBeOpenedAsReadOnlyInItsCurrentState
    case errorCode805FileIsDamaged
    case errorCode806FileCannotBeOpenedWithThisVersionOfAFileMakerClient
    case errorCode807FileIsNotAFileMakerProFile
    case errorCode808CannotOpenFileBecauseAccessPrivilegesAreDamaged
    case errorCode809DiskOrVolumeIsFull
    case errorCode810DiskOrVolumeIsLocked
    case errorCode811TemporaryFileCannotBeOpenedAsFileMakerProfile
    case errorCode812ExceededHostCapacity
    case errorCode813RecordSynchronizationErrorOnNetwork
    case errorCode814FileCannotBeOpenedBecauseMaximumNumberIsOpen
    case errorCode815CouldNotOpenLookupFile
    case errorCode816UnableToConvertFile
    case errorCode817UnableToOpenFileBecauseItDoesNotBelongToThisSolution
    case errorCode819CannotSaveALocalCopyOfARemoteFile
    case errorCode820FileIsBeingClosed
    case errorCode821HostForcedADisconnect
    case errorCode822FileMakerProFilesNotFound
    case errorCode823CannotSetFileToSingleUser
    case errorCode824FileIsDamagedOrNotAFileMakerProFile
    case errorCode825FileIsNotAuthorizedToReferenceTheProtectedFile
    case errorCode826FilePathSpecifiedIsNotAValidPath
    case errorCode827FileWasNotCreatedBecauseTheSourceContainedNoDataOrIsAReference
    case errorCode850PathIsNotValidForTheOperatingSystem
    case errorCode851CannotDeleteAnExternalFileFromDisk
    case errorCode852CannotWriteAFileToTheExternalStorage
    case errorCode853OneOrMoreContainersFailedToTransfer
    case errorCode870CannotModifyFileBecauseAnotherUserIsModifyingIt
    case errorCode871ErrorOccurredLoadingCoreMLModel
    case errorCode872CoreMLModelWasNotLoadedBecauseItContainedAnUnsupportedInputOrOutputParameter
    case errorCode900GeneralSpellingEngineError
    case errorCode901MainSpellingDictionaryNotInstalled
    case errorCode903CommandCannotBeUsedInASharedFile
    case errorCode905CommandRequiresAFieldToBeActive
    case errorCode906CurrentFileIsNotShared
    case errorCode920CannotInitializeSpellingEngine
    case errorCode921UserDictionaryCannotBeLoadedForEditing
    case errorCode922UserDictionaryCannotBeFound
    case errorCode923UserDictionaryIsReadOnly
    case errorCode951AnUnexpectedErrorOccured
    case errorCode952InvalidFileMakerDataAPIToken
    case errorCode953ExceededLimitOnDataTheFileMakerDataAPIAndODataCanTranmit
    case errorCode954UnsupportedXMLGrammar
    case errorCode955NoDatabaseName
    case errorCode956MaximumNumberOfDatabaseOrAdminAPISessionsExceeded
    case errorCode957ConflictingCommands
    case errorCode958ParameterMissing
    case errorCode959CustomWebPublishingTechnologyIsDisabled
    case errorCode960ParameterIsInvalid
    case errorCode1200GenericCalculationError
    case errorCode1201TooFewParametersInTheFunction
    case errorCode1202TooManyParametersInTheFunction
    case errorCode1203UnexpectedEndOfCalculation
    case errorCode1204NumberOrTextConstantOrFieldNameOrBracketExpected
    case errorCode1205CommenIsNotTerminatedWithSlash
    case errorCode1206TextConstantMustEndWithAQuotationMark
    case errorCode1207UnbalancedParenthesis
    case errorCode1208OperatorMissingOrFunctionNotFoundOrBracketNotExpected
    case errorCode1209NameIsMissing
    case errorCode1210PlugInFunctionOrScriptStepHasAlreadyBeenRegistered
    case errorCode1211ListUsageIsNotAllowedInThisFun
    case errorCode1212AnOperatorIsExpectedHere
    case errorCode1213ThisVariableHasAlreadyBeenDefinedInTheLetFunction
    case errorCode1214AFunctionParameterIsAnInvalidGetFunctionParameter
    case errorCode1215ThisParameterIsAnInvalidGetFunctionParameter
    case errorCode1216OnlySummaryFieldsAreAllowedAsFirstArgumentInGetSummary
    case errorCode1217BreakFieldIsInvalid
    case errorCode1218CannotEvaluateTheNumber
    case errorCode1219AFieldCannotBeUsedInItsOwnFormula
    case errorCode1220FieldTypeMustBeNormalOrCalculated
    case errorCode1221DataTypeMustBeNumberOrDateOrTimeOrTimestamp
    case errorCode1222CalculationCannotBeStored
    case errorCode1223FunctionReferredToIsNotYetImplemented
    case errorCode1224FunctionReferredToDoesNotExist
    case errorCode1225FunctionReferredToIsNotSupportedInThisContext
    case errorCode1300TheSpecifiedNameCannotBeUsed
    case errorCode1301AParameterOfTheImportedOrPastedFunctionHasTheSameNameAsAFunctionInTheSameFile
    case errorCode1400ODBCConnectionErrors
    case errorCode1500SMTPConnectionErrors
    case errorCode1626ProtocolIsNotSupported
    case errorCode1627AuthenticationFailed
    case errorCode1628ThereWasAnErrorWithSSL
    case errorCode1629ConnectionTimedOut
    case errorCode1630URLFormatIsIncorrect
    case errorCode1631ConnectionFailed
    case errorCode1632TheCertificateHasExpired
    case errorCode1633TheCertificateIsSelfSigned
    case errorCode1634ACertificateVerificationErrorOccured
    case errorCode1635ConnectionIsUnencrypted
    case errorCode1700ResourceDoesNotExist
    case errorCode1701HostIsCurrentlyEnableToReceiveRequests
    case errorCode1702AuthenticationInformationWasNotProvidedInTheCorrectFormat
    case errorCode1703InvalidUsernameOrPasswordOrJSONWebToken
    case errorCode1704ResourceDoesNotSupportTheSpecifiedHTTPVerb
    case errorCode1705RequiredHTTPHeaderWasNotSpecified
    case errorCode1706ParameterIsNotSupported
    case errorCode1707RequiredParameterWasNotSpecifiedInTheRequest
    case errorCode1708ParameterValueIsInvalid
    case errorCode1709OperationIsInvalidForTheResourceCurrentStatus
    case errorCode1710JSONInputIsNotSyntacticallyValid
    case errorCode1711HostLicenseHasExpired
    case errorCode1712PrivateKeyFileAlreadyExists
    case errorCode1713TheAPIRequestIsNotSupportedForThisOperatingSystem
    case errorCode1714ExternalGroupNameIsInvalid
    case errorCode1715ExternalServerAccountSignInIsNotEnabled

    case undefinedError
}


func checkResponseCode(messages:[Message]) throws {
    let messageCode = Int(messages.first?.code ?? "0")
    if messageCode == -1 {
        throw FMError.errorCodeMinus1Unknown
    } else if messageCode == 0 {

    } else if messageCode == 1 {
        throw FMError.errorCode1UserCanceledAction
    } else if messageCode == 2 {
        throw FMError.errorCode2MemoryError
    } else if messageCode == 3 {
        throw FMError.errorCode3CommandIsUnaivalable
    } else if messageCode == 4 {
        throw FMError.errorCode4CommandIsUnknown
    } else if messageCode == 5 {
        throw FMError.errorCode5CommandIsInvalid
    } else if messageCode == 6 {
        throw FMError.errorCode6FileReadOnly
    } else if messageCode == 7 {
        throw FMError.errorCode7RunningOutOfMemory
    } else if messageCode == 9 {
        throw FMError.errorCode9InsufficientPrivileges
    } else if messageCode == 10 {
        throw FMError.errorCode10RequestedDataIsMissing
    } else if messageCode == 11 {
        throw FMError.errorCode11NameIsNotValid
    } else if messageCode == 12 {
        throw FMError.errorCode12NameAlreadyExists
    } else if messageCode == 13 {
        throw FMError.errorCode13FileOrObjectIsInUse
    } else if messageCode == 14 {
        throw FMError.errorCode14OutOfRange
    } else if messageCode == 15 {
        throw FMError.errorCode15CantDivideByZero
    } else if messageCode == 16 {
        throw FMError.errorCode16OperationFailedRequestRetry
    } else if messageCode == 17 {
        throw FMError.errorCode17AttemptToConvertForeignCharacterSetToUTF16Failed
    } else if messageCode == 18 {
        throw FMError.errorCode18ClientMustProvideAccountInformationToProceed
    } else if messageCode == 19 {
        throw FMError.errorCode19StringContainsCharactersOtherThanASCII
    } else if messageCode == 20 {
        throw FMError.errorCode20CommandOrOperationCanceledByTriggeredScript
    } else if messageCode == 21 {
        throw FMError.errorCode21RequestNotSupported
    } else if messageCode == 100 {
        throw FMError.errorCode100FileMissing
    } else if messageCode == 101 {
        throw FMError.errorCode101RecordMissing
    } else if messageCode == 102 {
        throw FMError.errorCode102FieldMissing
    } else if messageCode == 103 {
        throw FMError.errorCode103RelationshipMissing
    } else if messageCode == 104 {
        throw FMError.errorCode104ScriptMissing
    } else if messageCode == 105 {
        throw FMError.errorCode105LayoutMissing
    } else if messageCode == 106 {
        throw FMError.errorCode106TableMissing
    } else if messageCode == 107 {
        throw FMError.errorCode107IndexMissing
    } else if messageCode == 108 {
        throw FMError.errorCode108ValueListMissing
    } else if messageCode == 109 {
        throw FMError.errorCode109PrivilegeSetMissing
    } else if messageCode == 110 {
        throw FMError.errorCode110RelatedTableMissing
    } else if messageCode == 111 {
        throw FMError.errorCode111FieldRepetitionInvalid
    } else if messageCode == 112 {
        throw FMError.errorCode112WindowMissing
    } else if messageCode == 113 {
        throw FMError.errorCode113FunctionMissing
    } else if messageCode == 114 {
        throw FMError.errorCode114FileReferenceMissing
    } else if messageCode == 115 {
        throw FMError.errorCode115MenuSetMissing
    } else if messageCode == 116 {
        throw FMError.errorCode116LayoutObjectMissing
    } else if messageCode == 117 {
        throw FMError.errorCode117DataSourceMissing
    } else if messageCode == 118 {
        throw FMError.errorCode118ThemeMissing
    } else if messageCode == 130 {
        throw FMError.errorCode130FilesDamagedOrMissing
    } else if messageCode == 131 {
        throw FMError.errorCode131LanguagePackFilesMissing
    } else if messageCode == 200 {
        throw FMError.errorCode200RecordAccessDenied
    } else if messageCode == 201 {
        throw FMError.errorCode201FieldCannotBeModified
    } else if messageCode == 202 {
        throw FMError.errorCode202FieldAccesDenied
    } else if messageCode == 203 {
        throw FMError.errorCode203NoRecordsInFileToPrintOrPasswordDoesNotAllowPrintAccess
    } else if messageCode == 205 {
        throw FMError.errorCode205UserDoesNotHaveAccessPrivilegesToCreateNewRecords
    } else if messageCode == 206 {
        throw FMError.errorCode206UserDoesNotHavePasswordChangePrivileges
    } else if messageCode == 207 {
        throw FMError.errorCode207UserDoesNotHavePrivilegesToChangeDatabaseSchema
    } else if messageCode == 208 {
        throw FMError.errorCode208PasswordDoesNotContainEnoughCharacters
    } else if messageCode == 209 {
        throw FMError.errorCode209NewPasswordMustBeDifferentFromExistingOne
    } else if messageCode == 210 {
        throw FMError.errorCode210UserAccountIsInactive
    } else if messageCode == 211 {
        throw FMError.errorCode211PasswordHasExpired
    } else if messageCode == 212 {
        throw FMError.errorCode212InvalidUserAccountOrPassword
    } else if messageCode == 214 {
        throw FMError.errorCode214TooManyLoginAttempts
    } else if messageCode == 215 {
        throw FMError.errorCode215AdministratorPrivilegesCannotBeDuplicated
    } else if messageCode == 216 {
        throw FMError.errorCode216GuestAccountCannotBeDuplicated
    } else if messageCode == 217 {
        throw FMError.errorCode217UserDoesNotHaveSufficientPrivilegesToModifyAdministratorAccountù
    } else if messageCode == 218 {
        throw FMError.errorCode218PasswordAndVerifyPasswordDoNotMatch
    } else if messageCode == 219 {
        throw FMError.errorCode219CannotOpenFile
    } else if messageCode == 300 {
        throw FMError.errorCode300FileIsLockedOrInUse
    } else if messageCode == 301 {
        throw FMError.errorCode301RecordIsInUseByAnotherUser
    } else if messageCode == 302 {
        throw FMError.errorCode302TableIsInUseByAnotherUser
    } else if messageCode == 303 {
        throw FMError.errorCode303DatabaseSchemaIsInUseByAnotherUser
    } else if messageCode == 304 {
        throw FMError.errorCode304LayoutIsInUseByAnotherUser
    } else if messageCode == 306 {
        throw FMError.errorCode306RecordModificationIDDoesNotMatch
    } else if messageCode == 307 {
        throw FMError.errorCode307TransactionCouldNotBeLockedBecauseOfACommunicationErrorWithTheHost
    } else if messageCode == 308 {
        throw FMError.errorCode308ThemeIsLockedAndInUseByAnotherUser
    } else if messageCode == 400 {
        throw FMError.errorCode400FindCriteriaAreEmpty
    } else if messageCode == 401 {
        throw FMError.errorCode401NoRecordsMatchTheRequest
    } else if messageCode == 402 {
        throw FMError.errorCode402SelectedFieldIsNotAMatchFieldForALookup
    } else if messageCode == 404 {
        throw FMError.errorCode404SortOrderIsInvalid
    } else if messageCode == 405 {
        throw FMError.errorCode405NumberOfRecordsSpecifiedExceedsNumberOfRecordsThatCanBeOmitted
    } else if messageCode == 406 {
        throw FMError.errorCode406ReplaceOrReserializeCriteriaAreInvalid
    } else if messageCode == 407 {
        throw FMError.errorCode407OneOrBothMatchFieldsAreMissing
    } else if messageCode == 408 {
        throw FMError.errorCode408SpecifiedFieldHasInappropriateDataTypeForThisOperation
    } else if messageCode == 409 {
        throw FMError.errorCode409ImportOrderIsInvalid
    } else if messageCode == 410 {
        throw FMError.errorCode410ExportOrderIsInvalid
    } else if messageCode == 412 {
        throw FMError.errorCode412WrongVersionOfFileMakerProUsedToRecoverFile
    } else if messageCode == 413 {
        throw FMError.errorCode413SpecifiedFieldHasInappropiateFieldType
    } else if messageCode == 414 {
        throw FMError.errorCode414LayoutCannotDisplayTheResult
    } else if messageCode == 415 {
        throw FMError.errorCode415OneOrMoreRequiredRelatedRecordsAreNotAvailable
    } else if messageCode == 416 {
        throw FMError.errorCode416APrimaryKeyIsRequiredFromTheDataSourceTable
    } else if messageCode == 417 {
        throw FMError.errorCode417FileIsNotASupportedDataSource
    } else if messageCode == 418 {
        throw FMError.errorCode418InternalFailureInInsertOperationIntoAField
    } else if messageCode == 500 {
        throw FMError.errorCode500DateValueDoesNotMeetValidationEntryOptions
    } else if messageCode == 501 {
        throw FMError.errorCode501TimeValueDoesNotMeetValidationEntryOptions
    } else if messageCode == 502 {
        throw FMError.errorCode502NumberValueDoesNotMeetValidationEntryOptions
    } else if messageCode == 503 {
        throw FMError.errorCode503ValueInFieldIsNotWithinTheRangeSpecifiedInValidationEntryOption
    } else if messageCode == 504 {
        throw FMError.errorCode504ValueInFieldIsNotUnique
    } else if messageCode == 505 {
        throw FMError.errorCode505ValueInFieldIsNotAnExistingValueInTheFile
    } else if messageCode == 506 {
        throw FMError.errorCode506ValueInFieldIsNotListedInTheValueListSpecifiedInValidationEntry
    } else if messageCode == 507 {
        throw FMError.errorCode507ValueInFieldFailedCalculationTestOfValidationEntryOption
    } else if messageCode == 508 {
        throw FMError.errorCode508InvalidValueEnteredInFindMode
    } else if messageCode == 509 {
        throw FMError.errorCode509FieldRequiresAValidValue
    } else if messageCode == 510 {
        throw FMError.errorCode510RelatedValueIsEmptyOrUnavailable
    } else if messageCode == 511 {
        throw FMError.errorCode511ValueInFieldExceedsMaximumFieldSize
    } else if messageCode == 512 {
        throw FMError.errorCode512RecordWasAlreadyModifiedByAnotherUser
    } else if messageCode == 513 {
        throw FMError.errorCode513NoValidationWasSpecifiedButDataCannotFitIntoTheField
    } else if messageCode == 600 {
        throw FMError.errorCode600PrintErrorHasOccured
    } else if messageCode == 601 {
        throw FMError.errorCode601CombinedHeaderAndFooterExceedOnePage
    } else if messageCode == 602 {
        throw FMError.errorCode602BodyDoesNotFitOnAPageForCurrentColumnSetup
    } else if messageCode == 603 {
        throw FMError.errorCode603PrintConnectionList
    } else if messageCode == 700 {
        throw FMError.errorCode700FileIsOfTheWrongFileTypeForImport
    } else if messageCode == 706 {
        throw FMError.errorCode706EPSFileHasNoPreviewImage
    } else if messageCode == 707 {
        throw FMError.errorCode707GraphicTranslator
    } else if messageCode == 708 {
        throw FMError.errorCode708CannotImportTheFile
    } else if messageCode == 711 {
        throw FMError.errorCode711ImportTranslatorCannotBeFound
    } else if messageCode == 714 {
        throw FMError.errorCode714PasswordPrivilegesDoNotAllow
    } else if messageCode == 715 {
        throw FMError.errorCode715SpecifiedExcerlWorksheetOrNamedRangeIsMissing
    } else if messageCode == 716 {
        throw FMError.errorCode716SQLQueryIsNotAllowedForODBCImport
    } else if messageCode == 717 {
        throw FMError.errorCode717ThereIsNotEnoughXMLOrXSLInformationToProceedWithTheImportOrExport
    } else if messageCode == 718 {
        throw FMError.errorCode718ErrorInParsingXMLFileUsingXerces
    } else if messageCode == 720 {
        throw FMError.errorCode720ErrorWhenExportingFormatDoesNotSupportRepeatingFields
    } else if messageCode == 721 {
        throw FMError.errorCode721UknownErrorOccuredInTheParserOrTheTransformer
    } else if messageCode == 722 {
        throw FMError.errorCode722CannotImportDataIntoFileThatHasNoFields
    } else if messageCode == 723 {
        throw FMError.errorCode723YouDoNotHavePermissionToAddRecordsToOrModifyRecordsInTheTargetTable
    } else if messageCode == 724 {
        throw FMError.errorCode724YouDoNotHavePermissionToAddRecordsToTheTargetTable
    } else if messageCode == 506 {
        throw FMError.errorCode506ValueInFieldIsNotListedInTheValueListSpecifiedInValidationEntry
    } else if messageCode == 725 {
        throw FMError.errorCode725YouDoNotHavePermissionToModifyRecordsToTheTargetTable
    } else if messageCode == 726 {
        throw FMError.errorCode726SourceFileHasMoreRecordsThanTheTargetTable
    } else if messageCode == 727 {
        throw FMError.errorCode727TargetTableHasMoreRecordsThanTheSourceFile
    } else if messageCode == 729 {
        throw FMError.errorCode729ErrorsOccurredDuringImport
    } else if messageCode == 730 {
        throw FMError.errorCode730UnsupportedExcelVersion
    } else if messageCode == 731 {
        throw FMError.errorCode731FileYouAreImportingFromContainsNoData
    } else if messageCode == 732 {
        throw FMError.errorCode732ThisFileCannotBeInsertedBecauseItContainsOtherFiles
    } else if messageCode == 733 {
        throw FMError.errorCode733ATableCannotBeImportedIntoItself
    } else if messageCode == 734 {
        throw FMError.errorCode734ThisFileTypeCannotBeDisplayedAsAPicture
    } else if messageCode == 735 {
        throw FMError.errorCode735ThisFileTypeCannotBeDisplayedAsAPicture
    } else if messageCode == 736 {
        throw FMError.errorCode736TooMuchDataToExportToThisFormat
    } else if messageCode == 738 {
        throw FMError.errorCode738TheThemeYouAreImportingAlreadyExists
    } else if messageCode == 800 {
        throw FMError.errorCode800UnableToCreateFileOnDisk
    } else if messageCode == 801 {
        throw FMError.errorCode801UnableToCreateTemporaryFileOnSystemDisk
    } else if messageCode == 802 {
        throw FMError.errorCode802UnableToOpenFile
    } else if messageCode == 803 {
        throw FMError.errorCode803FileIsSingleUserOrHostCannotBeFound
    } else if messageCode == 804 {
        throw FMError.errorCode804FileCannotBeOpenedAsReadOnlyInItsCurrentState
    } else if messageCode == 805 {
        throw FMError.errorCode805FileIsDamaged
    } else if messageCode == 806 {
        throw FMError.errorCode806FileCannotBeOpenedWithThisVersionOfAFileMakerClient
    } else if messageCode == 807 {
        throw FMError.errorCode807FileIsNotAFileMakerProFile
    } else if messageCode == 808 {
        throw FMError.errorCode808CannotOpenFileBecauseAccessPrivilegesAreDamaged
    } else if messageCode == 809 {
        throw FMError.errorCode809DiskOrVolumeIsFull
    } else if messageCode == 810 {
        throw FMError.errorCode810DiskOrVolumeIsLocked
    } else if messageCode == 811 {
        throw FMError.errorCode811TemporaryFileCannotBeOpenedAsFileMakerProfile
    } else if messageCode == 812 {
        throw FMError.errorCode812ExceededHostCapacity
    } else if messageCode == 813 {
        throw FMError.errorCode813RecordSynchronizationErrorOnNetwork
    } else if messageCode == 814 {
        throw FMError.errorCode814FileCannotBeOpenedBecauseMaximumNumberIsOpen
    } else if messageCode == 815 {
        throw FMError.errorCode815CouldNotOpenLookupFile
    } else if messageCode == 816 {
        throw FMError.errorCode816UnableToConvertFile
    } else if messageCode == 817 {
        throw FMError.errorCode817UnableToOpenFileBecauseItDoesNotBelongToThisSolution
    } else if messageCode == 819 {
        throw FMError.errorCode819CannotSaveALocalCopyOfARemoteFile
    } else if messageCode == 820 {
        throw FMError.errorCode820FileIsBeingClosed
    } else if messageCode == 821 {
        throw FMError.errorCode821HostForcedADisconnect
    } else if messageCode == 822 {
        throw FMError.errorCode822FileMakerProFilesNotFound
    } else if messageCode == 823 {
        throw FMError.errorCode823CannotSetFileToSingleUser
    } else if messageCode == 824 {
        throw FMError.errorCode824FileIsDamagedOrNotAFileMakerProFile
    } else if messageCode == 825 {
        throw FMError.errorCode825FileIsNotAuthorizedToReferenceTheProtectedFile
    } else if messageCode == 826 {
        throw FMError.errorCode826FilePathSpecifiedIsNotAValidPath
    } else if messageCode == 827 {
        throw FMError.errorCode827FileWasNotCreatedBecauseTheSourceContainedNoDataOrIsAReference
    } else if messageCode == 850 {
        throw FMError.errorCode850PathIsNotValidForTheOperatingSystem
    } else if messageCode == 851 {
        throw FMError.errorCode851CannotDeleteAnExternalFileFromDisk
    } else if messageCode == 852 {
        throw FMError.errorCode852CannotWriteAFileToTheExternalStorage
    } else if messageCode == 853 {
        throw FMError.errorCode853OneOrMoreContainersFailedToTransfer
    } else if messageCode == 870 {
        throw FMError.errorCode870CannotModifyFileBecauseAnotherUserIsModifyingIt
    } else if messageCode == 871 {
        throw FMError.errorCode871ErrorOccurredLoadingCoreMLModel
    } else if messageCode == 872 {
        throw FMError.errorCode872CoreMLModelWasNotLoadedBecauseItContainedAnUnsupportedInputOrOutputParameter
    } else if messageCode == 900 {
        throw FMError.errorCode900GeneralSpellingEngineError
    } else if messageCode == 901 {
        throw FMError.errorCode901MainSpellingDictionaryNotInstalled
    } else if messageCode == 903 {
        throw FMError.errorCode903CommandCannotBeUsedInASharedFile
    } else if messageCode == 905 {
        throw FMError.errorCode905CommandRequiresAFieldToBeActive
    } else if messageCode == 906 {
        throw FMError.errorCode906CurrentFileIsNotShared
    } else if messageCode == 920 {
        throw FMError.errorCode920CannotInitializeSpellingEngine
    } else if messageCode == 921 {
        throw FMError.errorCode921UserDictionaryCannotBeLoadedForEditing
    } else if messageCode == 922 {
        throw FMError.errorCode922UserDictionaryCannotBeFound
    } else if messageCode == 923 {
        throw FMError.errorCode923UserDictionaryIsReadOnly
    } else if messageCode == 951 {
        throw FMError.errorCode951AnUnexpectedErrorOccured
    } else if messageCode == 952 {
        throw FMError.errorCode952InvalidFileMakerDataAPIToken
    } else if messageCode == 953 {
        throw FMError.errorCode953ExceededLimitOnDataTheFileMakerDataAPIAndODataCanTranmit
    } else if messageCode == 954 {
        throw FMError.errorCode954UnsupportedXMLGrammar
    } else if messageCode == 955 {
        throw FMError.errorCode955NoDatabaseName
    } else if messageCode == 956 {
        throw FMError.errorCode956MaximumNumberOfDatabaseOrAdminAPISessionsExceeded
    } else if messageCode == 957 {
        throw FMError.errorCode957ConflictingCommands
    } else if messageCode == 958 {
        throw FMError.errorCode958ParameterMissing
    } else if messageCode == 959 {
        throw FMError.errorCode959CustomWebPublishingTechnologyIsDisabled
    } else if messageCode == 960 {
        throw FMError.errorCode960ParameterIsInvalid
    } else if messageCode == 1200 {
        throw FMError.errorCode1200GenericCalculationError
    } else if messageCode == 1201 {
        throw FMError.errorCode1201TooFewParametersInTheFunction
    } else if messageCode == 1202 {
        throw FMError.errorCode1202TooManyParametersInTheFunction
    } else if messageCode == 1203 {
        throw FMError.errorCode1203UnexpectedEndOfCalculation
    } else if messageCode == 1204 {
        throw FMError.errorCode1204NumberOrTextConstantOrFieldNameOrBracketExpected
    } else if messageCode == 1205 {
        throw FMError.errorCode1205CommenIsNotTerminatedWithSlash
    } else if messageCode == 1206 {
        throw FMError.errorCode1206TextConstantMustEndWithAQuotationMark
    } else if messageCode == 1207 {
        throw FMError.errorCode1207UnbalancedParenthesis
    } else if messageCode == 1208 {
        throw FMError.errorCode1208OperatorMissingOrFunctionNotFoundOrBracketNotExpected
    } else if messageCode == 1209 {
        throw FMError.errorCode1209NameIsMissing
    } else if messageCode == 1210 {
        throw FMError.errorCode1210PlugInFunctionOrScriptStepHasAlreadyBeenRegistered
    } else if messageCode == 1211 {
        throw FMError.errorCode1211ListUsageIsNotAllowedInThisFun
    } else if messageCode == 1212 {
        throw FMError.errorCode1212AnOperatorIsExpectedHere
    } else if messageCode == 1213 {
        throw FMError.errorCode1213ThisVariableHasAlreadyBeenDefinedInTheLetFunction
    } else if messageCode == 1214 {
        throw FMError.errorCode1214AFunctionParameterIsAnInvalidGetFunctionParameter
    } else if messageCode == 1215 {
        throw FMError.errorCode1215ThisParameterIsAnInvalidGetFunctionParameter
    } else if messageCode == 1216 {
        throw FMError.errorCode1216OnlySummaryFieldsAreAllowedAsFirstArgumentInGetSummary
    } else if messageCode == 1217 {
        throw FMError.errorCode1217BreakFieldIsInvalid
    } else if messageCode == 1218 {
        throw FMError.errorCode1218CannotEvaluateTheNumber
    } else if messageCode == 1219 {
        throw FMError.errorCode1219AFieldCannotBeUsedInItsOwnFormula
    } else if messageCode == 1220 {
        throw FMError.errorCode1220FieldTypeMustBeNormalOrCalculated
    } else if messageCode == 1221 {
        throw FMError.errorCode1221DataTypeMustBeNumberOrDateOrTimeOrTimestamp
    } else if messageCode == 1222 {
        throw FMError.errorCode1222CalculationCannotBeStored
    } else if messageCode == 1223 {
        throw FMError.errorCode1223FunctionReferredToIsNotYetImplemented
    } else if messageCode == 1224 {
        throw FMError.errorCode1224FunctionReferredToDoesNotExist
    } else if messageCode == 1225 {
        throw FMError.errorCode1225FunctionReferredToIsNotSupportedInThisContext
    } else if messageCode == 1300 {
        throw FMError.errorCode1300TheSpecifiedNameCannotBeUsed
    } else if messageCode == 1301 {
        throw FMError.errorCode1301AParameterOfTheImportedOrPastedFunctionHasTheSameNameAsAFunctionInTheSameFile
    } else if messageCode ?? 0 >= 1400 && messageCode ?? 0 <= 1499 {
        throw FMError.errorCode1400ODBCConnectionErrors
    } else if messageCode ?? 0 >= 1500 && messageCode ?? 0 <= 1599 {
        throw FMError.errorCode1500SMTPConnectionErrors
    } else if messageCode == 1626 {
        throw FMError.errorCode1626ProtocolIsNotSupported
    } else if messageCode == 1627 {
        throw FMError.errorCode1627AuthenticationFailed
    } else if messageCode == 1628 {
        throw FMError.errorCode1628ThereWasAnErrorWithSSL
    } else if messageCode == 1629 {
        throw FMError.errorCode1629ConnectionTimedOut
    } else if messageCode == 1630 {
        throw FMError.errorCode1630URLFormatIsIncorrect
    } else if messageCode == 1631 {
        throw FMError.errorCode1631ConnectionFailed
    } else if messageCode == 1632 {
        throw FMError.errorCode1632TheCertificateHasExpired
    } else if messageCode == 1633 {
        throw FMError.errorCode1633TheCertificateIsSelfSigned
    } else if messageCode == 1634 {
        throw FMError.errorCode1634ACertificateVerificationErrorOccured
    } else if messageCode == 1635 {
        throw FMError.errorCode1635ConnectionIsUnencrypted
    } else if messageCode == 1700 {
        throw FMError.errorCode1700ResourceDoesNotExist
    } else if messageCode == 1701 {
        throw FMError.errorCode1701HostIsCurrentlyEnableToReceiveRequests
    } else if messageCode == 1702 {
        throw FMError.errorCode1702AuthenticationInformationWasNotProvidedInTheCorrectFormat
    } else if messageCode == 1703 {
        throw FMError.errorCode1703InvalidUsernameOrPasswordOrJSONWebToken
    } else if messageCode == 1704 {
        throw FMError.errorCode1704ResourceDoesNotSupportTheSpecifiedHTTPVerb
    } else if messageCode == 1705 {
        throw FMError.errorCode1705RequiredHTTPHeaderWasNotSpecified
    } else if messageCode == 1706 {
        throw FMError.errorCode1706ParameterIsNotSupported
    } else if messageCode == 1707 {
        throw FMError.errorCode1707RequiredParameterWasNotSpecifiedInTheRequest
    } else if messageCode == 1708 {
        throw FMError.errorCode1708ParameterValueIsInvalid
    } else if messageCode == 1709 {
        throw FMError.errorCode1709OperationIsInvalidForTheResourceCurrentStatus
    } else if messageCode == 1710 {
        throw FMError.errorCode1710JSONInputIsNotSyntacticallyValid
    } else if messageCode == 1710 {
        throw FMError.errorCode1710JSONInputIsNotSyntacticallyValid
    } else if messageCode == 1711 {
        throw FMError.errorCode1711HostLicenseHasExpired
    } else if messageCode == 1712 {
        throw FMError.errorCode1712PrivateKeyFileAlreadyExists
    } else if messageCode == 1713 {
        throw FMError.errorCode1713TheAPIRequestIsNotSupportedForThisOperatingSystem
    } else if messageCode == 1714 {
        throw FMError.errorCode1714ExternalGroupNameIsInvalid
    } else if messageCode == 1715 {
        throw FMError.errorCode1715ExternalServerAccountSignInIsNotEnabled
    }else{
        throw FMError.undefinedError
    }
}
