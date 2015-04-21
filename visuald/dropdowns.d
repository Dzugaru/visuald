module visuald.dropdowns;

import visuald.comutil;
import sdk.vsi.textmgr;
import visuald.pkgutil;

class DropdownBarClient : DComObject, IVsDropdownBarClient
{
	wstring testEntryText = "yay";

	enum ComboIndex
	{
		Types = 0,
		Members = 1
	}

	IVsDropdownBar mDropdownBar;

	this()
	{

	}


	override HRESULT QueryInterface(in IID* riid, void** pvObject)
	{
		if(queryInterface!(IVsDropdownBarClient) (this, riid, pvObject))
			return S_OK;
		return super.QueryInterface(riid, pvObject);
	}

	override HRESULT SetDropdownBar(IVsDropdownBar pDropdownBar) 
	{
		writeToGeneralOutputPane("\nSetDropdownBar");
		this.mDropdownBar = pDropdownBar;
		return S_OK;
	}	

	override HRESULT GetComboAttributes(in int iCombo, ULONG* pcEntries, ULONG* puEntryType, HANDLE* phImageList) 
	{		
		writeToGeneralOutputPane("\nGetComboAttributes");
        *phImageList = null;
		*pcEntries = 3;
		*puEntryType = cast(ULONG)ENTRY_TEXT;        

		//switch (iCombo)
		//{
		//    case ComboIndex.Types:                
		//        break;
		//    case ComboIndex.Members:                
		//        break;
		//}

        return S_OK;
	}

	override HRESULT GetComboTipText(in int iCombo, BSTR* pbstrText) 
	{
		return E_NOTIMPL;
		//*pbstrText = allocBSTR("Blabla");
		//return S_OK;
	}
	
	override HRESULT GetEntryAttributes(in int iCombo,in int iIndex,ULONG* pAttr) 
	{
		*pAttr = cast(ULONG)FONTATTR_PLAIN;
		return S_OK;
	}	

	override HRESULT GetEntryImage(in int iCombo,in int iIndex,int* piImageIndex) 
	{
		return E_NOTIMPL;
	}	

	override HRESULT GetEntryText(in int iCombo, in int iIndex, WCHAR** ppszText) 
	{
		*ppszText = cast(wchar*)testEntryText;
		return S_OK;
	}	

	override HRESULT OnComboGetFocus(in int iCombo) 
	{
		return S_OK;
	}

	override HRESULT OnItemChosen(in int iCombo,in int iIndex) 
	{
		return S_OK;
	}
	
	override HRESULT OnItemSelected(in int iCombo,in int iIndex) 
	{
		return S_OK;
	}
	
	
}
