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

type
  LLVMBool = boolean;
  LLVMOpaqueType = pointer;
  LLVMMemoryBufferRef = type LLVMOpaqueType;
  LLVMContextRef = type LLVMOpaqueType;
  LLVMModuleRef = type LLVMOpaqueType;
  LLVMTypeRef = type LLVMOpaqueType;
  LLVMValueRef = type LLVMOpaqueType;
  LLVMBasicBlockRef = type LLVMOpaqueType;
  LLVMMetadataRef = type LLVMOpaqueType;
  LLVMNamedMDNodeRef = type LLVMOpaqueType;
  LLVMValueMetadataEntry = type LLVMOpaqueType;
  LLVMBuilderRef = type LLVMOpaqueType;
  LLVMDIBuilderRef = type LLVMOpaqueType;
  LLVMModuleProviderRef = type LLVMOpaqueType;
  LLVMPassManagerRef = type LLVMOpaqueType;
  LLVMPassRegistryRef = type LLVMOpaqueType;
  LLVMUseRef = type LLVMOpaqueType;
  LLVMAttributeRef = type LLVMOpaqueType;
  LLVMDiagnosticInfoRef = type LLVMOpaqueType;
  LLVMComdatRef = type LLVMOpaqueType;
  LLVMModuleFlagEntry = type LLVMOpaqueType;
  LLVMJITEventListenerRef = type LLVMOpaqueType;
  LLVMBinaryRef = type LLVMOpaqueType;

type
  PLLVMAttributeRef  = ^LLVMAttributeRef;
  PLLVMBasicBlockRef  = ^LLVMBasicBlockRef;
  PLLVMBool  = ^LLVMBool;
  PLLVMMemoryBufferRef  = ^LLVMMemoryBufferRef;
  PLLVMMetadataRef  = ^LLVMMetadataRef;
  PLLVMModuleFlagEntry  = ^LLVMModuleFlagEntry;
  PLLVMTypeRef  = ^LLVMTypeRef;
  PLLVMValueMetadataEntry  = ^LLVMValueMetadataEntry;
  PLLVMValueRef  = ^LLVMValueRef;
  PLLVMModuleRef  = ^LLVMModuleRef;

type
  PUInt64  = ^UInt64;