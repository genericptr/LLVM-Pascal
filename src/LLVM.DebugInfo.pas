{
    Generated from LLVM 16 using H2Pas

    ====================================================================

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program; if not, write to the Free Software
    Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
}

unit LLVM.DebugInfo;
interface
uses
  UnixType;

{$include LLVM.Macros.inc}
{$include LLVM.Types.inc}

type
    LLVMDIFlags = (LLVMDIFlagZero := 0,LLVMDIFlagPrivate := 1,
      LLVMDIFlagProtected := 2,LLVMDIFlagPublic := 3,
      LLVMDIFlagFwdDecl := 1 shl 2,LLVMDIFlagAppleBlock := 1 shl 3,
      LLVMDIFlagReservedBit4 := 1 shl 4,LLVMDIFlagVirtual := 1 shl 5,
      LLVMDIFlagArtificial := 1 shl 6,LLVMDIFlagExplicit := 1 shl 7,
      LLVMDIFlagPrototyped := 1 shl 8,LLVMDIFlagObjcClassComplete := 1 shl 9,
      LLVMDIFlagObjectPointer := 1 shl 10,LLVMDIFlagVector := 1 shl 11,
      LLVMDIFlagStaticMember := 1 shl 12,LLVMDIFlagLValueReference := 1 shl 13,
      LLVMDIFlagRValueReference := 1 shl 14,LLVMDIFlagReserved := 1 shl 15,
      LLVMDIFlagSingleInheritance := 1 shl 16,LLVMDIFlagMultipleInheritance := 2 shl 16,
      LLVMDIFlagVirtualInheritance := 3 shl 16,LLVMDIFlagIntroducedVirtual := 1 shl 18,
      LLVMDIFlagBitField := 1 shl 19,LLVMDIFlagNoReturn := 1 shl 20,
      LLVMDIFlagTypePassByValue := 1 shl 22,LLVMDIFlagTypePassByReference := 1 shl 23,
      LLVMDIFlagEnumClass := 1 shl 24,LLVMDIFlagFixedEnum := LLVMDIFlagEnumClass,
      LLVMDIFlagThunk := 1 shl 25,LLVMDIFlagNonTrivial := 1 shl 26,
      LLVMDIFlagBigEndian := 1 shl 27,LLVMDIFlagLittleEndian := 1 shl 28,
      LLVMDIFlagIndirectVirtualBase := (1 shl 2) or (1 shl 5)
      //LLVMDIFlagAccessibility := (LLVMDIFlagPrivate or LLVMDIFlagProtected or LLVMDIFlagPublic),
      //LLVMDIFlagPtrToMemberRep := (LLVMDIFlagSingleInheritance or LLVMDIFlagMultipleInheritance or LLVMDIFlagVirtualInheritance)
      );
    LLVMDWARFSourceLanguage = (LLVMDWARFSourceLanguageC89,LLVMDWARFSourceLanguageC,
      LLVMDWARFSourceLanguageAda83,LLVMDWARFSourceLanguageC_plus_plus,
      LLVMDWARFSourceLanguageCobol74,LLVMDWARFSourceLanguageCobol85,
      LLVMDWARFSourceLanguageFortran77,LLVMDWARFSourceLanguageFortran90,
      LLVMDWARFSourceLanguagePascal83,LLVMDWARFSourceLanguageModula2,
      LLVMDWARFSourceLanguageJava,LLVMDWARFSourceLanguageC99,
      LLVMDWARFSourceLanguageAda95,LLVMDWARFSourceLanguageFortran95,
      LLVMDWARFSourceLanguagePLI,LLVMDWARFSourceLanguageObjC,
      LLVMDWARFSourceLanguageObjC_plus_plus,
      LLVMDWARFSourceLanguageUPC,LLVMDWARFSourceLanguageD,
      LLVMDWARFSourceLanguagePython,LLVMDWARFSourceLanguageOpenCL,
      LLVMDWARFSourceLanguageGo,LLVMDWARFSourceLanguageModula3,
      LLVMDWARFSourceLanguageHaskell,LLVMDWARFSourceLanguageC_plus_plus_03,
      LLVMDWARFSourceLanguageC_plus_plus_11,
      LLVMDWARFSourceLanguageOCaml,LLVMDWARFSourceLanguageRust,
      LLVMDWARFSourceLanguageC11,LLVMDWARFSourceLanguageSwift,
      LLVMDWARFSourceLanguageJulia,LLVMDWARFSourceLanguageDylan,
      LLVMDWARFSourceLanguageC_plus_plus_14,
      LLVMDWARFSourceLanguageFortran03,LLVMDWARFSourceLanguageFortran08,
      LLVMDWARFSourceLanguageRenderScript,
      LLVMDWARFSourceLanguageBLISS,LLVMDWARFSourceLanguageKotlin,
      LLVMDWARFSourceLanguageZig,LLVMDWARFSourceLanguageCrystal,
      LLVMDWARFSourceLanguageC_plus_plus_17,
      LLVMDWARFSourceLanguageC_plus_plus_20,
      LLVMDWARFSourceLanguageC17,LLVMDWARFSourceLanguageFortran18,
      LLVMDWARFSourceLanguageAda2005,LLVMDWARFSourceLanguageAda2012,
      LLVMDWARFSourceLanguageMips_Assembler,
      LLVMDWARFSourceLanguageGOOGLE_RenderScript,
      LLVMDWARFSourceLanguageBORLAND_Delphi
      );

    LLVMDWARFEmissionKind = (LLVMDWARFEmissionNone,LLVMDWARFEmissionFull,
      LLVMDWARFEmissionLineTablesOnly);

    LLVMMetadataKind = (LLVMMDStringMetadataKind,LLVMConstantAsMetadataMetadataKind,
      LLVMLocalAsMetadataMetadataKind,LLVMDistinctMDOperandPlaceholderMetadataKind,
      LLVMMDTupleMetadataKind,LLVMDILocationMetadataKind,
      LLVMDIExpressionMetadataKind,LLVMDIGlobalVariableExpressionMetadataKind,
      LLVMGenericDINodeMetadataKind,LLVMDISubrangeMetadataKind,
      LLVMDIEnumeratorMetadataKind,LLVMDIBasicTypeMetadataKind,
      LLVMDIDerivedTypeMetadataKind,LLVMDICompositeTypeMetadataKind,
      LLVMDISubroutineTypeMetadataKind,LLVMDIFileMetadataKind,
      LLVMDICompileUnitMetadataKind,LLVMDISubprogramMetadataKind,
      LLVMDILexicalBlockMetadataKind,LLVMDILexicalBlockFileMetadataKind,
      LLVMDINamespaceMetadataKind,LLVMDIModuleMetadataKind,
      LLVMDITemplateTypeParameterMetadataKind,
      LLVMDITemplateValueParameterMetadataKind,
      LLVMDIGlobalVariableMetadataKind,LLVMDILocalVariableMetadataKind,
      LLVMDILabelMetadataKind,LLVMDIObjCPropertyMetadataKind,
      LLVMDIImportedEntityMetadataKind,LLVMDIMacroMetadataKind,
      LLVMDIMacroFileMetadataKind,LLVMDICommonBlockMetadataKind,
      LLVMDIStringTypeMetadataKind,LLVMDIGenericSubrangeMetadataKind,
      LLVMDIArgListMetadataKind,LLVMDIAssignIDMetadataKind
      );

    LLVMDWARFTypeEncoding = dword;

    LLVMDWARFMacinfoRecordType = (LLVMDWARFMacinfoRecordTypeDefine := $01,
      LLVMDWARFMacinfoRecordTypeMacro := $02,
      LLVMDWARFMacinfoRecordTypeStartFile := $03,
      LLVMDWARFMacinfoRecordTypeEndFile := $04,
      LLVMDWARFMacinfoRecordTypeVendorExt := $ff
      );

function LLVMDebugMetadataVersion:dword; LibLLVM;
function LLVMGetModuleDebugMetadataVersion(Module:LLVMModuleRef):dword; LibLLVM;
function LLVMStripModuleDebugInfo(Module:LLVMModuleRef):LLVMBool; LibLLVM;
function LLVMCreateDIBuilderDisallowUnresolved(M:LLVMModuleRef):LLVMDIBuilderRef; LibLLVM;
function LLVMCreateDIBuilder(M:LLVMModuleRef):LLVMDIBuilderRef; LibLLVM;
procedure LLVMDisposeDIBuilder(Builder:LLVMDIBuilderRef); LibLLVM;
procedure LLVMDIBuilderFinalize(Builder:LLVMDIBuilderRef); LibLLVM;
procedure LLVMDIBuilderFinalizeSubprogram(Builder:LLVMDIBuilderRef; Subprogram:LLVMMetadataRef); LibLLVM;
function LLVMDIBuilderCreateCompileUnit(Builder:LLVMDIBuilderRef; Lang:LLVMDWARFSourceLanguage; FileRef:LLVMMetadataRef; Producer:Pchar; ProducerLen:size_t; 
         isOptimized:LLVMBool; Flags:Pchar; FlagsLen:size_t; RuntimeVer:dword; SplitName:Pchar; 
         SplitNameLen:size_t; Kind:LLVMDWARFEmissionKind; DWOId:dword; SplitDebugInlining:LLVMBool; DebugInfoForProfiling:LLVMBool; 
         SysRoot:Pchar; SysRootLen:size_t; SDK:Pchar; SDKLen:size_t):LLVMMetadataRef; LibLLVM;
function LLVMDIBuilderCreateFile(Builder:LLVMDIBuilderRef; Filename:Pchar; FilenameLen:size_t; Directory:Pchar; DirectoryLen:size_t):LLVMMetadataRef; LibLLVM;
function LLVMDIBuilderCreateModule(Builder:LLVMDIBuilderRef; ParentScope:LLVMMetadataRef; Name:Pchar; NameLen:size_t; ConfigMacros:Pchar; 
         ConfigMacrosLen:size_t; IncludePath:Pchar; IncludePathLen:size_t; APINotesFile:Pchar; APINotesFileLen:size_t):LLVMMetadataRef; LibLLVM;
function LLVMDIBuilderCreateNameSpace(Builder:LLVMDIBuilderRef; ParentScope:LLVMMetadataRef; Name:Pchar; NameLen:size_t; ExportSymbols:LLVMBool):LLVMMetadataRef; LibLLVM;
function LLVMDIBuilderCreateFunction(Builder:LLVMDIBuilderRef; Scope:LLVMMetadataRef; Name:Pchar; NameLen:size_t; LinkageName:Pchar; 
         LinkageNameLen:size_t; &File:LLVMMetadataRef; LineNo:dword; Ty:LLVMMetadataRef; IsLocalToUnit:LLVMBool; 
         IsDefinition:LLVMBool; ScopeLine:dword; Flags:LLVMDIFlags; IsOptimized:LLVMBool):LLVMMetadataRef; LibLLVM;
function LLVMDIBuilderCreateLexicalBlock(Builder:LLVMDIBuilderRef; Scope:LLVMMetadataRef; &File:LLVMMetadataRef; Line:dword; Column:dword):LLVMMetadataRef; LibLLVM;
function LLVMDIBuilderCreateLexicalBlockFile(Builder:LLVMDIBuilderRef; Scope:LLVMMetadataRef; &File:LLVMMetadataRef; Discriminator:dword):LLVMMetadataRef; LibLLVM;
function LLVMDIBuilderCreateImportedModuleFromNamespace(Builder:LLVMDIBuilderRef; Scope:LLVMMetadataRef; NS:LLVMMetadataRef; &File:LLVMMetadataRef; Line:dword):LLVMMetadataRef; LibLLVM;
function LLVMDIBuilderCreateImportedModuleFromAlias(Builder:LLVMDIBuilderRef; Scope:LLVMMetadataRef; ImportedEntity:LLVMMetadataRef; &File:LLVMMetadataRef; Line:dword; 
         Elements:PLLVMMetadataRef; NumElements:dword):LLVMMetadataRef; LibLLVM;
function LLVMDIBuilderCreateImportedModuleFromModule(Builder:LLVMDIBuilderRef; Scope:LLVMMetadataRef; M:LLVMMetadataRef; &File:LLVMMetadataRef; Line:dword; 
         Elements:PLLVMMetadataRef; NumElements:dword):LLVMMetadataRef; LibLLVM;
function LLVMDIBuilderCreateImportedDeclaration(Builder:LLVMDIBuilderRef; Scope:LLVMMetadataRef; Decl:LLVMMetadataRef; &File:LLVMMetadataRef; Line:dword; 
         Name:Pchar; NameLen:size_t; Elements:PLLVMMetadataRef; NumElements:dword):LLVMMetadataRef; LibLLVM;
function LLVMDIBuilderCreateDebugLocation(Ctx:LLVMContextRef; Line:dword; Column:dword; Scope:LLVMMetadataRef; InlinedAt:LLVMMetadataRef):LLVMMetadataRef; LibLLVM;
function LLVMDILocationGetLine(Location:LLVMMetadataRef):dword; LibLLVM;
function LLVMDILocationGetColumn(Location:LLVMMetadataRef):dword; LibLLVM;
function LLVMDILocationGetScope(Location:LLVMMetadataRef):LLVMMetadataRef; LibLLVM;
function LLVMDILocationGetInlinedAt(Location:LLVMMetadataRef):LLVMMetadataRef; LibLLVM;
function LLVMDIScopeGetFile(Scope:LLVMMetadataRef):LLVMMetadataRef; LibLLVM;
function LLVMDIFileGetDirectory(&File:LLVMMetadataRef; Len:Pdword):PChar; LibLLVM;
function LLVMDIFileGetFilename(&File:LLVMMetadataRef; Len:Pdword):PChar; LibLLVM;
function LLVMDIFileGetSource(&File:LLVMMetadataRef; Len:Pdword):PChar; LibLLVM;
function LLVMDIBuilderGetOrCreateTypeArray(Builder:LLVMDIBuilderRef; Data:PLLVMMetadataRef; NumElements:size_t):LLVMMetadataRef; LibLLVM;
function LLVMDIBuilderCreateSubroutineType(Builder:LLVMDIBuilderRef; &File:LLVMMetadataRef; ParameterTypes:PLLVMMetadataRef; NumParameterTypes:dword; Flags:LLVMDIFlags):LLVMMetadataRef; LibLLVM;
function LLVMDIBuilderCreateMacro(Builder:LLVMDIBuilderRef; ParentMacroFile:LLVMMetadataRef; Line:dword; RecordType:LLVMDWARFMacinfoRecordType; Name:Pchar; 
         NameLen:size_t; Value:Pchar; ValueLen:size_t):LLVMMetadataRef; LibLLVM;
function LLVMDIBuilderCreateTempMacroFile(Builder:LLVMDIBuilderRef; ParentMacroFile:LLVMMetadataRef; Line:dword; &File:LLVMMetadataRef):LLVMMetadataRef; LibLLVM;
function LLVMDIBuilderCreateEnumerator(Builder:LLVMDIBuilderRef; Name:Pchar; NameLen:size_t; Value:Int64; IsUnsigned:LLVMBool):LLVMMetadataRef; LibLLVM;
function LLVMDIBuilderCreateEnumerationType(Builder:LLVMDIBuilderRef; Scope:LLVMMetadataRef; Name:Pchar; NameLen:size_t; &File:LLVMMetadataRef; 
         LineNumber:dword; SizeInBits:UInt64; AlignInBits:UInt32; Elements:PLLVMMetadataRef; NumElements:dword; 
         ClassTy:LLVMMetadataRef):LLVMMetadataRef; LibLLVM;
function LLVMDIBuilderCreateUnionType(Builder:LLVMDIBuilderRef; Scope:LLVMMetadataRef; Name:Pchar; NameLen:size_t; &File:LLVMMetadataRef; 
         LineNumber:dword; SizeInBits:UInt64; AlignInBits:UInt32; Flags:LLVMDIFlags; Elements:PLLVMMetadataRef; 
         NumElements:dword; RunTimeLang:dword; UniqueId:Pchar; UniqueIdLen:size_t):LLVMMetadataRef; LibLLVM;
function LLVMDIBuilderCreateArrayType(Builder:LLVMDIBuilderRef; Size:UInt64; AlignInBits:UInt32; Ty:LLVMMetadataRef; Subscripts:PLLVMMetadataRef; 
         NumSubscripts:dword):LLVMMetadataRef; LibLLVM;
function LLVMDIBuilderCreateVectorType(Builder:LLVMDIBuilderRef; Size:UInt64; AlignInBits:UInt32; Ty:LLVMMetadataRef; Subscripts:PLLVMMetadataRef; 
         NumSubscripts:dword):LLVMMetadataRef; LibLLVM;
function LLVMDIBuilderCreateUnspecifiedType(Builder:LLVMDIBuilderRef; Name:Pchar; NameLen:size_t):LLVMMetadataRef; LibLLVM;
function LLVMDIBuilderCreateBasicType(Builder:LLVMDIBuilderRef; Name:Pchar; NameLen:size_t; SizeInBits:UInt64; Encoding:LLVMDWARFTypeEncoding; 
         Flags:LLVMDIFlags):LLVMMetadataRef; LibLLVM;
function LLVMDIBuilderCreatePointerType(Builder:LLVMDIBuilderRef; PointeeTy:LLVMMetadataRef; SizeInBits:UInt64; AlignInBits:UInt32; AddressSpace:dword; 
         Name:Pchar; NameLen:size_t):LLVMMetadataRef; LibLLVM;
function LLVMDIBuilderCreateStructType(Builder:LLVMDIBuilderRef; Scope:LLVMMetadataRef; Name:Pchar; NameLen:size_t; &File:LLVMMetadataRef; 
         LineNumber:dword; SizeInBits:UInt64; AlignInBits:UInt32; Flags:LLVMDIFlags; DerivedFrom:LLVMMetadataRef; 
         Elements:PLLVMMetadataRef; NumElements:dword; RunTimeLang:dword; VTableHolder:LLVMMetadataRef; UniqueId:Pchar; 
         UniqueIdLen:size_t):LLVMMetadataRef; LibLLVM;
function LLVMDIBuilderCreateMemberType(Builder:LLVMDIBuilderRef; Scope:LLVMMetadataRef; Name:Pchar; NameLen:size_t; &File:LLVMMetadataRef; 
         LineNo:dword; SizeInBits:UInt64; AlignInBits:UInt32; OffsetInBits:UInt64; Flags:LLVMDIFlags; 
         Ty:LLVMMetadataRef):LLVMMetadataRef; LibLLVM;
function LLVMDIBuilderCreateStaticMemberType(Builder:LLVMDIBuilderRef; Scope:LLVMMetadataRef; Name:Pchar; NameLen:size_t; &File:LLVMMetadataRef; 
         LineNumber:dword; _Type:LLVMMetadataRef; Flags:LLVMDIFlags; ConstantVal:LLVMValueRef; AlignInBits:UInt32):LLVMMetadataRef; LibLLVM;
function LLVMDIBuilderCreateMemberPointerType(Builder:LLVMDIBuilderRef; PointeeType:LLVMMetadataRef; ClassType:LLVMMetadataRef; SizeInBits:UInt64; AlignInBits:UInt32; 
         Flags:LLVMDIFlags):LLVMMetadataRef; LibLLVM;
function LLVMDIBuilderCreateObjCIVar(Builder:LLVMDIBuilderRef; Name:Pchar; NameLen:size_t; &File:LLVMMetadataRef; LineNo:dword; 
         SizeInBits:UInt64; AlignInBits:UInt32; OffsetInBits:UInt64; Flags:LLVMDIFlags; Ty:LLVMMetadataRef; 
         PropertyNode:LLVMMetadataRef):LLVMMetadataRef; LibLLVM;
function LLVMDIBuilderCreateObjCProperty(Builder:LLVMDIBuilderRef; Name:Pchar; NameLen:size_t; &File:LLVMMetadataRef; LineNo:dword; 
         GetterName:Pchar; GetterNameLen:size_t; SetterName:Pchar; SetterNameLen:size_t; PropertyAttributes:dword; 
         Ty:LLVMMetadataRef):LLVMMetadataRef; LibLLVM;
function LLVMDIBuilderCreateObjectPointerType(Builder:LLVMDIBuilderRef; _Type:LLVMMetadataRef):LLVMMetadataRef; LibLLVM;
function LLVMDIBuilderCreateQualifiedType(Builder:LLVMDIBuilderRef; Tag:dword; _Type:LLVMMetadataRef):LLVMMetadataRef; LibLLVM;
function LLVMDIBuilderCreateReferenceType(Builder:LLVMDIBuilderRef; Tag:dword; _Type:LLVMMetadataRef):LLVMMetadataRef; LibLLVM;
function LLVMDIBuilderCreateNullPtrType(Builder:LLVMDIBuilderRef):LLVMMetadataRef; LibLLVM;
function LLVMDIBuilderCreateTypedef(Builder:LLVMDIBuilderRef; _Type:LLVMMetadataRef; Name:Pchar; NameLen:size_t; &File:LLVMMetadataRef; 
         LineNo:dword; Scope:LLVMMetadataRef; AlignInBits:UInt32):LLVMMetadataRef; LibLLVM;
function LLVMDIBuilderCreateInheritance(Builder:LLVMDIBuilderRef; Ty:LLVMMetadataRef; BaseTy:LLVMMetadataRef; BaseOffset:UInt64; VBPtrOffset:UInt32; 
         Flags:LLVMDIFlags):LLVMMetadataRef; LibLLVM;
function LLVMDIBuilderCreateForwardDecl(Builder:LLVMDIBuilderRef; Tag:dword; Name:Pchar; NameLen:size_t; Scope:LLVMMetadataRef; 
         &File:LLVMMetadataRef; Line:dword; RuntimeLang:dword; SizeInBits:UInt64; AlignInBits:UInt32; 
         UniqueIdentifier:Pchar; UniqueIdentifierLen:size_t):LLVMMetadataRef; LibLLVM;
function LLVMDIBuilderCreateReplaceableCompositeType(Builder:LLVMDIBuilderRef; Tag:dword; Name:Pchar; NameLen:size_t; Scope:LLVMMetadataRef; 
         &File:LLVMMetadataRef; Line:dword; RuntimeLang:dword; SizeInBits:UInt64; AlignInBits:UInt32; 
         Flags:LLVMDIFlags; UniqueIdentifier:Pchar; UniqueIdentifierLen:size_t):LLVMMetadataRef; LibLLVM;
function LLVMDIBuilderCreateBitFieldMemberType(Builder:LLVMDIBuilderRef; Scope:LLVMMetadataRef; Name:Pchar; NameLen:size_t; &File:LLVMMetadataRef; 
         LineNumber:dword; SizeInBits:UInt64; OffsetInBits:UInt64; StorageOffsetInBits:UInt64; Flags:LLVMDIFlags; 
         _Type:LLVMMetadataRef):LLVMMetadataRef; LibLLVM;
function LLVMDIBuilderCreateClassType(Builder:LLVMDIBuilderRef; Scope:LLVMMetadataRef; Name:Pchar; NameLen:size_t; &File:LLVMMetadataRef; 
         LineNumber:dword; SizeInBits:UInt64; AlignInBits:UInt32; OffsetInBits:UInt64; Flags:LLVMDIFlags; 
         DerivedFrom:LLVMMetadataRef; Elements:PLLVMMetadataRef; NumElements:dword; VTableHolder:LLVMMetadataRef; TemplateParamsNode:LLVMMetadataRef; 
         UniqueIdentifier:Pchar; UniqueIdentifierLen:size_t):LLVMMetadataRef; LibLLVM;
function LLVMDIBuilderCreateArtificialType(Builder:LLVMDIBuilderRef; _Type:LLVMMetadataRef):LLVMMetadataRef; LibLLVM;
function LLVMDITypeGetName(DType:LLVMMetadataRef; Length:Psize_t):PChar; LibLLVM;
function LLVMDITypeGetSizeInBits(DType:LLVMMetadataRef):UInt64; LibLLVM;
function LLVMDITypeGetOffsetInBits(DType:LLVMMetadataRef):UInt64; LibLLVM;
function LLVMDITypeGetAlignInBits(DType:LLVMMetadataRef):UInt32; LibLLVM;
function LLVMDITypeGetLine(DType:LLVMMetadataRef):dword; LibLLVM;
function LLVMDITypeGetFlags(DType:LLVMMetadataRef):LLVMDIFlags; LibLLVM;
function LLVMDIBuilderGetOrCreateSubrange(Builder:LLVMDIBuilderRef; LowerBound:Int64; Count:Int64):LLVMMetadataRef; LibLLVM;
function LLVMDIBuilderGetOrCreateArray(Builder:LLVMDIBuilderRef; Data:PLLVMMetadataRef; NumElements:size_t):LLVMMetadataRef; LibLLVM;
function LLVMDIBuilderCreateExpression(Builder:LLVMDIBuilderRef; Addr:PUInt64; Length:size_t):LLVMMetadataRef; LibLLVM;
function LLVMDIBuilderCreateConstantValueExpression(Builder:LLVMDIBuilderRef; Value:UInt64):LLVMMetadataRef; LibLLVM;
function LLVMDIBuilderCreateGlobalVariableExpression(Builder:LLVMDIBuilderRef; Scope:LLVMMetadataRef; Name:Pchar; NameLen:size_t; Linkage:Pchar; 
         LinkLen:size_t; &File:LLVMMetadataRef; LineNo:dword; Ty:LLVMMetadataRef; LocalToUnit:LLVMBool; 
         Expr:LLVMMetadataRef; Decl:LLVMMetadataRef; AlignInBits:UInt32):LLVMMetadataRef; LibLLVM;
function LLVMDIGlobalVariableExpressionGetVariable(GVE:LLVMMetadataRef):LLVMMetadataRef; LibLLVM;
function LLVMDIGlobalVariableExpressionGetExpression(GVE:LLVMMetadataRef):LLVMMetadataRef; LibLLVM;
function LLVMDIVariableGetFile(_Var:LLVMMetadataRef):LLVMMetadataRef; LibLLVM;
function LLVMDIVariableGetScope(_Var:LLVMMetadataRef):LLVMMetadataRef; LibLLVM;
function LLVMDIVariableGetLine(_Var:LLVMMetadataRef):dword; LibLLVM;
function LLVMTemporaryMDNode(Ctx:LLVMContextRef; Data:PLLVMMetadataRef; NumElements:size_t):LLVMMetadataRef; LibLLVM;
procedure LLVMDisposeTemporaryMDNode(TempNode:LLVMMetadataRef); LibLLVM;
procedure LLVMMetadataReplaceAllUsesWith(TempTargetMetadata:LLVMMetadataRef; Replacement:LLVMMetadataRef); LibLLVM;
function LLVMDIBuilderCreateTempGlobalVariableFwdDecl(Builder:LLVMDIBuilderRef; Scope:LLVMMetadataRef; Name:Pchar; NameLen:size_t; Linkage:Pchar; 
         LnkLen:size_t; &File:LLVMMetadataRef; LineNo:dword; Ty:LLVMMetadataRef; LocalToUnit:LLVMBool; 
         Decl:LLVMMetadataRef; AlignInBits:UInt32):LLVMMetadataRef; LibLLVM;
function LLVMDIBuilderInsertDeclareBefore(Builder:LLVMDIBuilderRef; Storage:LLVMValueRef; VarInfo:LLVMMetadataRef; Expr:LLVMMetadataRef; DebugLoc:LLVMMetadataRef; 
         Instr:LLVMValueRef):LLVMValueRef; LibLLVM;
function LLVMDIBuilderInsertDeclareAtEnd(Builder:LLVMDIBuilderRef; Storage:LLVMValueRef; VarInfo:LLVMMetadataRef; Expr:LLVMMetadataRef; DebugLoc:LLVMMetadataRef; 
         Block:LLVMBasicBlockRef):LLVMValueRef; LibLLVM;
function LLVMDIBuilderInsertDbgValueBefore(Builder:LLVMDIBuilderRef; Val:LLVMValueRef; VarInfo:LLVMMetadataRef; Expr:LLVMMetadataRef; DebugLoc:LLVMMetadataRef; 
         Instr:LLVMValueRef):LLVMValueRef; LibLLVM;
function LLVMDIBuilderInsertDbgValueAtEnd(Builder:LLVMDIBuilderRef; Val:LLVMValueRef; VarInfo:LLVMMetadataRef; Expr:LLVMMetadataRef; DebugLoc:LLVMMetadataRef; 
         Block:LLVMBasicBlockRef):LLVMValueRef; LibLLVM;
function LLVMDIBuilderCreateAutoVariable(Builder:LLVMDIBuilderRef; Scope:LLVMMetadataRef; Name:Pchar; NameLen:size_t; &File:LLVMMetadataRef; 
         LineNo:dword; Ty:LLVMMetadataRef; AlwaysPreserve:LLVMBool; Flags:LLVMDIFlags; AlignInBits:UInt32):LLVMMetadataRef; LibLLVM;
function LLVMDIBuilderCreateParameterVariable(Builder:LLVMDIBuilderRef; Scope:LLVMMetadataRef; Name:Pchar; NameLen:size_t; ArgNo:dword; 
         &File:LLVMMetadataRef; LineNo:dword; Ty:LLVMMetadataRef; AlwaysPreserve:LLVMBool; Flags:LLVMDIFlags):LLVMMetadataRef; LibLLVM;
function LLVMGetSubprogram(Func:LLVMValueRef):LLVMMetadataRef; LibLLVM;
procedure LLVMSetSubprogram(Func:LLVMValueRef; SP:LLVMMetadataRef); LibLLVM;
function LLVMDISubprogramGetLine(Subprogram:LLVMMetadataRef):dword; LibLLVM;
function LLVMInstructionGetDebugLoc(Inst:LLVMValueRef):LLVMMetadataRef; LibLLVM;
procedure LLVMInstructionSetDebugLoc(Inst:LLVMValueRef; Loc:LLVMMetadataRef); LibLLVM;
function LLVMGetMetadataKind(Metadata:LLVMMetadataRef):LLVMMetadataKind; LibLLVM;

implementation

end.
