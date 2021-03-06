if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Zwd_AddFrom]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Zwd_AddFrom]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Zwd_AddWhere]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Zwd_AddWhere]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Zwd_BatchCopy]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Zwd_BatchCopy]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Zwd_BatchCopyHistory]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Zwd_BatchCopyHistory]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Zwd_BatchDeleteHistory]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Zwd_BatchDeleteHistory]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Zwd_CurrentHistory]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Zwd_CurrentHistory]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Zwd_Delete]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Zwd_Delete]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Zwd_DeleteAll]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Zwd_DeleteAll]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Zwd_ErrorMessage]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Zwd_ErrorMessage]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Zwd_ExecuteField]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Zwd_ExecuteField]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Zwd_GetReportData]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Zwd_GetReportData]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Zwd_ParseExpressAndFunction]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Zwd_ParseExpressAndFunction]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Zwd_ParseField]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Zwd_ParseField]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Zwd_PopFirstWord]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Zwd_PopFirstWord]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Zwd_ReportData]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Zwd_ReportData]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Zwd_TransFields]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Zwd_TransFields]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Zwd_TransTables]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Zwd_TransTables]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[flxp_AB01_DELETE]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[flxp_AB01_DELETE]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[flxp_AB01_SAVE]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[flxp_AB01_SAVE]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[flxp_Bank_Requery]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[flxp_Bank_Requery]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[flxp_CheckField]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[flxp_CheckField]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[flxp_CopyStandTable]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[flxp_CopyStandTable]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[flxp_Gs_id]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[flxp_Gs_id]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[flxp_PopFirstWord]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[flxp_PopFirstWord]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[flxp_SQL_Requery]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[flxp_SQL_Requery]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[flxp_code_change]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[flxp_code_change]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[flxp_create_AppTable]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[flxp_create_AppTable]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[flxp_create_condition]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[flxp_create_condition]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[flxp_info_GZBF]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[flxp_info_GZBF]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[flxp_info_bhdeal]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[flxp_info_bhdeal]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[flxp_info_combTable]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[flxp_info_combTable]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[flxp_info_dealformula]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[flxp_info_dealformula]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[flxp_info_formula]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[flxp_info_formula]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[flxp_info_relationFormula]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[flxp_info_relationFormula]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[flxp_info_saveFormula]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[flxp_info_saveFormula]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[flxp_info_updatezc9993]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[flxp_info_updatezc9993]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[flxp_rpt_Copy]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[flxp_rpt_Copy]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[flxp_rpt_Requery]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[flxp_rpt_Requery]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[flxp_rpt_SQLcondition]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[flxp_rpt_SQLcondition]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[flxp_rpt_delete]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[flxp_rpt_delete]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[flxp_rpt_gather]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[flxp_rpt_gather]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[flxp_rpt_rptdealQuery]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[flxp_rpt_rptdealQuery]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[flxp_rpt_sta_back]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[flxp_rpt_sta_back]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[flxp_rpt_stat]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[flxp_rpt_stat]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[flxp_salary_AddAA58]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[flxp_salary_AddAA58]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[flxp_salary_standcompute]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[flxp_salary_standcompute]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[flxp_stand_updateStructure]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[flxp_stand_updateStructure]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[flxp_updateza9999]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[flxp_updateza9999]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[getFirstlevelObject]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[getFirstlevelObject]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[gsp_AddNewUser]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[gsp_AddNewUser]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[gsp_AddScheduleShrink]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[gsp_AddScheduleShrink]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[gsp_Copy_Module]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[gsp_Copy_Module]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[gsp_Copy_SalaryType]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[gsp_Copy_SalaryType]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[gsp_Copy_WebModule]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[gsp_Copy_WebModule]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[gsp_DeleteAllTrigger]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[gsp_DeleteAllTrigger]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[gsp_DeleteSchedule]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[gsp_DeleteSchedule]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[gsp_GetBackupJobInfo]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[gsp_GetBackupJobInfo]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[gsp_GetCurModuleCode]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[gsp_GetCurModuleCode]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[gsp_GetEmailAddress]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[gsp_GetEmailAddress]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[gsp_GetShrinkJobInfo]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[gsp_GetShrinkJobInfo]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[gsp_GetWebCurModuleCode]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[gsp_GetWebCurModuleCode]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[gsp_HisDealOrg]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[gsp_HisDealOrg]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[gsp_InsertLoginLog]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[gsp_InsertLoginLog]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[gsp_NewReceiveData]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[gsp_NewReceiveData]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[gsp_PopFirstWord]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[gsp_PopFirstWord]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[gsp_PopFirstWordbyChar]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[gsp_PopFirstWordbyChar]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[gsp_QuickBackUpDataBase]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[gsp_QuickBackUpDataBase]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[gsp_QuickShrinkDatabase]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[gsp_QuickShrinkDatabase]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[gsp_ReceiveData]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[gsp_ReceiveData]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[gsp_RestoreDatabase]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[gsp_RestoreDatabase]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[gsp_ScheduleBackUp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[gsp_ScheduleBackUp]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[gsp_SetFlowOperate]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[gsp_SetFlowOperate]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[gsp_SetModuleObjectReadOnly]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[gsp_SetModuleObjectReadOnly]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[gsp_UpdateLoginLog]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[gsp_UpdateLoginLog]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[gsp_UpdateSchedule]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[gsp_UpdateSchedule]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[gsp_WebInsertLoginLog]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[gsp_WebInsertLoginLog]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[gsp_WebUpdateLoginLog]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[gsp_WebUpdateLoginLog]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[gsp_associate]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[gsp_associate]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[gsp_changed_trigger]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[gsp_changed_trigger]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[gsp_check_layer_parent]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[gsp_check_layer_parent]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[gsp_check_object]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[gsp_check_object]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[gsp_copy_TableSchema]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[gsp_copy_TableSchema]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[gsp_copy_field]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[gsp_copy_field]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[gsp_create_field]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[gsp_create_field]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[gsp_create_ootable]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[gsp_create_ootable]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[gsp_create_stable]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[gsp_create_stable]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[gsp_create_table]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[gsp_create_table]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[gsp_del_ref_trigger]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[gsp_del_ref_trigger]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[gsp_find_result]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[gsp_find_result]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[gsp_get_associate]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[gsp_get_associate]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[gsp_get_info]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[gsp_get_info]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[gsp_get_infoitem]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[gsp_get_infoitem]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[gsp_get_propertyflag]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[gsp_get_propertyflag]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[gsp_getinfoid]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[gsp_getinfoid]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[gsp_goback_object]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[gsp_goback_object]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[gsp_goback_properties]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[gsp_goback_properties]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[gsp_innercheck]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[gsp_innercheck]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[gsp_innerformula]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[gsp_innerformula]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[gsp_modify_property]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[gsp_modify_property]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[gsp_new_row_position]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[gsp_new_row_position]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[gsp_new_scribble_object]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[gsp_new_scribble_object]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[gsp_new_scribble_property]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[gsp_new_scribble_property]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[gsp_next_id]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[gsp_next_id]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[gsp_object_by_template]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[gsp_object_by_template]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[gsp_plaster_object]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[gsp_plaster_object]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[gsp_plaster_property]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[gsp_plaster_property]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[gsp_reorder_id]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[gsp_reorder_id]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[gsp_row_position]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[gsp_row_position]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[gsp_salaryAdjust]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[gsp_salaryAdjust]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[gsp_secret_table]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[gsp_secret_table]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[gsp_secret_table_c]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[gsp_secret_table_c]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[gsp_seek_data]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[gsp_seek_data]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[gsp_tablecheck]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[gsp_tablecheck]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[gsp_tableformula]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[gsp_tableformula]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Createjianpin]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Createjianpin]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_GetMaxRptNo]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_GetMaxRptNo]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_cellcheck]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_cellcheck]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_tcheck]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_tcheck]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO








/***************************************************************************************** 20020928
1-不分组的情况
	1-生成以主表关键字作关键字的临时表，包括 WHERE 部分过滤，可以顺带处理 2-1
	2-处理列
		1-主表的列，子表的当前记录[ZC9993=1]，以及不用特殊处理的表达式直接 UPDATE 处理
		2-子表的历史记录采用第二个临时表处理
			1-建临时表，不采取过滤措施，如果本身没有过滤条件的话
			2-取得极值[ZA0100]（最大值/最小值，处理历史的最近和最初问题），UPDATE 增量[历史记录]处理
			3-删除极值或者打标记
			4-循环处理 - 2~3
		3-特殊表达式特殊处理
	3-循环处理每列 - 2
2-分组的情况
	1-采用最小分组，以及不用特殊处理的计算式，以建立临时表
	2-在当前临时表里进行第二次最小分组，将分组结果插入该表
	3-循环处理每个分组 - 2
	4-处理平均人数、累计、累计平均
**************************************************************************************************/
CREATE PROCEDURE Zwd_AddFrom
	(
		@strFrom		varchar(8000)			OUTPUT,		-- SQL .. FROM
		@strJoin		varchar(8000)	= " JOIN ",			-- SQL .. JOIN
		@strJoinedTable		varchar(8000)	= "",				-- SQL .. JOIN
		@strOn			varchar(8000)	= "",				-- SQL .. ON
		@strWhere		varchar(8000)			OUTPUT		-- SQL .. WHERE
	)
AS
	SET QUOTED_IDENTIFIER OFF
	
	
	declare @Return_Value		int


--execute Zwd_ErrorMessage @strFrom, "Zwd_AddFrom"


	set @Return_Value = 0

	if(@Return_Value = 0)
	begin
		if(@strFrom IS NULL or @strFrom = "")
			set @strFrom = @strJoinedTable
		else
		begin
			if(charindex(" JOIN "+@strJoinedTable+" ON ", " JOIN "+@strFrom+" ON ") = 0 and charindex(@strJoinedTable, @strFrom) <> 1)
			begin
				set @strFrom = @strFrom + @strJoin + @strJoinedTable
				if(@strOn <> "")
					set @strFrom = @strFrom + " ON " + replace(replace(@strOn,"*=","="),"=*","=")
			end
		end
	end
	else
	begin
		if(@strFrom IS NULL or @strFrom = "")
			set @strFrom = @strJoinedTable
		else
		begin
			if(charindex(","+@strJoinedTable+",", ","+@strFrom+",") = 0)
			begin
				set @strFrom = @strFrom + "," + @strJoinedTable
--
				execute Zwd_AddWhere @strOn, @strWhere output
			end
		end
	end


--execute Zwd_ErrorMessage @strFrom, "Zwd_AddFrom"


	SET QUOTED_IDENTIFIER ON
/*	
*/	
	-- 结束
	RETURN @Return_Value






GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO








/***************************************************************************************** 20020928
1-不分组的情况
	1-生成以主表关键字作关键字的临时表，包括 WHERE 部分过滤，可以顺带处理 2-1
	2-处理列
		1-主表的列，子表的当前记录[ZC9993=1]，以及不用特殊处理的表达式直接 UPDATE 处理
		2-子表的历史记录采用第二个临时表处理
			1-建临时表，不采取过滤措施，如果本身没有过滤条件的话
			2-取得极值[ZA0100]（最大值/最小值，处理历史的最近和最初问题），UPDATE 增量[历史记录]处理
			3-删除极值或者打标记
			4-循环处理 - 2~3
		3-特殊表达式特殊处理
	3-循环处理每列 - 2
2-分组的情况
	1-采用最小分组，以及不用特殊处理的计算式，以建立临时表
	2-在当前临时表里进行第二次最小分组，将分组结果插入该表
	3-循环处理每个分组 - 2
	4-处理平均人数、累计、累计平均
**************************************************************************************************/
CREATE PROCEDURE Zwd_AddWhere
	(
		@strOn			varchar(8000)	= "",				-- SQL .. ON
		@strWhere		varchar(8000)			OUTPUT		-- SQL .. WHERE
	)
AS
	SET QUOTED_IDENTIFIER OFF
	
	
	declare @Return_Value		int


--execute Zwd_ErrorMessage @strWhere, "Zwd_AddWhere"


	set @Return_Value = 0

	if(@strWhere IS NULL or @strWhere = "")
		set @strWhere = @strOn
	else
		set @strWhere = @strWhere + " AND " + @strOn


--execute Zwd_ErrorMessage @strWhere, "Zwd_AddWhere"


	SET QUOTED_IDENTIFIER ON
/*	
*/	
	-- 结束
	RETURN @Return_Value






GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO













/***************************************************************************************** 20020928

	批量复制记录

**************************************************************************************************/
CREATE      PROCEDURE Zwd_BatchCopy
	(
		@InfoId			varchar(4),					-- 对象
		@ZA0100			varchar(8000),					-- 当前对象
		@WholeCondition		varchar(8000)	= ""				-- 条件
	)
AS
	SET QUOTED_IDENTIFIER OFF

	
	-- 执行的返回结果
	declare @Result			int

	declare @strSQL			varchar(8000)

	declare @InfoField		varchar(6)
	declare @strInto		varchar(8000)
	declare @strSelect		varchar(8000)
	declare @strFrom		varchar(8000)
	declare @strTable		varchar(8000)
	declare @strTable1		varchar(8000)
	declare @strTable2		varchar(8000)
	declare @strWhere		varchar(8000)
	declare @strWhere2		varchar(8000)

	declare @Error		varchar(8000)

	
	-- 子表
	if(substring(@InfoId,3,2) <> "01")
	begin

--execute Zwd_ErrorMessage "子表", "Zwd_BatchCopy"
--
--select @Error = "Start=> " + convert(varchar, getdate(), 121)
--execute Zwd_ErrorMessage @Error, "Zwd_BatchCopy"

		-- modi 2003-02-13
--
		--execute gsp_delete_currec_trigger @InfoId
		-- endm

--
		execute Zwd_CurrentHistory @InfoId

		set @strWhere = ""
		if(ISNULL(@WholeCondition,"") <> "")
			set @strWhere = "ZA0100 IN(" + @WholeCondition + ")"


		-- 拼语句
		set @strInto = ""

		set @strSQL = "SELECT InfoField FROM Gs_Property WHERE InfoId='" + @InfoId + "'"
		set @strSQL = "declare CR_Property cursor for " + @strSQL + " open CR_Property"
		exec(@strSQL)
		fetch next from CR_Property into @InfoField
		while(@@fetch_status = 0)
		begin
			-- modi 02-11-02
			--if(upper(@InfoField) <> "ZA0100" and upper(@InfoField) <> upper(@InfoId+"Id") and upper(@InfoField) <> "ZC9995")
			if(upper(@InfoField) <> "ZA0100" and upper(@InfoField) <> upper(@InfoId+"Id") and upper(@InfoField) <> "ZC9995" and upper(@InfoField) <> "ZB9991" and upper(@InfoField) <> "ZB9992")
				set @strInto = @strInto + "," + @InfoField

			fetch next from CR_Property into @InfoField
		end
		close CR_Property
		deallocate CR_Property

		set @strSelect = substring(@strInto, 2, datalength(@strInto)-1)
		set @strInto = "ZA0100," + @InfoId + "Id,ZC9995" + @strInto


		-- 打标记咯
		set @strSQL = "UPDATE " + @InfoId + " SET ZC9995='1'"

--execute Zwd_ErrorMessage @strSQL, "Zwd_BatchCopy"

		exec(@strSQL)

--
--select @Error = "Update=> " + convert(varchar, getdate(), 121)
--execute Zwd_ErrorMessage @Error, "Zwd_BatchCopy"

		-- modi 02-11-02
		--set @strSQL = "UPDATE " + @InfoId + " SET ZC9995='0'"
		--set @strSQL = @strSQL + " WHERE ZA0100<>'" + @ZA0100 + "'"
		set @strSQL = "ZA0100<>'" + @ZA0100 + "'"
		if(@strWhere <> "")
			set @strSQL = @strWhere + " AND " + @strSQL
		set @strWhere = " WHERE " + @strSQL
		set @strSQL = "UPDATE " + @InfoId + " SET ZC9995='0'" + @strWhere
		exec(@strSQL)

--
--select @Error = "Update=> " + convert(varchar, getdate(), 121)
--execute Zwd_ErrorMessage @Error, "Zwd_BatchCopy"

		-- modi 02-11-02
		--set @strTable = "(SELECT ZA0100,ISNULL(MAX(" + @InfoId + "Id),0)+100 AS F,'1' AS F2 FROM " + @InfoId + " WHERE ZC9995='0'"
		--set @strTable = @strTable + " GROUP BY ZA0100) T"
		set @strTable = "(SELECT ZA0100,ISNULL(MAX(" + @InfoId + "Id),0)+100 AS F,'1' AS F2 FROM " + @InfoId + " WHERE ZC9995='0'"
		set @strTable1 = "SELECT ParentId1 FROM Gs_Structure WHERE InfoId='" + @InfoId + "'"

		-- modi 02-11-04
		--set @strTable1 = "OBJECT_ID(" + @strTable1 + ")"
		exec("declare CR_Parent cursor for " + @strTable1 + " open CR_Parent")
		fetch CR_Parent into @strTable1
		close CR_Parent
		deallocate CR_Parent
		-- endm 02-11-04

		set @strWhere = @strWhere + " AND ZA0100 NOT IN(SELECT DISTINCT ZA0100 FROM " + @InfoId + ")"
		set @strTable1 = " UNION SELECT ZA0100,100 AS F,'1' AS F2 FROM " + @strTable1 +  @strWhere
		set @strTable = @strTable + " GROUP BY ZA0100" + @strTable1 + ") T"
		-- endm 02-11-02

		set @strTable2 = "(SELECT " + @strSelect + " FROM " + @InfoId + " WHERE ZA0100='" + @ZA0100 + "' AND ZC9993=1) T2"


		set @strWhere = ""

		set @strFrom = @strTable
--
		execute Zwd_AddFrom @strFrom output, " CROSS JOIN ", @strTable2, "", @strWhere output


		-- 复制
		set @strSQL = "INSERT INTO " + @InfoId + "(" + @strInto + ")" + " SELECT T.*,T2.* FROM "+ @strFrom
		if(@strWhere <> "")
			set @strSQL = @strSQL + " WHERE " + @strWhere

--execute Zwd_ErrorMessage @strSQL, "Zwd_BatchCopy"

		exec(@strSQL)

--
--select @Error = "Insert=> " + convert(varchar, getdate(), 121)
--execute Zwd_ErrorMessage @Error, "Zwd_BatchCopy"

		-- 标记用上了
		--set @strSQL = "UPDATE " + @InfoId + " SET ZC9993=0 WHERE ZC9995='0'"
		--exec(@strSQL)

--
		execute Zwd_CurrentHistory @InfoId

		-- modi 2003-02-13
--
		--execute gsp_create_currec_trigger @InfoId
		-- endm
	end


	SET QUOTED_IDENTIFIER ON
/*	
*/	
	-- 结束
	RETURN 1

OnError:
	RETURN 0










GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO










/***************************************************************************************** 20020928

	批量复制历史记录

**************************************************************************************************/
CREATE    PROCEDURE Zwd_BatchCopyHistory
	(
		@InfoId			varchar(4),					-- 对象
		@MainObject		varchar(4)	= "AA01",			-- 主对象
		@WholeCondition		varchar(8000)	= "",				-- 条件
		@Fields		varchar(8000)	=	""				-- 所选字段
	)
AS
	SET QUOTED_IDENTIFIER OFF

	
	-- 执行的返回结果
	declare @Result			int

	declare @strSQL			varchar(8000)

	declare @InfoField		varchar(6)
	declare @strInto		varchar(8000)
	declare @strSelect		varchar(8000)
	declare @strWhere		varchar(8000)

	
	-- 子表
	if(@InfoId <> @MainObject)
	begin

--execute Zwd_ErrorMessage "子表", "Zwd_BatchCopyHistory"

		-- modi 2003-02-13
--
		--execute gsp_delete_currec_trigger @InfoId
		-- endm

--
		execute Zwd_CurrentHistory @InfoId

		set @strWhere = ""
		if(ISNULL(@WholeCondition,"") <> "")
			set @strWhere = "ZA0100 IN(" + @WholeCondition + ")"


		-- 拼语句
		set @strInto = ""

		--
		if(@Fields = "")
		begin
			set @strSQL = "SELECT InfoField FROM Gs_Property WHERE InfoId='" + @InfoId + "'"
			set @strSQL = "declare CR_Property cursor for " + @strSQL + " open CR_Property"
			exec(@strSQL)
			fetch next from CR_Property into @InfoField
			while(@@fetch_status = 0)
			begin
				-- add 02-11-02
				if(upper(@InfoField) <> "ZB9991" and upper(@InfoField) <> "ZB9992")
					set @strInto = @strInto + "," + @InfoField

				fetch next from CR_Property into @InfoField
			end
			close CR_Property
			deallocate CR_Property

			set @strInto = substring(@strInto, 2, datalength(@strInto)-1)
		end
		-- add 2003-05-09
		else
		begin
			set @strInto = "ZA0100," + @InfoId + "Id,ZC9995," + @Fields
		end
		-- enda

		set @strSelect = replace(replace(@strInto,@InfoId+"Id",@InfoId+"Id+100"), "ZC9995", "'1'")


		-- 打标记咯
		set @strSQL = "UPDATE " + @InfoId + " SET ZC9995='0'"
		exec(@strSQL)

--
		execute Zwd_AddWhere "ZC9993=1", @strWhere output

		-- 复制
		set @strSQL = "INSERT INTO " + @InfoId + "(" + @strInto + ")" + " SELECT " + @strSelect + " FROM "+ @InfoId + " WHERE " + @strWhere

		exec(@strSQL)

--execute Zwd_ErrorMessage @strSQL, "Zwd_BatchCopyHistory"

		-- 标记用上了
		--set @strSQL = "UPDATE " + @InfoId + " SET ZC9993=0 WHERE ZC9995='0'"
		--exec(@strSQL)

--
		execute Zwd_CurrentHistory @InfoId

		-- modi 2003-02-13
--
		--execute gsp_create_currec_trigger @InfoId
		-- endm
	end


	SET QUOTED_IDENTIFIER ON
/*	
*/	
	-- 结束
	RETURN 1

OnError:
	RETURN 0









GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO











/***************************************************************************************** 20020928

	批量删除历史记录

**************************************************************************************************/
CREATE      PROCEDURE Zwd_BatchDeleteHistory
	(
		@InfoId			varchar(4),					-- 对象
		@MainObject		varchar(4)	= "AA01",			-- 主对象
		@Num			int		= 0,				-- 历史个数
		@Style			varchar(1)	= "0",				-- 历史检索方式
		@ConSQL			varchar(8000)	= "",				-- 历史条件
		@WholeCondition		varchar(8000)	= ""				-- 条件
	)
AS
	SET QUOTED_IDENTIFIER OFF

	
	-- 执行的返回结果
	declare @Result			int

	declare @strSQL			varchar(8000)
	declare @strSQLSetMain		varchar(8000)
	declare @strSQLSetChild		varchar(8000)

	declare @strGroupCondition	varchar(8000)
	declare @strFrom		varchar(8000)
	declare @strWhere		varchar(8000)
	declare @astrWhere		varchar(8000)

	declare @aNum			int
	declare @aOne			int
	declare @aMax			varchar(4)

	
	-- 子表
	if(@InfoId <> @MainObject)
	begin
		-- modi 2003-02-13
--
		--execute gsp_delete_currec_trigger @InfoId
		-- endm

--execute Zwd_ErrorMessage "子表", "Zwd_BatchDeleteHistory"

		set @strFrom = ""
		-- modi 02-11-04
		--set @strWhere = ""
		set @strWhere = "1=1"
		if(ISNULL(@WholeCondition,"") <> "")
			-- modi 2003-02-13
			--set @strWhere = "ZA0100 IN(" + @WholeCondition + ")"
			set @strWhere = @InfoId + ".ZA0100 IN(" + @WholeCondition + ")"
			-- endm

		-- add 2003-01-21
		/*
		if(ISNULL(@ConSQL,"") <> "")
			-- modi 2003-02-13
			--set @ConSQL = "ZA0100 IN(" + @ConSQL + ")"
			set @ConSQL = @InfoId + ".ZA0100 IN(" + @ConSQL + ")"
			-- endm
		*/
		-- enda

		-- 无历史
		if(@Num = 0)
		begin

--execute Zwd_ErrorMessage "当前记录", "Zwd_BatchDeleteHistory"

--
			execute Zwd_AddWhere "ZC9993=1", @strWhere output

			set @strSQL = "DELETE FROM " + @InfoId + " WHERE " + @strWhere

			exec(@strSQL)
		end
		-- 条件
		else if(@Num = 9999)
		begin

--execute Zwd_ErrorMessage "条件", "Zwd_BatchDeleteHistory"

			if(@ConSQL <> "" and @ConSQL <> NULL)
--
				execute Zwd_AddWhere @ConSQL, @strWhere output

			-- add 2003-05-16
			if(@Style = "5")
--
				execute Zwd_AddWhere "ZC9993=0", @strWhere output
			-- enda

			set @strSQL = "DELETE FROM " + @InfoId + " WHERE " + @strWhere

--execute Zwd_ErrorMessage @strSQL, "Zwd_BatchDeleteHistory"

			exec(@strSQL)
		end
		-- 历史处理
		else
		begin

--execute Zwd_ErrorMessage "历史记录", "Zwd_BatchDeleteHistory"

			if(@Style = "0")
			begin
				set @aOne = 1
				set @aMax = "Max("
			end
			else if(@Style = "1")
			begin
				set @aOne = 0
				set @aMax = "Max("
			end
			else if(@Style = "2")
			begin
				set @aOne = 1
				set @aMax = "Min("
			end
			else if(@Style = "3")
			begin
				set @aOne = 0
				set @aMax = "Min("
			end
			else if(@Style = "4")
			begin
				set @aOne = 0
				set @aMax = "Min("
			end



			set @strGroupCondition = "(SELECT ZA0100," + @aMax + @InfoId + "Id) AS F_Max FROM " + @InfoId + " WHERE ZC9995='0'"
			if(@ConSQL <> "" and @ConSQL <> NULL)
				set @strGroupCondition = @strGroupCondition + " AND (" + @ConSQL + ")"
			set @strGroupCondition = @strGroupCondition + " GROUP BY ZA0100) T_GroupCondition"


			-- modi 2003-05-29
			--set @strSQL = "DELETE " + @InfoId
			set @strSQL = "UPDATE " + @InfoId + " SET ZC9995='2'"
			-- endm


			set @astrWhere = @InfoId + ".ZA0100=T_GroupCondition.ZA0100 AND " + @InfoId + "." + @InfoId + "Id=T_GroupCondition.F_Max"
--
			execute Zwd_AddFrom @strFrom output, " JOIN ", @strGroupCondition, @astrWhere, @strWhere output

--
			execute Zwd_AddWhere @astrWhere, @strWhere output

			set @strSQLSetMain = @strSQL + " FROM " + @strFrom + " WHERE " + @strWhere

			set @strSQLSetChild = "UPDATE " + @InfoId + " SET ZC9995='1' FROM " + @strGroupCondition + " WHERE " + @astrWhere

--execute Zwd_ErrorMessage @strSQLSetMain, "Zwd_BatchDeleteHistory"

			set @strSQL = "UPDATE " + @InfoId + " SET ZC9995='0'"
			exec(@strSQL)


			set @aNum = @Num
			while(@aNum > 0)
			begin
				if(@aOne = 0 or (@aOne = 1 and @aNum = 1))
				begin
					exec(@strSQLSetMain)

					if(@@rowcount = 0)
						break;
				end




				if(@aOne = 1 and @aNum > 1)
				begin
					exec(@strSQLSetChild)

					if(@@rowcount = 0)
						break;
				end

				set @aNum = @aNum - 1
			end
		end

		-- add 2003-05-29
		set @strSQL = "DELETE FROM " + @InfoId + " WHERE ZC9995='2'"
		exec(@strSQL)
		-- enda
	
--
		execute Zwd_CurrentHistory @InfoId

		-- modi 2003-02-13
--
		--execute gsp_create_currec_trigger @InfoId
		-- endm
	end


	SET QUOTED_IDENTIFIER ON
/*	
*/	
	-- 结束
	RETURN 1

OnError:
	RETURN 0








GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO








/***************************************************************************************** 20020928

	谁是当前记录

**************************************************************************************************/
CREATE PROCEDURE Zwd_CurrentHistory
	(
		@InfoId			varchar(4)					-- 对象
	)
AS
	SET QUOTED_IDENTIFIER OFF

	
	-- 执行的返回结果
	declare @Result			int

	declare @strSQL			varchar(8000)
	declare @strFrom		varchar(8000)
	declare @strWhere		varchar(8000)

	
	set @strSQL = "UPDATE " + @InfoId + " SET ZC9993=0"
	exec(@strSQL)


	set @strFrom = "(SELECT ZA0100,MAX(" + @InfoId + "Id) AS F1 FROM " + @InfoId + " GROUP BY ZA0100) AS T1"
	set @strWhere = "T1.ZA0100=" + @InfoId + ".ZA0100 AND T1.F1=" + @InfoId + "." + @InfoId + "Id"


	set @strSQL = "UPDATE " + @InfoId + " SET ZC9993=1" + " FROM " + @strFrom + " WHERE " + @strWhere
	exec(@strSQL)


	SET QUOTED_IDENTIFIER ON
/*	
*/	
	-- 结束
	RETURN 1

OnError:
	RETURN 0






GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO










/***************************************************************************************** 20030113
1-不分组的情况
	1-生成以主表关键字作关键字的临时表，包括 WHERE 部分过滤，可以顺带处理 2-1
	2-处理列
		1-主表的列，子表的当前记录[ZC9993=1]，以及不用特殊处理的表达式直接 UPDATE 处理
		2-子表的历史记录采用第二个临时表处理
			1-建临时表，不采取过滤措施，如果本身没有过滤条件的话
			2-取得极值[ZA0100]（最大值/最小值，处理历史的最近和最初问题），UPDATE 增量[历史记录]处理
			3-删除极值或者打标记
			4-循环处理 - 2~3
		3-特殊表达式特殊处理
	3-循环处理每列 - 2
2-分组的情况
	1-采用最小分组，以及不用特殊处理的计算式，以建立临时表
	2-在当前临时表里进行第二次最小分组，将分组结果插入该表
	3-循环处理每个分组 - 2
	4-处理平均人数、累计、累计平均
**************************************************************************************************/
CREATE   PROCEDURE Zwd_Delete
	(
		@TableName		varchar(8000)					-- 临时表
	)
AS
	SET ANSI_NULL_DFLT_ON ON

	SET QUOTED_IDENTIFIER OFF

	SET NOCOUNT ON

	SET ANSI_WARNINGS OFF

	
	-- SQL 语句
	declare @strSQL			varchar(8000)

	-- add 2003-01-13
	declare	@strSYSOBJECTS	varchar(100)

	set @strSYSOBJECTS = "SYSOBJECTS"
	if(substring(@TableName, 1, 1) = "#")
		set @strSYSOBJECTS = "tempdb.dbo." + @strSYSOBJECTS
	-- enda


	set @strSQL = "IF EXISTS(SELECT * FROM " + @strSYSOBJECTS + " WHERE NAME='" + @TableName + "') DROP TABLE " + @TableName
--
	exec(@strSQL)


	SET ANSI_WARNINGS ON

	SET NOCOUNT OFF

	SET ANSI_NULL_DFLT_ON OFF

	SET QUOTED_IDENTIFIER ON


	RETURN 0








GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO









/***************************************************************************************** 20020928
1-不分组的情况
	1-生成以主表关键字作关键字的临时表，包括 WHERE 部分过滤，可以顺带处理 2-1
	2-处理列
		1-主表的列，子表的当前记录[ZC9993=1]，以及不用特殊处理的表达式直接 UPDATE 处理
		2-子表的历史记录采用第二个临时表处理
			1-建临时表，不采取过滤措施，如果本身没有过滤条件的话
			2-取得极值[ZA0100]（最大值/最小值，处理历史的最近和最初问题），UPDATE 增量[历史记录]处理
			3-删除极值或者打标记
			4-循环处理 - 2~3
		3-特殊表达式特殊处理
	3-循环处理每列 - 2
2-分组的情况
	1-采用最小分组，以及不用特殊处理的计算式，以建立临时表
	2-在当前临时表里进行第二次最小分组，将分组结果插入该表
	3-循环处理每个分组 - 2
	4-处理平均人数、累计、累计平均
**************************************************************************************************/
CREATE  PROCEDURE Zwd_DeleteAll
	(
		@TableName		varchar(8000)					-- 临时表
	)
AS
	SET ANSI_NULL_DFLT_ON ON

	SET QUOTED_IDENTIFIER OFF

	SET NOCOUNT ON

	SET ANSI_WARNINGS OFF

	
	-- SQL 语句
	declare @strSQL			varchar(8000)
	declare @TableNameGroup		varchar(8000)
	declare @TableNameOrder		varchar(8000)

	-- add 2003-01-13
	declare	@strSYSOBJECTS	varchar(100)

	set @strSYSOBJECTS = "SYSOBJECTS"
	if(substring(@TableName, 1, 1) = "#")
		set @strSYSOBJECTS = "tempdb.dbo." + @strSYSOBJECTS
	-- enda


	set @TableNameGroup = @TableName + "_Group"
	set @TableNameOrder = @TableName + "_Order"

	set @strSQL = "IF EXISTS(SELECT * FROM " + @strSYSOBJECTS + " WHERE NAME='" + @TableName + "') DROP TABLE " + @TableName
	if(@TableNameGroup <> "")
		set @strSQL = @strSQL + " IF EXISTS(SELECT * FROM " + @strSYSOBJECTS + " WHERE NAME='" + @TableNameGroup + "') DROP TABLE " + @TableNameGroup
	if(@TableNameOrder <> "")
		set @strSQL = @strSQL + " IF EXISTS(SELECT * FROM " + @strSYSOBJECTS + " WHERE NAME='" + @TableNameOrder + "') DROP TABLE " + @TableNameOrder
--
	exec(@strSQL)


	SET ANSI_WARNINGS ON

	SET NOCOUNT OFF

	SET ANSI_NULL_DFLT_ON OFF

	SET QUOTED_IDENTIFIER ON


	RETURN 0







GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO








CREATE PROCEDURE Zwd_ErrorMessage
	(
		@ErrorMessageString	varchar(8000),
		@Owner			varchar(100)	=	""
	)
AS
	SET QUOTED_IDENTIFIER OFF

	print "【" + @Owner + "=>" + @ErrorMessageString + "】"

	SET QUOTED_IDENTIFIER ON

	RETURN






GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO








/***************************************************************************************** 20020928
1-不分组的情况
	1-生成以主表关键字作关键字的临时表，包括 WHERE 部分过滤，可以顺带处理 2-1
	2-处理列
		1-主表的列，子表的当前记录[ZC9993=1]，以及不用特殊处理的表达式直接 UPDATE 处理
		2-子表的历史记录采用第二个临时表处理
			1-建临时表，不采取过滤措施，如果本身没有过滤条件的话
			2-取得极值[ZA0100]（最大值/最小值，处理历史的最近和最初问题），UPDATE 增量[历史记录]处理
			3-删除极值或者打标记
			4-循环处理 - 2~3
		3-特殊表达式特殊处理
	3-循环处理每列 - 2
2-分组的情况
	1-采用最小分组，以及不用特殊处理的计算式，以建立临时表
	2-在当前临时表里进行第二次最小分组，将分组结果插入该表
	3-循环处理每个分组 - 2
	4-处理平均人数、累计、累计平均
**************************************************************************************************/
CREATE PROCEDURE Zwd_ExecuteField
	(
		@InfoId			varchar(4),					-- 对象
		@MainObject		varchar(4),					-- 主对象
		@Object			varchar(4),					-- 关联对象
		@InfoFields		varchar(8000),					-- 字段列
		@Direction		varchar(1),					-- 是否垂直连接
		@Express		varchar(8000),					-- 表达式
		@UseFun			varchar(8000),					-- 函数
		@ExtreMum		varchar(1),					-- 极值
		@ExtreStyle		varchar(1),					-- 极值计算方式
		@Num			int,						-- 历史个数
		@Style			varchar(1),					-- 历史检索方式
		@ConSQL			varchar(8000),					-- 历史条件
		@DataType		int				OUTPUT,		-- 类型
											-- 返回 0-数字 1-字符
		@DataFormat		varchar(8000),					-- 格式
		@ComputeField		varchar(8000)			OUTPUT,		-- 返回计算字段
		@strFrom		varchar(8000)			OUTPUT,		-- SQL .. FROM
		@strWhere		varchar(8000)			OUTPUT,		-- SQL .. WHERE
		@Index			varchar(4),					-- Field Index
		@TableName		varchar(100)					-- 临时表
	)
AS											-- 返回 0-无效 1-有效
	SET QUOTED_IDENTIFIER OFF

	
	-- 执行的返回结果
	declare @Result			int
	declare @strSQL			varchar(8000)
	declare @strSQLSetMain		varchar(8000)
	declare @strSQLSetMain1		varchar(8000)
	declare @strSQLSetChild		varchar(8000)
	declare @strTemp		varchar(8000)
	declare @strGroupCondition	varchar(8000)
	declare @astrFrom		varchar(8000)
	declare @astrWhere		varchar(8000)
	declare @aNum			int
	declare @aOne			int
	declare @aMax			varchar(4)
	declare @DateFormat		varchar(8000)
	declare @NumFormat		varchar(8000)

	declare @AddExLink		int

	
	-- 子表
	if(substring(@InfoId,3,2) <> "01")
	begin

--execute Zwd_ErrorMessage "子表", "Zwd_ExecuteField"

		set @strFrom = @InfoId
		set @strWhere = ""
--
		execute Zwd_TransTables @InfoId, @MainObject, @Object, @strFrom output, @strWhere output, @AddExLink output, 1
--
		execute @Result = Zwd_ParseExpressAndFunction @InfoId,@InfoFields,@Direction,@Express,@UseFun,@DataType output,@DataFormat,@ComputeField output,@strFrom output,@strWhere output,@Index,@MainObject,@Object,1
		-- 字段或表达式有效
		if(@Result <> 0)
		begin
			set @NumFormat = @DataFormat
--
			execute Zwd_PopFirstWord @NumFormat output, @DateFormat output, "|"

			-- 数字
			if(@DataType = 0)
				set @ComputeField = replace(@NumFormat, "@", @ComputeField)
			-- 日期
			else if(@DataType = 2)
			begin
				-- modi 2003-07-10
				--set @ComputeField = replace(@DateFormat, "@", @ComputeField)
				set @ComputeField = replace("CASE WHEN @<>'' THEN "+@DateFormat+" ELSE '' END", "@", @ComputeField)
			end


			-- 无历史
			if(@Num = 0)
			begin

--execute Zwd_ErrorMessage "当前记录", "Zwd_ExecuteField"

				set @strSQL = "UPDATE " + @TableName + " SET F" + @Index + "=" + @ComputeField
				
				if(@AddExLink = 1)
				begin
					set @astrWhere = @Object + ".ZA0100=" + @InfoId + ".ZA0100"
--
					execute Zwd_AddFrom @strFrom output, " JOIN ", @InfoId, @astrWhere, @strWhere output

					set @astrWhere = @MainObject + ".ZA0100=" + @Object + ".ZA0100"
--
					execute Zwd_AddFrom @strFrom output, " JOIN ", @MainObject, @astrWhere, @strWhere output

					set @astrWhere = @TableName + ".ZA0100=" + @MainObject + ".ZA0100 AND " + @InfoId + ".ZC9993=1"
--
					execute Zwd_AddWhere @astrWhere, @strWhere output

					set @astrFrom = @strFrom
					set @astrWhere = " WHERE " + @strWhere
				end
				else
				begin
					set @astrWhere = @TableName + ".ZA0100=" + @InfoId + ".ZA0100 AND " + @InfoId + ".ZC9993=1"
--
					execute Zwd_AddWhere @astrWhere, @strWhere output

					set @astrFrom = @strFrom
					set @astrWhere = " WHERE " + @strWhere
				end


				set @strSQL = @strSQL + " FROM " + @astrFrom + @astrWhere

--execute Zwd_ErrorMessage @strSQL, "Zwd_ExecuteField"

				exec(@strSQL)
			end
			-- 历史处理
			else
			begin

--execute Zwd_ErrorMessage "历史记录", "Zwd_ExecuteField"

				if(@Style = "0")
				begin
					set @aOne = 1
					set @aMax = "Max("
				end
				else if(@Style = "1")
				begin
					set @aOne = 0
					set @aMax = "Max("
				end
				else if(@Style = "2")
				begin
					set @aOne = 1
					set @aMax = "Min("
				end
				else if(@Style = "3")
				begin
					set @aOne = 0
					set @aMax = "Min("
				end
				else if(@Style = "4")
				begin
					set @aOne = 0
					set @aMax = "Min("
				end



				--set @strGroupCondition = "(SELECT ZA0100," + @aMax + @InfoId + "Id) AS F_Max FROM " + @InfoId + " WHERE StandByInt=0"
				set @strGroupCondition = "(SELECT ZA0100," + @aMax + @InfoId + "Id) AS F_Max FROM " + @InfoId + " WHERE ZC9995='0'"
				if(@ConSQL <> "" and @ConSQL <> NULL)
					set @strGroupCondition = @strGroupCondition + " AND (" + @ConSQL + ")"
				set @strGroupCondition = @strGroupCondition + " GROUP BY ZA0100) T_GroupCondition"


				if(@aMax = "Max(")
					set @strSQL = "UPDATE " + @TableName + " SET F" + @Index + "=ISNULL(" + @ComputeField + ",'')+CHAR(13)+CHAR(10)+F" + @Index
				else
					set @strSQL = "UPDATE " + @TableName + " SET F" + @Index + "=F" + @Index + "+CHAR(13)+CHAR(10)+ISNULL(" + @ComputeField + ",'')"

				set @strTemp = "UPDATE " + @TableName + " SET F" + @Index + "=ISNULL(" + @ComputeField + ",'')"


				if(@AddExLink = 1)
				begin
					set @astrWhere = @Object + ".ZA0100=" + @InfoId + ".ZA0100"
--
					execute Zwd_AddFrom @strFrom output, " JOIN ", @InfoId, @astrWhere, @strWhere output

					set @astrWhere = @InfoId + ".ZA0100=T_GroupCondition.ZA0100 AND " + @InfoId + "." + @InfoId + "Id=T_GroupCondition.F_Max"
--
					execute Zwd_AddFrom @strFrom output, " JOIN ", @strGroupCondition, @astrWhere, @strWhere output

					set @astrWhere = @MainObject + ".ZA0100=" + @Object + ".ZA0100"
--
					execute Zwd_AddFrom @strFrom output, " JOIN ", @MainObject, @astrWhere, @strWhere output

					set @astrWhere = @TableName + ".ZA0100=" + @MainObject + ".ZA0100"
--
					execute Zwd_AddWhere @astrWhere, @strWhere output

					set @astrFrom = @strFrom
					set @astrWhere = " WHERE " + @strWhere
				end
				else
				begin
					if(@strFrom = "")
						set @strFrom = @InfoId

					set @astrWhere = @InfoId + ".ZA0100=T_GroupCondition.ZA0100 AND " + @InfoId + "." + @InfoId + "Id=T_GroupCondition.F_Max"
--
					execute Zwd_AddFrom @strFrom output, " JOIN ", @strGroupCondition, @astrWhere, @strWhere output

					set @astrWhere = @TableName + ".ZA0100=" + @InfoId + ".ZA0100"
--
					execute Zwd_AddWhere @astrWhere, @strWhere output

					set @astrFrom = @strFrom
					set @astrWhere = " WHERE " + @strWhere
				end


				set @strSQLSetMain = @strSQL + " FROM " + @astrFrom + @astrWhere
				set @strSQLSetMain1 = @strTemp + " FROM " + @astrFrom + @astrWhere

--execute Zwd_ErrorMessage @strSQLSetMain, "Zwd_ExecuteField"

				--set @strSQLSetChild = "UPDATE " + @InfoId + " SET StandByInt=1 FROM " + @strGroupCondition + " WHERE " + @InfoId + ".ZA0100=T_GroupCondition.ZA0100 AND " + @InfoId + "." + @InfoId + "Id=T_GroupCondition.F_Max"
				set @strSQLSetChild = "UPDATE " + @InfoId + " SET ZC9995='1' FROM " + @strGroupCondition + " WHERE " + @InfoId + ".ZA0100=T_GroupCondition.ZA0100 AND " + @InfoId + "." + @InfoId + "Id=T_GroupCondition.F_Max"


				--set @strSQL = "IF NOT EXISTS(SELECT * FROM SYSCOLUMNS T1,SYSOBJECTS T2 WHERE T2.NAME='" + @InfoId + "' AND T1.ID=T2.ID AND T1.NAME='StandByInt') CREATE TABLE " + @InfoId + " ADD StandByInt Int"
				--exec(@strSQL)
				
--				if(@@error <> 0)
--					goto OnError

				--set @strSQL = "UPDATE " + @InfoId + " SET StandByInt=0"
				set @strSQL = "UPDATE " + @InfoId + " SET ZC9995='0'"
				exec(@strSQL)

--				if(@@error <> 0)
--					goto OnError

				set @aNum = @Num
				while(@aNum > 0)
				begin
					if((@aOne = 0 and @aNum = @Num) or (@aOne = 1 and @aNum = 1))
						exec(@strSQLSetMain1)
					else if(@aOne = 0)
						exec(@strSQLSetMain)

--					if(@@error <> 0)
--						goto OnError

					if(@aNum > 1)
						exec(@strSQLSetChild)

--					if(@@error <> 0)
--						goto OnError


					if(@@rowcount = 0)
						break;

					set @aNum = @aNum - 1
				end
			end
		end
/*		-- 特殊表达式和函数 : 不处理
		else
		begin

execute Zwd_ErrorMessage "特殊表达式", "Zwd_ExecuteField"

		end
*/
	end
/*	-- 主表 : 不处理
	else
	begin

execute Zwd_ErrorMessage "主表", "Zwd_ExecuteField"

	end
*/	


	SET QUOTED_IDENTIFIER ON
/*	
*/	
	-- 结束
	RETURN 1

OnError:
	RETURN 0






GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO
















/***************************************************************************************** 20020928
1-不分组的情况
	1-生成以主表关键字作关键字的临时表，包括 WHERE 部分过滤，可以顺带处理 2-1
	2-处理列
		1-主表的列，子表的当前记录[ZC9993=1]，以及不用特殊处理的表达式直接 UPDATE 处理
		2-子表的历史记录采用第二个临时表处理
			1-建临时表，不采取过滤措施，如果本身没有过滤条件的话
			2-取得极值[ZA0100]（最大值/最小值，处理历史的最近和最初问题），UPDATE 增量[历史记录]处理
			3-删除极值或者打标记
			4-循环处理 - 2~3
		3-特殊表达式特殊处理
	3-循环处理每列 - 2
2-分组的情况
	1-采用最小分组，以及不用特殊处理的计算式，以建立临时表
	2-在当前临时表里进行第二次最小分组，将分组结果插入该表
	3-循环处理每个分组 - 2
	4-处理平均人数、累计、累计平均
**************************************************************************************************/
CREATE           PROCEDURE Zwd_GetReportData
	(
		@TypeNo			int		= 1,				-- 类别号
		@RptNo			int		= 1,				-- 报表号
		@SequenceId		int		= 1,				-- 序列号
		@MainObject		varchar(4)	= "AA01",			-- 主对象
		@StartTime		varchar(100)	= "2000-01-01",			-- 数字开始时间
		@EndTime		varchar(100)	= "2001-01-01",			-- 数字结束时间
		@WholeCondition		varchar(8000)	= "",				-- 全表条件
											-- SELECT ZA0100 ...
		@TableName		varchar(8000)	= "Temp_Table"	OUTPUT,		-- 临时表
		@SQL			varchar(8000)	= ""		OUTPUT,		-- SQL
		@Groups			int		= 0		OUTPUT,		-- 分组字段数
		@OrderBy		varchar(8000)	= ""				-- Order by
	)
AS
	SET ANSI_NULL_DFLT_ON ON

	SET QUOTED_IDENTIFIER OFF
--
	SET NOCOUNT ON

	SET ANSI_WARNINGS OFF

	
	-- SQL 语句
	declare @strSQL			varchar(8000)
	declare @strSelect		varchar(8000)
	declare @strInto		varchar(8000)
	declare @strFrom		varchar(8000)
	declare @strWhere		varchar(8000)
	declare @strGroupBy		varchar(8000)
	declare @strOrderBy		varchar(8000)
	declare @strTemp		varchar(8000)
	declare @strTemp2		varchar(8000)
	declare @strTemp3		varchar(8000)
	declare @strTemp4		varchar(8000)
	-- 分组字串
	declare @GroupBy		varchar(8000)
	declare @GroupBy2		varchar(8000)
	declare @GroupBy3		varchar(8000)
	-- 以下为序列项表的东西
	declare @ItemId			int
	declare @InfoId			varchar(10)
	declare @Object			varchar(10)
	declare @InfoFields		varchar(8000)
	declare @Direction		varchar(1)
	declare @ExtreMum		varchar(1)
	declare @ExtreStyle		varchar(1)
	declare @Express		varchar(8000)
	declare @Style			varchar(1)
	declare @Num			int
	declare @DataType		int
	declare @UseFun			varchar(8000)
	declare @ConSQL			varchar(8000)
	declare @DataFormat		varchar(8000)
	-- 执行的返回结果
	declare @Result			int
	declare @Result2		int
	declare @Index			int

	declare @TableNameGroup		varchar(8000)
	declare @TableNameOrder		varchar(8000)
	declare @TableNameOther		varchar(8000)

	
declare		@DebugStart		datetime
declare		@DebugEnd		datetime
set		@DebugStart	=	getdate()
set		@strTemp	=	convert(varchar, @DebugStart, 121)
execute		Zwd_ErrorMessage	@strTemp, "Zwd_GetReportData"


	
	-- 时间处理
	if(@StartTime = "")
		set @StartTime = convert(varchar,datepart(yyyy,@DebugStart)) + "-" + convert(varchar,datepart(mm,@DebugStart)) + "-" + convert(varchar,datepart(dd,@DebugStart))
	if(@EndTime = "")
		set @EndTime = @StartTime
	if(@StartTime > @EndTime)
		set @StartTime = @EndTime
	set @StartTime = "'" + @StartTime + "'"
	set @EndTime = "'" + @EndTime + "'"

--execute Zwd_ErrorMessage @StartTime

	-- 条件处理
	if(@WholeCondition <> "")
		set @WholeCondition = @MainObject + ".ZA0100 IN(" + @WholeCondition + ")"
/*	if(@WholeCondition <> "")
		set @WholeCondition = @WholeCondition + " AND "
	set @WholeCondition = @WholeCondition + @MainObject + ".ZB9991<=CONVERT(DATETIME," + @StartTime + ") AND " + @MainObject + ".ZB9992>=CONVERT(DATETIME," + @EndTime + ")" 
*/
	
	-- 打开序列表	
	set @strSQL = "SELECT ISNULL(GroupBy,''),ISNULL(Groups,0) FROM R902 WHERE Id=" + cast(@SequenceId as varchar)
	set @strSQL = "declare CR_Serial cursor for " + @strSQL + " open CR_Serial"
	exec(@strSQL)
	-- 取得分组字串
	fetch from CR_Serial into @GroupBy, @Groups
	-- 关闭
	close CR_Serial
	deallocate CR_Serial

	-- 特殊处理 GroupBy
	set @GroupBy2 = replace(@GroupBy, ",", "||")
	
	
	-- 打开序列项表
	set @strSQL = "SELECT ItemId,InfoId,InfoFields,Direction,ExtreMum,ExtreStyle,Express,Style"
	set @strSQL = @strSQL + ",CASE WHEN Style<>'4' AND ConSQL='' THEN Num ELSE 9999 END,DataType,UseFun,ConSQL,DataFormat"
	set @strSQL = @strSQL + " FROM R903 WHERE Id=" + cast(@SequenceId as varchar) + "ORDER BY ItemId"
	set @strSQL = "declare CR_SerialItem cursor for " + @strSQL + " open CR_SerialItem"
	exec(@strSQL)
	
	-- 拼 SQL Select 语句
	fetch next from CR_SerialItem into @ItemId,@InfoId,@InfoFields,@Direction,@ExtreMum,@ExtreStyle,@Express,@Style,@Num,@DataType,@UseFun,@ConSQL,@DataFormat
	set @strSelect = ""
	set @strFrom = @MainObject
	set @strWhere = ""
	set @strGroupBy = ""
	set @strOrderBy = ""
	set @Index = 1
	while(@@fetch_status = 0)
	begin

--execute Zwd_ErrorMessage @InfoFields

		set @Object = @InfoId
--
		execute Zwd_PopFirstWord @Object output, @InfoId output, ":"
--
		execute Zwd_ParseField @InfoId,@MainObject,@Object,@InfoFields,@Direction,@Express,@UseFun,@ExtreMum,@ExtreStyle,@Num,@DataType output,@DataFormat,@strTemp output,@strFrom output,@strWhere output,@StartTime,@EndTime,@GroupBy,@GroupBy2 output,@Index
		set @strTemp = @strTemp + " AS F" + cast(@Index as varchar)
		
		if(@strSelect <> "")
		begin
			set @strSelect = @strSelect + ","
		end
			
		set @strSelect = @strSelect + @strTemp
		
--execute Zwd_ErrorMessage @strTemp

		fetch next from CR_SerialItem into @ItemId,@InfoId,@InfoFields,@Direction,@ExtreMum,@ExtreStyle,@Express,@Style,@Num,@DataType,@UseFun,@ConSQL,@DataFormat

		set @Index = @Index + 1
	end
	
	-- 关闭
	close CR_SerialItem

	-- 建临时表
	set @TableNameOther = @TableName
	set @TableNameGroup = ""
	set @TableNameOrder = ""


	if(@strSelect = "")
		goto OnError


	-- 分组加入到 SELECT 中
	if(@GroupBy <> "")
	begin
		set @GroupBy3 = @GroupBy

		set @strTemp = @GroupBy
		set @Result = datalength(@strTemp)
		while(@Result > 0)
		begin
--
			execute @Result = Zwd_PopFirstWord @strTemp output, @InfoFields output, ","

			-- modi 2002-12-28
			set @GroupBy3 = replace(@GroupBy3, @InfoFields, @InfoFields + " AS " + replace(@InfoFields,".","_"))
			--set @GroupBy3 = replace(@GroupBy3, @InfoFields, "CASE ISNULL(" + @InfoFields + ",']') WHEN '' THEN '[空]' END" + " AS " + replace(@InfoFields,".","_"))
			-- endm
		end

		set @strSelect = @GroupBy3 + "," + @strSelect
	end

	set @strSelect = @MainObject + ".ZA0100," + @strSelect

	if(@OrderBy = "")
	begin
		set @strSelect = "CAST(NULL AS VARCHAR) AS FFFF," + @strSelect

		-- add 2003-03-11
		--set @strOrderBy = " ORDER BY " + @MainObject + "." + replace(dbo.associate_propertyset(@MainObject,"",1), ",", "," + @MainObject + ".") + "," + @MainObject + "." + @MainObject + "Id"
		set @strOrderBy = " ORDER BY " + dbo.get_orderby(@MainObject)
		-- enda
	end
	else
	begin
		set @strTemp = @OrderBy
		set @Result = datalength(@strTemp)
		while(@Result > 0)
		begin
--
			execute @Result = Zwd_PopFirstWord @strTemp output, @strTemp2 output, ","
--
			execute Zwd_PopFirstWord @strTemp2 output, @strTemp3 output, "."

			set @Result2 = 1
--
			-- del 2003-02-13
			--execute Zwd_TransTables @strTemp3, @MainObject, @MainObject, @strFrom output, @strWhere output, @Result2 output, @Result2
			-- endd

			-- modi 2003-02-13
			--set @strTemp4 = @strTemp3+".ZA0100="+@MainObject+".ZA0100"
			set @strTemp4 = @strTemp3+".ZA0100="+@MainObject+".ZA0100 AND " + @strTemp3 + ".ZC9993=1"
			-- endm
--
			-- modi 2003-02-13
			--execute Zwd_AddFrom @strFrom output, " JOIN ", @strTemp3, @strTemp4, @strWhere output
			execute Zwd_AddFrom @strFrom output, " LEFT JOIN ", @strTemp3, @strTemp4, @strWhere output
			-- endm
		end
/*
		set @strSelect = "ISNULL(" + replace(@OrderBy, ",", ",'')+'_'+ISNULL(") + ",'') AS FFFF," + @strSelect
*/
		set @strSelect = "CAST(NULL AS VARCHAR) AS FFFF," + @strSelect
		set @strOrderBy = " ORDER BY " + @OrderBy
	end

	-- 语句拼凑
	set @strSelect = " SELECT " + @strSelect
	set @strSelect = char(13) + char(10) + @strSelect

	set @strInto = " INTO " + @TableName
	set @strInto = char(13) + char(10) + @strInto
/*
	if(@strFrom <> "")
		set @strFrom = @MainObject + "," + @strFrom
	else
		set @strFrom = @MainObject
*/	set @strFrom = " FROM " + @strFrom
	set @strFrom = char(13) + char(10) + @strFrom

	if(@strWhere <> "" and @WholeCondition <> "")
		set @strWhere = " WHERE " + @strWhere + " AND " + @WholeCondition
	else if(@strWhere <> "" or @WholeCondition <> "")
		set @strWhere = " WHERE " + @strWhere + @WholeCondition
	if(@strWhere <> "")
		set @strWhere = char(13) + char(10) + @strWhere
/*
	if(@GroupBy <> "")
		set @strGroupBy = " GROUP BY " + @GroupBy + "," + replace(@GroupBy2, "||", ",")

	if(@strGroupBy <> "")
		set @strGroupBy = char(13) + char(10) + @strGroupBy
*/
	set @strSQL = @strSelect + @strInto + @strFrom + @strWhere + @strGroupBy + @strOrderBy
	
--execute Zwd_ErrorMessage @strSQL	

	--set @SQL = @strSQL
	-- 化整为零
	set @SQL = @strSelect + @strInto + @strFrom + @strWhere + @strGroupBy + @strOrderBy
	
	BEGIN TRANSACTION

	-- 太长了？
	--exec("IF EXISTS(SELECT * FROM SYSOBJECTS WHERE NAME='" + @TableName + "') DROP TABLE " + @TableName + " " + @strSQL)
	-- 化整为零
	-- modi 2003-01-13
--
	--exec("IF EXISTS(SELECT * FROM SYSOBJECTS WHERE NAME='" + @TableName + "') DROP TABLE " + @TableName + @strSelect + @strInto + @strFrom + @strWhere + @strGroupBy + @strOrderBy)
	exec("exec Zwd_Delete " + @TableName + @strSelect + @strInto + @strFrom + @strWhere + @strGroupBy + @strOrderBy)
	-- endm

	if(@@error <> 0)
		goto OnError


	-- 分组再分组
	if(@GroupBy <> "")
	begin
		-- 特殊处理 GroupBy
		set @GroupBy2 = replace(@GroupBy, ",", "||")
	
		-- 打开 ????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
		open CR_SerialItem
		-- 拼 SQL Select 语句
		fetch next from CR_SerialItem into @ItemId,@InfoId,@InfoFields,@Direction,@ExtreMum,@ExtreStyle,@Express,@Style,@Num,@DataType,@UseFun,@ConSQL,@DataFormat
		set @strSelect = ""
		set @strFrom = @TableName
		set @strWhere = ""
		set @strGroupBy = ""
		set @Index = 1
		while(@@fetch_status = 0)
		begin
	
--execute Zwd_ErrorMessage @InfoFields
	
			set @Object = @InfoId
--
			execute Zwd_PopFirstWord @Object output, @InfoId output, ":"
--
			execute Zwd_ParseField @InfoId,@MainObject,@Object,@InfoFields,@Direction,@Express,@UseFun,@ExtreMum,@ExtreStyle,@Num,@DataType output,@DataFormat,@strTemp output,@strFrom output,@strWhere output,@StartTime,@EndTime,@GroupBy,@GroupBy2 output,@Index,1,@TableName
			set @strTemp = @strTemp + " AS F" + cast(@Index as varchar)
			
			if(@strSelect <> "")
			begin
				set @strSelect = @strSelect + ","
			end
				
			set @strSelect = @strSelect + @strTemp
			
--execute Zwd_ErrorMessage @strTemp
	
			fetch next from CR_SerialItem into @ItemId,@InfoId,@InfoFields,@Direction,@ExtreMum,@ExtreStyle,@Express,@Style,@Num,@DataType,@UseFun,@ConSQL,@DataFormat
		
			set @strFrom = @TableName
			set @strWhere = ""
	
			set @Index = @Index + 1
		end
		
		-- 关闭 ????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
		close CR_SerialItem



		-- 分组加入到 SELECT 中
		set @GroupBy3 = replace(@GroupBy, ".", "_")

		set @strTemp = replace(@GroupBy, ".", "_")
		set @Result = datalength(@strTemp)
		while(@Result > 0)
		begin
--
			execute @Result = Zwd_PopFirstWord @strTemp output, @InfoFields output, ","

			set @GroupBy3 =replace(@GroupBy3, @InfoFields, @InfoFields + " AS " + @InfoFields)
		end

		set @strSelect = @GroupBy3 + "," + @strSelect


		set @strSelect = " SELECT " + @strSelect
		set @strSelect = char(13) + char(10) + @strSelect
	
		set @TableNameGroup = @TableName + "_Group"
		set @strInto = " INTO " + @TableNameGroup
		set @strInto = char(13) + char(10) + @strInto

		set @strFrom = " FROM " + @TableName
		set @strFrom = char(13) + char(10) + @strFrom

		set @strWhere = ""

		set @strGroupBy = " GROUP BY " + @GroupBy + "," + replace(@GroupBy2, "||", ",")
		set @strGroupBy = replace(@strGroupBy, ".", "_")
		set @strGroupBy = char(13) + char(10) + @strGroupBy
--
		set @SQL = @strSelect + @strInto + @strFrom + @strWhere + @strGroupBy

		-- modi 2003-01-13
		--exec("IF EXISTS(SELECT * FROM SYSOBJECTS WHERE NAME='" + @TableNameGroup + "') DROP TABLE " + @TableNameGroup + @strSelect + @strInto + @strFrom + @strWhere + @strGroupBy)
		exec("exec Zwd_Delete " + @TableNameGroup + @strSelect + @strInto + @strFrom + @strWhere + @strGroupBy)
		-- endm

		set @GroupBy3= @GroupBy
		set @Result = @Groups

		while(@Result > 1)
		begin
			set @strTemp = reverse(@GroupBy2)
--
			execute Zwd_PopFirstWord @strTemp output, @InfoFields output, "||"
			set @strSelect = replace(@strSelect, replace(reverse(@InfoFields),".","_") + " AS F", "'' AS F")
			set @GroupBy2 = reverse(@strTemp)

			set @strTemp = reverse(@GroupBy3)
--
			execute Zwd_PopFirstWord @strTemp output, @InfoFields output, ","
			set @strSelect = replace(@strSelect, replace(reverse(@InfoFields),".","_") + " AS ", "'' AS ")
			set @GroupBy3 = reverse(@strTemp)

			set @strGroupBy = " GROUP BY " + @GroupBy3 + "," + replace(@GroupBy2, "||", ",")
			set @strGroupBy = replace(@strGroupBy, ".", "_")
			set @strGroupBy = char(13) + char(10) + @strGroupBy

			set @strSQL = "INSERT" + @strInto + @strSelect + @strFrom + @strWhere + @strGroupBy
			

--execute Zwd_ErrorMessage @strSQL
		
			-- 太长了？
			--exec(@strSQL)
			-- 化整为零
/**/			exec("INSERT" + @strInto + @strSelect + @strFrom + @strWhere + @strGroupBy)

			set @Result = @Result - 1
		end

		set @TableNameOther = @TableNameGroup

		goto OnEnd
	end
	-- 结束


set		@DebugEnd	=	getdate()
set		@strTemp	=	convert(varchar, @DebugEnd, 121)
execute		Zwd_ErrorMessage	@strTemp, "Zwd_GetReportData"
set		@strTemp	=	cast(datediff(s, @DebugStart, @DebugEnd) as varchar)
execute		Zwd_ErrorMessage	@strTemp, "Zwd_GetReportData"


	-- 打开
	open CR_SerialItem
	-- 每列处理
	fetch next from CR_SerialItem into @ItemId,@InfoId,@InfoFields,@Direction,@ExtreMum,@ExtreStyle,@Express,@Style,@Num,@DataType,@UseFun,@ConSQL,@DataFormat
	set @Index = 1
	while(@@fetch_status = 0)
	begin

--execute Zwd_ErrorMessage @InfoFields

		set @Object = @InfoId
--
		execute Zwd_PopFirstWord @Object output, @InfoId output, ":"

		-- modi 2003-05-27
		/*
		set @ConSQL = replace(@ConSQL, "#数字开始时间", @StartTime)
		set @ConSQL = replace(@ConSQL, "#数字结束时间", @EndTime)
		*/
		set @ConSQL = replace(@ConSQL, "'#数字开始时间'", @StartTime)
		set @ConSQL = replace(@ConSQL, "'#数字截止时间'", @EndTime)
		-- endm

--
		execute Zwd_ExecuteField @InfoId,@MainObject,@Object,@InfoFields,@Direction,@Express,@UseFun,@ExtreMum,@ExtreStyle,@Num,@Style,@ConSQL,@DataType output,@DataFormat,@strTemp output,@strFrom output,@strWhere output,@Index,@TableName

--		if(@@error <> 0)
--			goto OnError


		fetch next from CR_SerialItem into @ItemId,@InfoId,@InfoFields,@Direction,@ExtreMum,@ExtreStyle,@Express,@Style,@Num,@DataType,@UseFun,@ConSQL,@DataFormat
		set @Index = @Index + 1

/*
set		@DebugEnd	=	getdate()
set		@strTemp	=	convert(varchar, @DebugEnd, 121)
execute		Zwd_ErrorMessage	@strTemp, "Zwd_GetReportData"
set		@strTemp	=	cast(datediff(s, @DebugStart, @DebugEnd) as varchar)
execute		Zwd_ErrorMessage	@strTemp, "Zwd_GetReportData"
*/
	end

	-- 关闭
	close CR_SerialItem


OnEnd:
	deallocate CR_SerialItem

	COMMIT TRANSACTION


	-- 数据返回
	set @TableName = "SELECT * FROM " + @TableNameOther
	if(@GroupBy <> "")
		set @TableName = @TableName + " ORDER BY " + replace(@GroupBy, ".", "_")
--	else if(@OrderBy <>"")
--		set @TableName = @TableName + " ORDER BY FFFF"


--	set @TableName = @TableName + " " + @strSQL


set		@DebugEnd	=	getdate()
set		@strTemp	=	convert(varchar, @DebugEnd, 121)
execute		Zwd_ErrorMessage	@strTemp, "Zwd_GetReportData"
set		@strTemp	=	cast(datediff(s, @DebugStart, @DebugEnd) as varchar)
execute		Zwd_ErrorMessage	@strTemp, "Zwd_GetReportData"


	SET ANSI_WARNINGS ON

	SET NOCOUNT OFF

	SET ANSI_NULL_DFLT_ON OFF

	SET QUOTED_IDENTIFIER ON
/*	
*/	
	-- 结束
	RETURN 1

OnError:

	deallocate CR_SerialItem

	ROLLBACK TRANSACTION


	SET ANSI_WARNINGS ON

	SET NOCOUNT OFF

	SET ANSI_NULL_DFLT_ON OFF

	SET QUOTED_IDENTIFIER ON


	RETURN 0













GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO













/***************************************************************************************** 20020928
1-不分组的情况
	1-生成以主表关键字作关键字的临时表，包括 WHERE 部分过滤，可以顺带处理 2-1
	2-处理列
		1-主表的列，子表的当前记录[ZC9993=1]，以及不用特殊处理的表达式直接 UPDATE 处理
		2-子表的历史记录采用第二个临时表处理
			1-建临时表，不采取过滤措施，如果本身没有过滤条件的话
			2-取得极值[ZA0100]（最大值/最小值，处理历史的最近和最初问题），UPDATE 增量[历史记录]处理
			3-删除极值或者打标记
			4-循环处理 - 2~3
		3-特殊表达式特殊处理
	3-循环处理每列 - 2
2-分组的情况
	1-采用最小分组，以及不用特殊处理的计算式，以建立临时表
	2-在当前临时表里进行第二次最小分组，将分组结果插入该表
	3-循环处理每个分组 - 2
	4-处理平均人数、累计、累计平均
**************************************************************************************************/
CREATE      PROCEDURE Zwd_ParseExpressAndFunction
	(
		@InfoId			varchar(4),					-- 对象
		@InfoFields		varchar(8000),					-- 字段列
		@Direction		varchar(1),					-- 是否垂直连接
		@Express		varchar(8000),					-- 表达式
		@UseFun			varchar(8000),					-- 函数
		@DataType		int				OUTPUT,		-- 类型
											-- 返回 0-数字 1-字符
		@DataFormat		varchar(8000),					-- 格式
		@ComputeField		varchar(8000)			OUTPUT,		-- 返回计算字段
		@strFrom		varchar(8000)			OUTPUT,		-- SQL .. FROM
		@strWhere		varchar(8000)			OUTPUT,		-- SQL .. WHERE
		@FieldIndex		varchar(4),					-- Field Index
		@MainObject		varchar(4),					-- 主对象
		@Object			varchar(4),					-- 对象
		@Child			int		=	0,			-- 是否操作子表
		@strGroupBy		varchar(8000)	=	''		-- 分组字段 add 2003-01-13
	)
AS											-- 返回 0-无效 1-有效
	SET QUOTED_IDENTIFIER OFF

	
	-- 字段列和字段
	declare @aInfoFields		varchar(8000)
	declare @aInfoField		varchar(8000)
	-- 字段索引
	declare @Index			int
	-- 执行的返回结果
	declare @Result			int
	declare @strTemp		varchar(8000)
	

--execute Zwd_ErrorMessage @InfoFields, "Zwd_ParseExpressAndFunction"


	if(@InfoId = null or @InfoId = "")
	begin
		set @DataType = 0
		RETURN 0
	end
	
	
	if((@Direction="1" and charindex("|",@InfoFields)>0) or (@Direction="0" and charindex(char(34),@Express)>0) or charindex("子串",@UseFun)=1)
		set @Result = 1
	else
		set @Result = -1
--
	-- 转换，并且取得返回值类型
	-- modi 2003-01-13
	--execute @Datatype = Zwd_TransFields @InfoId, @InfoFields, @aInfoFields output, @DataFormat, @strFrom output, @strWhere output, @FieldIndex, @MainObject, @Object, @Child, @Result
	execute @Datatype = Zwd_TransFields @InfoId, @InfoFields, @aInfoFields output, @DataFormat, @strFrom output, @strWhere output, @FieldIndex, @MainObject, @Object, @Child, @Result, @strGroupBy
	-- endm

--execute Zwd_ErrorMessage @strFrom, "Zwd_ParseExpressAndFunction"

	-- 如果子表，立即返回，为的是返回数据类型
	if(substring(@InfoId,3,2) <> "01" and @Child = 0)
		RETURN 1


	set @ComputeField = @aInfoFields


	-- 垂直处理
	if(charindex("|", @InfoFields) > 0 and @Direction = "1")
	begin

--execute Zwd_ErrorMessage "垂直处理", "Zwd_ParseExpressAndFunction"

		set @ComputeField = "ISNULL(" + replace(@aInfoFields, "|", ",'')+CHAR(13)+CHAR(10)+ISNULL(") + ",'')"
	end
	-- 表达式
	else if(charindex("|", @InfoFields) > 0 and @Direction = "0" and @Express <> "")
	begin

--execute Zwd_ErrorMessage "表达式", "Zwd_ParseExpressAndFunction"

		set @ComputeField = @Express
		
		set @strTemp = @aInfoFields

		set @Result = datalength(@strTemp)
		set @Index = 1
		while(@Result > 0)
		begin
--
			execute @Result = Zwd_PopFirstWord @strTemp output, @aInfoField output, "|"
			set @ComputeField = replace(@ComputeField, "["+cast(@Index as varchar)+"]", @aInfoField)

			set @Index = @Index + 1
		end
	end
	-- 函数
	else if(charindex("|", @InfoFields) = 0 and @UseFun <> "")
	begin

--execute Zwd_ErrorMessage "函数", "Zwd_ParseExpressAndFunction"

		set @strTemp = upper(substring(ltrim(@UseFun), 1, 2))
		if(@strTemp = "子串")
		begin
			set @strTemp = @UseFun
--
			execute Zwd_PopFirstWord @strTemp output, @aInfoField output, "]"
			set @ComputeField = "SUBSTRING(" + @aInfoFields + @strTemp
		end
		else if(@strTemp = "II")
		begin
			set @strTemp = @UseFun
--
			execute Zwd_PopFirstWord @strTemp output, @aInfoField output, "]"
			set @ComputeField = "IIF(" + @aInfoFields + @strTemp
		end

		else if(@strTemp = "CA")
		begin
			set @strTemp = @UseFun
--
			execute Zwd_PopFirstWord @strTemp output, @aInfoField output, "]"
			set @ComputeField = "CASE " + @aInfoFields + @strTemp
		end
		else if(@strTemp = "年限")
		begin
			set @ComputeField = "DATEDIFF(YEAR,CAST(" + @aInfoFields + " AS DATETIME),GETDATE())"
			set @DataType = 0
		end
		else if(@strTemp = "工龄")
		begin
			set @ComputeField = "DATEDIFF(YEAR,CAST(" + @aInfoFields + " AS DATETIME),GETDATE())+1"
			set @DataType = 0
		end
		else
		begin
			-- 不能处理者
			RETURN 0
		end
	end
	


--execute Zwd_ErrorMessage @ComputeField, "Zwd_ParseExpressAndFunction"


	SET QUOTED_IDENTIFIER ON
/*	
*/	
	-- 结束
	RETURN 1











GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

















/***************************************************************************************** 20021011
1-不分组的情况
	1-生成以主表关键字作关键字的临时表，包括 WHERE 部分过滤，可以顺带处理 2-1
	2-处理列
		1-主表的列，子表的当前记录[ZC9993=1]，以及不用特殊处理的表达式直接 UPDATE 处理
		2-子表的历史记录采用第二个临时表处理
			1-建临时表，不采取过滤措施，如果本身没有过滤条件的话
			2-取得极值[ZA0100]（最大值/最小值，处理历史的最近和最初问题），UPDATE 增量[历史记录]处理
			3-删除极值或者打标记
			4-循环处理 - 2~3
		3-特殊表达式特殊处理
	3-循环处理每列 - 2
2-分组的情况
	1-采用最小分组，以及不用特殊处理的计算式，以建立临时表
	2-在当前临时表里进行第二次最小分组，将分组结果插入该表
	3-循环处理每个分组 - 2
	4-处理平均人数、累计、累计平均
**************************************************************************************************/
CREATE            PROCEDURE Zwd_ParseField
	(
		@InfoId			varchar(4),					-- 对象
		@MainObject		varchar(4),					-- 主对象
		@Object			varchar(4),					-- 关联对象
		@InfoFields		varchar(8000),					-- 字段列
		@Direction		varchar(1),					-- 是否垂直连接
		@Express		varchar(8000),					-- 表达式
		@UseFun			varchar(8000),					-- 函数
		@ExtreMum		varchar(1),					-- 极值
		@ExtreStyle		varchar(1),					-- 极值计算方式
		@Num			int,						-- 历史个数
		@DataType		int				OUTPUT,		-- 类型
											-- 返回 0-数字 1-字符
		@DataFormat		varchar(8000),					-- 格式
		@ComputeField		varchar(8000)			OUTPUT,		-- 返回计算字段
		@strFrom		varchar(8000)			OUTPUT,		-- SQL .. FROM
		@strWhere		varchar(8000)			OUTPUT,		-- SQL .. WHERE
		@StartTime		varchar(100)	= "2000-01-01",			-- 数字开始时间
		@EndTime		varchar(100)	= "2001-01-01",			-- 数字结束时间
		@GroupBy		varchar(8000),					-- 分组字串
		@GroupBy2		varchar(8000)			OUTPUT,		-- 分组字串
		@Index			varchar(4),					-- Field Index
		@ExecuteCompute		int		= 0,				-- 子表是否执行聚合计算
		@MainTableName		varchar(8000)	= ""				-- 主表名称
	)
AS											-- 返回 0-无效 1-有效
	SET QUOTED_IDENTIFIER OFF

	
	-- 执行的返回结果
	declare @Result			int
	declare @DateFormat		varchar(8000)
	declare @NumFormat		varchar(8000)
	declare @Result2		int
	declare @astrFrom		varchar(8000)
	declare @astrWhere		varchar(8000)
	declare @strSQL			varchar(8000)
	declare @TableName		varchar(100)
	declare @InfoFieldOld		varchar(8000)
	declare @InfoFieldNew		varchar(8000)
	
	-- 对冲
	declare @ComputeExecute		int


--execute Zwd_ErrorMessage @InfoFields, "Zwd_ParseField"
	

	set @ComputeExecute = 0

	set @InfoFieldOld = @InfoFields
--
	execute Zwd_PopFirstWord @InfoFieldOld output, @InfoFieldNew output, ":"
	execute Zwd_PopFirstWord @InfoFieldOld output, @InfoFieldNew output, ":"
	set @InfoFieldNew = @InfoId + "." + @InfoFieldNew


	if(charindex(","+@InfoFieldNew+",",","+@GroupBy+",") > 0 or @ExtreMum in("1","2","3","4","5"))
		set @Result = 1
	else
		set @Result = 0

--execute Zwd_ErrorMessage @Result, "Zwd_ParseField"

--
	execute Zwd_TransTables @InfoId, @MainObject, @Object, @strFrom output, @strWhere output, @Result2 output, @Result
--
	-- modi 2003-01-13
	--execute @Result = Zwd_ParseExpressAndFunction @InfoId,@InfoFields,@Direction,@Express,@UseFun,@DataType output,@DataFormat,@ComputeField output,@strFrom output,@strWhere output,@Index,@MainObject,@Object,@Result
	execute @Result = Zwd_ParseExpressAndFunction @InfoId,@InfoFields,@Direction,@Express,@UseFun,@DataType output,@DataFormat,@ComputeField output,@strFrom output,@strWhere output,@Index,@MainObject,@Object,@Result,@GroupBy
	-- endm

--execute Zwd_ErrorMessage @strFrom, "Zwd_ParseField"

	-- 特殊表达式和函数 : 不处理
	if(@Result = 0)
	begin

--execute Zwd_ErrorMessage "特殊表达式", "Zwd_ParseField"

		-- 数字
		if(@DataType = 0)
		begin
			-- 平均人数
			if(@ExtreStyle = "0" and @ExtreMum = "6")
			begin
				if(@ExecuteCompute = 0 or @ComputeExecute = 1)
				begin
					-- modi 2003-01-13
					--set @astrFrom = "SELECT ZA0100,(CASE WHEN ZB9991<=CONVERT(DATETIME," + @StartTime + ") AND ZB9992>=CONVERT(DATETIME," + @StartTime + ") THEN 1 ELSE 0 END) AS F1"
					--set @astrFrom = @astrFrom + ",(CASE WHEN ZB9991<=CONVERT(DATETIME," + @EndTime + ") AND ZB9992>=CONVERT(DATETIME," + @EndTime + ") THEN 1 ELSE 0 END) AS F2"
					set @astrFrom = "SELECT ZA0100,(CASE WHEN DATEDIFF(mm,ISNULL(CAST(ZB9991 AS DATETIME),GetDate()),CONVERT(DATETIME," + @StartTime + "))>=0 AND DATEDIFF(mm,ISNULL(CAST(ZB9992 AS DATETIME),GetDate()),CONVERT(DATETIME," + @StartTime + "))<=0 THEN 1 ELSE 0 END) AS F1"
					set @astrFrom = @astrFrom + ",(CASE WHEN DATEDIFF(mm,ISNULL(CAST(ZB9991 AS DATETIME),GetDate()),CONVERT(DATETIME," + @EndTime + "))>=0 AND DATEDIFF(mm,ISNULL(CAST(ZB9992 AS DATETIME),GetDate()),CONVERT(DATETIME," + @EndTime + "))<=0 THEN 1 ELSE 0 END) AS F2"
					-- endm
					set @astrFrom = @astrFrom + " FROM " + @MainObject
					-- add 2003-03-31
					set @astrFrom = @astrFrom + " WHERE ZC9993=1"
					-- enda
					set @TableName = "##TPersonAvg"
					set @astrFrom = replace(@astrFrom, "F2 FROM", "F2 INTO "+@TableName+" FROM")
					-- modi 2003-01-13
					--exec("IF EXISTS(SELECT * FROM SYSOBJECTS WHERE NAME='" + @TableName + "') DROP TABLE " + @TableName + " " + @astrFrom)
					exec("exec Zwd_Delete " + @TableName + " " + @astrFrom)
					-- endm
					set @astrFrom = @TableName
	
					set @astrWhere = @MainObject + ".ZA0100=##TPersonAvg.ZA0100"
					-- add 2003-01-13
					set @astrWhere = @astrWhere + " AND ##TPersonAvg.F1=1 AND ##TPersonAvg.F2=1"
					-- enda
	
					set @ComputeField = "##TPersonAvg.F1 AS F1_TPersonAvg,##TPersonAvg.F2"

	
--
					-- modi 2003-01-10
					--execute Zwd_AddFrom @strFrom output, " JOIN ", @astrFrom, @astrWhere, @strWhere output
					execute Zwd_AddFrom @strFrom output, " INNER JOIN ", @astrFrom, @astrWhere, @strWhere output
					-- endm

					set @DataType = 1
				end
				else
				begin
					set @ComputeField = "(SUM(F1_TPersonAvg)+SUM(F" + @Index + "))/2"
				end
			end
			else
				set @ComputeField = "CAST(NULL AS NUMERIC(20,2))"
		end
		-- 日期
		else if(@DataType = 2)
			set @ComputeField = "CAST(NULL AS DATETIME)"
		-- 文本
		else
			set @ComputeField = "CAST('' AS VARCHAR(1024))"
	end
	-- 一般表达式和函数
	else if(@Result = 1)
	begin
		-- 主表
		--if(@InfoId = @MainObject)
		if(substring(@InfoId,3,2) = "01")
		begin
	
--execute Zwd_ErrorMessage "主表", "Zwd_ParseField"

			-- 累计 : 不处理
			if(@DataType = 0 and @ExtreStyle <> "0")
			begin

--execute Zwd_ErrorMessage "累计", "Zwd_ParseField"

				set @ComputeField = "CAST(NULL AS NUMERIC(20,2))"
			end
			-- 非累计, 数字
			else if(@DataType = 0 and @GroupBy <> "")
			begin

--execute Zwd_ErrorMessage "非累计的数字计算", "Zwd_ParseField"

				if(@ExecuteCompute = 1)
				begin
					set @ComputeField = "F" + @Index

					if(@ExtreMum = "1")
						set @ComputeField = "CAST(MAX(" + @ComputeField + ") AS NUMERIC(20,2))"
					-- 最小值
					else if(@ExtreMum = "2")
						set @ComputeField = "CAST(MIN(" + @ComputeField + ") AS NUMERIC(20,2))"
					-- 平均值
					else if(@ExtreMum = "3")
						set @ComputeField = "CAST(AVG(" + @ComputeField + ") AS NUMERIC(20,2))"
					-- 中位值
					else if(@ExtreMum = "4")
						set @ComputeField = "CAST((MAX(" + @ComputeField + ")+MIN(" + @ComputeField + "))/2 AS NUMERIC(20,2))"
					-- 求和
					else if(@ExtreMum = "5")
						set @ComputeField = "CAST(SUM(" + @ComputeField + ") AS NUMERIC(20,2))"
				end
			end 
			-- 存在分组中
			else if(charindex(@InfoFieldNew,@GroupBy) > 0)
			begin
				if(@ExecuteCompute = 1)
				begin
					set @ComputeField = "F" + @Index
				-- add 2002-12-28
				--	set @ComputeField = "ISNULL(" + @ComputeField + ",'[空]')"
				-- enda
				end

				set @GroupBy2 = replace(@GroupBy2, @InfoFieldNew, @ComputeField)
			end
			-- 存在分组却不在分组中，太遗憾了……
			else if(@GroupBy <> "")
			begin
				-- 日期
				if(@DataType = 2)
					set @ComputeField = "CAST(NULL AS DATETIME)"
				-- 文本
				else
					set @ComputeField = "CAST('' AS VARCHAR(1024))"
			end
			else if(@ExecuteCompute = 1)
				set @ComputeField = "F" + @Index
--
			-- modi 2002-12-26
			--set @ExecuteCompute = 1
			if(@DataType <> 0)
				set @ExecuteCompute = 1
			-- endm
		end
		-- 子表 : 不处理(但处理分组情况)
		else if(substring(@InfoId,3,2) <> "01")
		begin
	
--execute Zwd_ErrorMessage "子表", "Zwd_ParseField"


			-- 开始处理子表计算问题 - 数据分析表嘛：）

			-- 数字
			if(@DataType = 0  and @ExtreStyle in("0","1","2") and @ExtreMum in("1","2","3","4","5"))
			begin

--execute Zwd_ErrorMessage "累计", "Zwd_ParseField"

				if(@ExecuteCompute = 0)
				begin
					set @ComputeField = "CAST(NULL AS NUMERIC(20,2))"
				end
				else
				begin
					-- 当前
					if(@ExtreStyle = "0")
					begin
						-- modi 2003-03-31
						--set @astrFrom = "SELECT ZA0100," + @ComputeField + " AS F0 FROM " + @InfoId + " WHERE DATEDIFF(mm,ISNULL(CAST(ZB9992 AS DATETIME),GetDate())," + @EndTime + ")=0"
						set @astrFrom = "SELECT ZA0100,SUM(" + @ComputeField + ") AS F0 FROM " + @InfoId + " WHERE DATEDIFF(mm,ISNULL(CAST(ZB9992 AS DATETIME),GetDate())," + @EndTime + ")=0 GROUP BY ZA0100"
						-- endm 次数变月
					end
					-- 累计
					else if(@ExtreStyle = "1")
					begin
						-- modi 2003-03-31
						/*
						set @astrFrom = "(SELECT MAX(F0) FROM (SELECT ZA0100,COUNT(*) AS F0 WHERE DATEDIFF(mm,ISNULL(CAST(ZB9992 AS DATETIME),GetDate())," + @StartTime + ")<=0 AND DATEDIFF(mm,ISNULL(CAST(ZB9992 AS DATETIME),GetDate())," + @EndTime + ")>=0 GROUP BY ZA0100) T0)"
						set @astrFrom = "SELECT ZA0100,SUM(" + @ComputeField + ") AS F0 FROM " + @InfoId + " WHERE DATEDIFF(mm,ISNULL(CAST(ZB9992 AS DATETIME),GetDate())," + @StartTime + ")<=0 AND DATEDIFF(mm,ISNULL(CAST(ZB9992 AS DATETIME),GetDate())," + @EndTime + ")>=0 GROUP BY ZA0100 HAVING COUNT(*)=" + @astrFrom
						*/
						set @astrFrom = "SELECT ZA0100,SUM(" + @ComputeField + ") AS F9 FROM " + @InfoId + " WHERE DATEDIFF(mm,ISNULL(CAST(ZB9992 AS DATETIME),GetDate())," + @StartTime + ")<=0 AND DATEDIFF(mm,ISNULL(CAST(ZB9992 AS DATETIME),GetDate())," + @EndTime + ")>=0 GROUP BY ZA0100,CAST(YEAR(ISNULL(CAST(ZB9992 AS DATETIME),GetDate())) AS VARCHAR)+'-'+CAST(MONTH(ISNULL(CAST(ZB9992 AS DATETIME),GetDate())) AS VARCHAR)"
						set @astrFrom = "SELECT ZA0100,SUM(F9) AS F0 FROM (" + @astrFrom + ") T GROUP BY ZA0100 HAVING COUNT(ZA0100)=DATEDIFF(mm," + @StartTime + "," + @EndTime + ")+1"
						-- endm 次数变月
					end
					-- 累计平均
					else if(@ExtreStyle = "2")
					begin
						-- modi 2003-03-31
						--set @astrFrom = "SELECT ZA0100,AVG(" + @ComputeField + ") AS F0 FROM " + @InfoId + " WHERE DATEDIFF(mm,ISNULL(CAST(ZB9992 AS DATETIME),GetDate())," + @StartTime + ")<=0 AND DATEDIFF(mm,ISNULL(CAST(ZB9992 AS DATETIME),GetDate())," + @EndTime + ")>=0 GROUP BY ZA0100"
						set @astrFrom = "SELECT ZA0100,SUM(" + @ComputeField + ") AS F9 FROM " + @InfoId + " WHERE DATEDIFF(mm,ISNULL(CAST(ZB9992 AS DATETIME),GetDate())," + @StartTime + ")<=0 AND DATEDIFF(mm,ISNULL(CAST(ZB9992 AS DATETIME),GetDate())," + @EndTime + ")>=0 GROUP BY ZA0100,CAST(YEAR(ISNULL(CAST(ZB9992 AS DATETIME),GetDate())) AS VARCHAR)+'-'+CAST(MONTH(ISNULL(CAST(ZB9992 AS DATETIME),GetDate())) AS VARCHAR)"
						set @astrFrom = "SELECT ZA0100,AVG(F9) AS F0 FROM (" + @astrFrom + ") T GROUP BY ZA0100"
						-- endm 次数变月
					end
		
--execute Zwd_ErrorMessage "非累计的数字计算", "Zwd_ParseField"
	
	
					set @TableName = "##Temp_Table_" + @MainObject + "_" + @InfoId + @Index
					set @astrWhere = @TableName + ".ZA0100=" + @MainTableName + ".ZA0100"
	
--execute Zwd_ErrorMessage @astrFrom, "Zwd_ParseField"
	
					set @astrFrom = replace(@astrFrom, "F0 FROM", "F0 INTO "+@TableName+" FROM")
	
--execute Zwd_ErrorMessage @astrFrom, "Zwd_ParseField"
	
					-- modi 2003-01-13
					--exec("IF EXISTS(SELECT * FROM SYSOBJECTS WHERE NAME='" + @TableName + "') DROP TABLE " + @TableName + " " + @astrFrom)
					exec("exec Zwd_Delete " + @TableName + " " + @astrFrom)
					-- endm
					set @astrFrom = @TableName
	
					set @ComputeField = @TableName + ".F0"
	

--
					-- modi 2003-01-10
					--execute Zwd_AddFrom @strFrom output, " JOIN ", @astrFrom, @astrWhere, @strWhere output	
					execute Zwd_AddFrom @strFrom output, " INNER JOIN ", @astrFrom, @astrWhere, @strWhere output	
					-- endm
	

					if(@ComputeExecute <> 1)
					begin
						-- 计算之
						set @strSQL = "UPDATE " + @MainTableName + " SET F" + @Index + "=" + @ComputeField + " FROM " + @strFrom + @strWhere
						exec(@strSQL)

--execute Zwd_ErrorMessage @strSQL, "Zwd_ParseField"
	
						set @ComputeField = "F" + @Index

						-- 最大值
						if(@ExtreMum = "1")
							set @ComputeField = "CAST(MAX(" + @ComputeField + ") AS NUMERIC(20,2))"
						-- 最小值
						else if(@ExtreMum = "2")
							set @ComputeField = "CAST(MIN(" + @ComputeField + ") AS NUMERIC(20,2))"
						-- 平均值
						else if(@ExtreMum = "3")
							set @ComputeField = "CAST(AVG(" + @ComputeField + ") AS NUMERIC(20,2))"
						-- 中位值
						else if(@ExtreMum = "4")
							set @ComputeField = "CAST((MAX(" + @ComputeField + ")+MIN(" + @ComputeField + "))/2 AS NUMERIC(20,2))"
						-- 求和
						else if(@ExtreMum = "5")
							set @ComputeField = "CAST(SUM(" + @ComputeField + ") AS NUMERIC(20,2))"
					end
				end
			end 
			-- 存在分组中
			else if(charindex(@InfoFieldNew,@GroupBy) > 0)
			begin

--execute Zwd_ErrorMessage "子表分组", "Zwd_ParseField"

				-- modi 2003-01-13
				--set @astrWhere = @InfoId + ".ZA0100=" + @Object + ".ZA0100"
--
				--execute Zwd_AddFrom @strFrom output, " JOIN ", @InfoId, @astrWhere, @strWhere output
				set @astrWhere = @InfoId + ".ZA0100=" + @Object + ".ZA0100 AND " + @InfoId + ".ZC9993=1"
				execute Zwd_AddFrom @strFrom output, " INNER JOIN ", @InfoId, @astrWhere, @strWhere output
				-- endm

				if(@ExecuteCompute = 1)
				begin
					set @ComputeField = "F" + @Index
				-- add 2002-12-28
				--	set @ComputeField = "ISNULL(" + @ComputeField + ",'[空]')"
				-- enda
				end

				set @GroupBy2 = replace(@GroupBy2, @InfoFieldNew, @ComputeField)

--execute Zwd_ErrorMessage "子表分组", "Zwd_ParseField"

			end
			-- 子表的非数字型不处理呀！
			else
			begin
				set @ComputeField = "CAST('' AS VARCHAR(1024))"
				set @DataType = 1
			end
		end
	end


	if(@ExecuteCompute = 1)
	begin
		set @NumFormat = @DataFormat
--
		execute Zwd_PopFirstWord @NumFormat output, @DateFormat output, "|"
	
		-- 数字
		if(@DataType = 0)
			set @ComputeField = replace(@NumFormat, "@", @ComputeField)
		-- 日期
		else if(@DataType = 2)
		begin
			-- modi 2003-07-10
			--set @ComputeField = replace(@DateFormat, "@", @ComputeField)
			set @ComputeField = replace("CASE WHEN @<>'' THEN "+@DateFormat+" ELSE '' END", "@", @ComputeField)
		end
	end
	

--execute Zwd_ErrorMessage @ComputeField, "Zwd_ParseField"


	SET QUOTED_IDENTIFIER ON
/*	
*/	
	-- 结束
	RETURN 1















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO









------------------------------------------------
-- PopFirstWord
------------------------------------------------
CREATE PROCEDURE Zwd_PopFirstWord
    @SourceString   VARCHAR(8000) = NULL OUTPUT,
    @FirstWord      VARCHAR(8000) = NULL OUTPUT,
    @Delimiter	    VARCHAR(100) = NULL
AS
    SET NOCOUNT ON

    -- Procedure accepts a comma delimited string as the first parameter
    -- Procedure outputs the first word in the second parameter
    -- Procedure outputs the remainder of the delimeted string in the first parameter
    -- Procedure yields the length of the First Word as the return value

    DECLARE @Oldword        VARCHAR(8000)
    DECLARE @Length         INT
    DECLARE @CommaLocation  INT

    SELECT @Oldword = @SourceString

    IF NOT @Oldword IS NULL
    BEGIN
        SELECT @CommaLocation = CHARINDEX(@Delimiter, @Oldword)
        SELECT @Length = DATALENGTH(@Oldword)

        IF @CommaLocation = 0
        BEGIN
            SELECT @FirstWord = @Oldword
            SELECT @SourceString = NULL

            RETURN 0
        END

        SELECT @FirstWord = SUBSTRING(@Oldword, 1, @CommaLocation - 1)
        SELECT @SourceString = SUBSTRING(@Oldword, @CommaLocation + DATALENGTH(@Delimiter), @Length - @CommaLocation - DATALENGTH(@Delimiter) + 1)

        RETURN @Length - @CommaLocation
    END

    RETURN 0
------------------------------------------------







GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO











/***************************************************************************************** 20020928
1-不分组的情况
	1-生成以主表关键字作关键字的临时表，包括 WHERE 部分过滤，可以顺带处理 2-1
	2-处理列
		1-主表的列，子表的当前记录[ZC9993=1]，以及不用特殊处理的表达式直接 UPDATE 处理
		2-子表的历史记录采用第二个临时表处理
			1-建临时表，不采取过滤措施，如果本身没有过滤条件的话
			2-取得极值[ZA0100]（最大值/最小值，处理历史的最近和最初问题），UPDATE 增量[历史记录]处理
			3-删除极值或者打标记
			4-循环处理 - 2~3
		3-特殊表达式特殊处理
	3-循环处理每列 - 2
2-分组的情况
	1-采用最小分组，以及不用特殊处理的计算式，以建立临时表
	2-在当前临时表里进行第二次最小分组，将分组结果插入该表
	3-循环处理每个分组 - 2
	4-处理平均人数、累计、累计平均
**************************************************************************************************/
CREATE    PROCEDURE Zwd_ReportData
	(
		@TableName		varchar(8000)	= "",				-- TableName
		@GroupString		varchar(8000)	= ""				-- Group Order String
	)
AS
	SET ANSI_NULL_DFLT_ON ON

	SET QUOTED_IDENTIFIER OFF

	SET NOCOUNT ON

	SET ANSI_WARNINGS OFF


	declare @TableNameOrder		varchar(8000)

	declare	@strSQL			varchar(8000)
	declare	@strSelect		varchar(8000)
	declare	@strSelect2		varchar(8000)
	declare	@strInto		varchar(8000)
	declare	@strFrom		varchar(8000)
	declare	@strWhere		varchar(8000)
	declare	@strTemp		varchar(8000)
	-- 分组字串
	declare @GroupBy2		varchar(8000)
	-- 以下为序列项表的东西
	declare @InfoId			varchar(10)
	declare @Object			varchar(10)
	declare @InfoFields		varchar(8000)
	declare @DataType		int
	-- 执行的返回结果
	declare @Result			int


--execute Zwd_ErrorMessage @TableName, "Zwd_ReportData"


	if(@GroupString = "")
		exec(@TableName)
	else
	begin
		set @TableNameOrder = @TableName + "_Order"

--execute Zwd_ErrorMessage @TableNameOrder, "Zwd_ReportData"

		set @strSelect = ""
		set @strSelect2 = ""
		set @strFrom = @TableName
		set @strWhere = ""


		set @Result = datalength(@GroupString)
		while(@Result > 0)
		begin
--
			execute @Result = Zwd_PopFirstWord @GroupString output, @InfoFields output, "||"
--
			execute Zwd_PopFirstWord @InfoFields output, @Object output, ";"
--
			execute Zwd_PopFirstWord @Object output, @InfoId output, ":"

			set @strTemp = @Object+".ZA0100="+@TableName+".ZA0100"
--
			--execute Zwd_AddFrom @strFrom output, " JOIN ", @Object, @strTemp,@strWhere output
			execute Zwd_AddFrom @strFrom output, " LEFT JOIN ", @Object, @strTemp,@strWhere output
--
			execute Zwd_ParseField @InfoId,@Object,@Object,@InfoFields,"","","","1","",0,@DataType output,"",@strTemp output,@strFrom output,@strWhere output,"","","",@GroupBy2 output,@Result

			if(@strSelect <> "")
				set @strSelect = @strSelect + "+'_'+"
			set @strSelect = @strSelect + "ISNULL(" + @strTemp + ",'[空]')"

--
			execute Zwd_PopFirstWord @InfoFields output, @Object output, ":"
--
			execute Zwd_PopFirstWord @InfoFields output, @Object output, ":"

			if(@strSelect2 <> "")
				set @strSelect2 = @strSelect2 + "+'_'+"
			set @strSelect2 = @strSelect2 + "ISNULL(" + @InfoId + "." + @Object + ",'')"

--execute Zwd_ErrorMessage @strTemp, "Zwd_ReportData"

		end


		set @TableNameOrder = @TableName + "_Order"

		set @strSelect = " SELECT " + @TableName + ".*," + @strSelect2 + " AS FOrder," + @strSelect + " AS FOrder2"
		set @strInto = " INTO " + @TableNameOrder
		set @strFrom = " FROM " + @strFrom
		if(@strWhere <> "")
			set @strWhere = " WHERE " + @strWhere

		
		set @strSQL = @strSelect + @strInto + @strFrom + @strWhere
--
execute Zwd_ErrorMessage @strSQL, "Zwd_ReportData"

		exec("IF EXISTS(SELECT * FROM tempdb.dbo.SYSOBJECTS WHERE NAME='" + @TableNameOrder + "') DROP TABLE " + @TableNameOrder + @strSelect + @strInto + @strFrom + @strWhere)


		exec("SELECT * FROM " + @TableNameOrder + " ORDER BY FOrder")
	end


	SET ANSI_WARNINGS ON

	SET NOCOUNT OFF

	SET ANSI_NULL_DFLT_ON OFF

	SET QUOTED_IDENTIFIER ON


	RETURN 0









GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO












/***************************************************************************************** 20020928
1-不分组的情况
	1-生成以主表关键字作关键字的临时表，包括 WHERE 部分过滤，可以顺带处理 2-1
	2-处理列
		1-主表的列，子表的当前记录[ZC9993=1]，以及不用特殊处理的表达式直接 UPDATE 处理
		2-子表的历史记录采用第二个临时表处理
			1-建临时表，不采取过滤措施，如果本身没有过滤条件的话
			2-取得极值[ZA0100]（最大值/最小值，处理历史的最近和最初问题），UPDATE 增量[历史记录]处理
			3-删除极值或者打标记
			4-循环处理 - 2~3
		3-特殊表达式特殊处理
	3-循环处理每列 - 2
2-分组的情况
	1-采用最小分组，以及不用特殊处理的计算式，以建立临时表
	2-在当前临时表里进行第二次最小分组，将分组结果插入该表
	3-循环处理每个分组 - 2
	4-处理平均人数、累计、累计平均
**************************************************************************************************/
CREATE      PROCEDURE Zwd_TransFields
	(
		@InfoId			varchar(4),					-- 对象
		@OldFields		varchar(8000),					-- Type1:Field1:DictId1[|Type2:Field2:DictId2[...]]
		@NewFields		varchar(8000)			OUTPUT,		-- InfoId1.Field1[,InfoId2.Field2[...]]
											-- InfoId.Field maybe like "Gs_DictItem.Description"
		@DataFormat		varchar(8000),					-- 格式
		@strFrom		varchar(8000)			OUTPUT,		-- SQL .. FROM
		@strWhere		varchar(8000)			OUTPUT,		-- SQL .. WHERE
		@Index			varchar(4),					-- Field Index
		@MainObject		varchar(4),					-- 主对象
		@Object			varchar(4),					-- 对象
		@Child			int		=	0,			-- 是否操作子表
		@IsVarchar		int		=	-1,			-- 要求是字串
		@strGroupBy		varchar(8000)	=	''		-- 分组字段 add 2003-01-13
	)
AS											-- 返回 0-数字 1-字符 2-日期
	SET QUOTED_IDENTIFIER OFF
	
	
	declare @Result			int
	declare @aOldFields		varchar(8000)
	declare @aOldField		varchar(8000)
	declare @strJoinedTable		varchar(8000)
	declare @strOn			varchar(8000)
	declare @strTemp		varchar(8000)
	declare @strTemp2		varchar(8000)
	declare @DateFormat		varchar(8000)
	declare @NumFormat		varchar(8000)
	declare @Return_Value		int
	declare @Length			int
	declare @Pos			int
	declare @TableName		varchar(100)


--execute Zwd_ErrorMessage @OldFields, "Zwd_TransFields"


	-- 取表达式类型
	set @Return_Value = @IsVarchar	

	set @aOldFields = @OldFields
	set @Result = datalength(@OldFields)
	while(@Result > 0)
	begin
--
		execute @Result = Zwd_PopFirstWord @aOldFields output, @aOldField output, "|"

--
		execute Zwd_PopFirstWord @aOldField output, @strTemp output, ":"
		if(@Return_Value = -1)
		begin
			if(@strTemp = "2" or @strTemp = "9")
				set @Return_Value = 0
			else if(@strTemp = "3" or @strTemp = "4"  or @strTemp = "5")
				set @Return_Value = 2
			else
				set @Return_Value = 1
		end

		-- 数字，颜色
		if(@Return_Value = 0 and @strTemp <> "2" and @strTemp <> "9")
			set @Return_Value = 1

		-- 日期
		if(@Return_Value = 2 and @strTemp <> "3" and @strTemp <> "4" and @strTemp <> "5")
			set @Return_Value = 1
	end
	

	-- 子表不处理
	if(substring(@InfoId,3,2) <> "01" and @Child = 0)
		RETURN @Return_Value


	-- 生成表达式
	set @NumFormat = @DataFormat
--
	execute Zwd_PopFirstWord @NumFormat output, @DateFormat output, "|"


	set @NewFields = ""

	set @aOldFields = @OldFields
	set @Result = datalength(@OldFields)
	while(@Result > 0)
	begin
--
		execute @Result = Zwd_PopFirstWord @aOldFields output, @aOldField output, "|"

--
		execute Zwd_PopFirstWord @aOldField output, @strTemp2 output, ":"
--
		execute Zwd_PopFirstWord @aOldField output, @strTemp output, ":"

		set @strTemp = @InfoId + "." + @strTemp

--
		if(@Return_Value = 1)
		begin

--execute Zwd_ErrorMessage "格式处理", "Zwd_TransFields"

			-- 数字
			if(@strTemp2 = "2")
				set @strTemp = replace(@NumFormat, "@", @strTemp)
			-- 日期
			else if(@strTemp2 = "3" or @strTemp2 = "4" or @strTemp2 = "5")
			begin
				-- modi 2003-07-10
				--set @strTemp = replace(@DateFormat, "@", @strTemp)
				set @strTemp = replace("CASE WHEN @<>'' THEN "+@DateFormat+" ELSE '' END", "@", @strTemp)
			end
			-- 颜色
			else if(@strTemp2 = "9")
				set @strTemp = "CONVERT(VARCHAR," + @strTemp + ")"
		end

		-- 处理字典项
		set @Length = datalength(@aOldField)
		if(@Length > 0)
		begin

--execute Zwd_ErrorMessage "字典处理", "Zwd_TransFields"

			if(substring(@InfoId,3,2) <> "01")
			begin
				set @strOn = @InfoId + ".ZA0100=" + @Object + ".ZA0100"
				-- add 2003-01-13
				-- del 2003-03-31
				--if(charindex(@strTemp, @strGroupBy) > 0)
				-- endd
				set @strOn = @strOn + " AND " + @InfoId + ".ZC9993=1"
				-- enda
--
				-- modi 2003-03-28
				--execute Zwd_AddFrom @strFrom output, " JOIN ", @InfoId, @strOn, @strWhere output
				execute Zwd_AddFrom @strFrom output, " LEFT JOIN ", @InfoId, @strOn, @strWhere output
			end

			set @TableName = "T" + @Index + cast(@Result as varchar)

			-- 引用项
			set @Pos = charindex(".", @aOldField)
			if(@Pos > 0)
			begin
				set @strJoinedTable = substring(@aOldField, 1, @Pos-1) + " AS " + @TableName
				set @strOn = @strTemp + "*=" + @TableName + ".ZA0100"
--
				execute Zwd_AddFrom @strFrom output, " LEFT JOIN ", @strJoinedTable, @strOn, @strWhere output

				set @strTemp = @TableName + substring(@aOldField, @Pos, @Length-@Pos+1)
			end
			else
			begin
				set @strJoinedTable = "Gs_DictItem AS " + @TableName
				set @strOn =  @TableName + ".DictId='" + @aOldField + "' AND " + @strTemp + "*=" + @TableName + ".DictValue"
--
				execute Zwd_AddFrom @strFrom output, " LEFT JOIN ", @strJoinedTable, @strOn, @strWhere output

				set @strTemp = @TableName + ".Description"
			end
		end

		if(@NewFields <> "")
			set @NewFields = @NewFields + "|"
		-- add 2002-12-28
		if(@Return_Value = 0)
			set @strTemp = "ISNULL(" + @strTemp + ",0)"
		-- enda
		-- add 2003-06-18
		if(@Return_Value = 1)
			set @strTemp = "ISNULL(" + @strTemp + ",'')"
		if(@Return_Value = 2)
			set @strTemp = "ISNULL(" + @strTemp + ",'')"
		-- enda
		set @NewFields = @NewFields + @strTemp

--execute Zwd_ErrorMessage @strTemp, "Zwd_TransFields"

	end


--execute Zwd_ErrorMessage @NewFields, "Zwd_TransFields"


	SET QUOTED_IDENTIFIER ON
/*	
*/	
	-- 结束
	RETURN @Return_Value










GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO








/***************************************************************************************** 20020928
1-不分组的情况
	1-生成以主表关键字作关键字的临时表，包括 WHERE 部分过滤，可以顺带处理 2-1
	2-处理列
		1-主表的列，子表的当前记录[ZC9993=1]，以及不用特殊处理的表达式直接 UPDATE 处理
		2-子表的历史记录采用第二个临时表处理
			1-建临时表，不采取过滤措施，如果本身没有过滤条件的话
			2-取得极值[ZA0100]（最大值/最小值，处理历史的最近和最初问题），UPDATE 增量[历史记录]处理
			3-删除极值或者打标记
			4-循环处理 - 2~3
		3-特殊表达式特殊处理
	3-循环处理每列 - 2
2-分组的情况
	1-采用最小分组，以及不用特殊处理的计算式，以建立临时表
	2-在当前临时表里进行第二次最小分组，将分组结果插入该表
	3-循环处理每个分组 - 2
	4-处理平均人数、累计、累计平均
**************************************************************************************************/
CREATE PROCEDURE Zwd_TransTables
	(
		@InfoId			varchar(4),					-- 对象
		@MainObject		varchar(4),					-- 主对象
		@Object			varchar(4),					-- 关联对象
		@strFrom		varchar(8000)			OUTPUT,		-- SQL .. FROM
		@strWhere		varchar(8000)			OUTPUT,		-- SQL .. WHERE
		@AddExLink		int		=	0	OUTPUT,		-- 是否增加额外连接
		@Child			int		=	0			-- 是否操作子表
	)
AS											-- 返回 0-失败 1-成功
	SET QUOTED_IDENTIFIER OFF
	
	
	declare @strSQL			varchar(8000)
	declare @strFields		varchar(8000)
	declare @strField		varchar(8000)

	
--execute Zwd_ErrorMessage @Object, "Zwd_TransTables"


	set @AddExLink = 0

	if(@MainObject = @Object)
		RETURN 0

	if(substring(@InfoId,3,2) = "01" or (substring(@InfoId,3,2) <> "01" and @Child = 1))
	begin
		-- 该表未被登记
		if(charindex(","+@Object+",", ","+@strFrom+",") = 0 and charindex(" JOIN "+@Object+" ON ", " JOIN "+@strFrom+" ON ") = 0)
		begin
	
--execute Zwd_ErrorMessage "开始处理……", "Zwd_TransTables"
	
			-- 打开关联表，去关联字段	
			set @strSQL = "SELECT PropertySet FROM Gs_ObjectAssociate WHERE InfoIdA='" + @MainObject + "' AND InfoIdB LIKE '" + @Object + "%'"
			set @strSQL = "declare CR_Associate cursor for " + @strSQL + " open CR_Associate"
			exec(@strSQL)
			fetch CR_Associate into @strFields
			close CR_Associate
			deallocate CR_Associate
			
--
			execute Zwd_PopFirstWord @strFields output, @strField output, ","

			set @strSQL = @MainObject + "." + @strField + "=" + @Object + ".ZA0100"
--
			execute Zwd_AddFrom @strFrom output, " JOIN ", @Object, @strSQL, @strWhere output


			if(upper(@strField) <> "ZA0100")
				set @AddExLink = 1
		end
	end


--execute Zwd_ErrorMessage @strFrom, "Zwd_TransTables"


	SET QUOTED_IDENTIFIER ON
/*	
*/	
	-- 结束
	RETURN 1






GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO






CREATE      PROCEDURE  flxp_AB01_DELETE
 
    AS
declare @intMaxSet int
SET QUOTED_IDENTIFIER OFF 
select @intMaxset=max(isnull(setnumber,0)) from ab01S
print @intMaxset
if(@intMaxset <> 0 )
	begin
	       delete ab01s where SetNumber=@intMaxset
                  --  update ab01s set ZD9992=null where setNumber =@intMaxset-1
              end
SET QUOTED_IDENTIFIER on





GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO





CREATE     PROCEDURE  flxp_AB01_SAVE 
 @currentdate  datetime,--当前时间
 @strOut int output
 
    AS
--declare @currentdate  datetime
--set @currentdate=getdate()
declare @intMaxSet int
declare @Tablename varchar(200)
declare @strsql varchar(4000)
declare @strField varchar(2000)
declare @infofield varchar(10)
declare @historydate datetime
SET QUOTED_IDENTIFIER OFF 
set @strField=''
--print 'aaaaaaaaaaaaaaaaaaaaaaaaa'
select @intMaxset=max(isnull(setnumber,0)) from ab01S
print @intMaxset
if(@intMaxset is null )
	set @intMaxset=0
print @intMaxset

set @strsql="declare curs_gwmc cursor for select LEFT(NAME,4) FROM sysobjects where len(name)=5 and left(name,2)='AB' and right(name,1)='S' and substring(name,3,2)>='01' and substring(name,3,2)<='99'  open curs_gwmc"
exec(@strsql)
fetch next from  curs_gwmc into @Tablename
while(@@fetch_status=0)
	begin
		set @strsql="declare curs_gw cursor for select infofield from gs_property where infoid='"+@tablename+"'   open curs_gw"

		exec(@strsql)
		fetch next from  curs_gw into @infofield
		while(@@fetch_status=0)
			begin
				if(@strfield="")
					set @strfield=@infofield
				else
					set @strfield=@strfield+","+@infofield
				fetch next from  curs_gw into @infofield
			end
		close Curs_gw
		deallocate Curs_gw
		set @strsql="insert into "+@Tablename+"S ("+@strfield+",ZD9992,setnumber) select "+@strfield+",'"+convert(varchar(10),@currentdate,21)+"',"+cast(@intMaxset+1 as varchar(10))+" from "+ @Tablename
		exec(@strsql)
		if @intMaxset>=1
		begin
			select  @historydate= zd9992 from ab01s where setnumber=@intMaxset and isnull(za9996,'')=''
			set @strsql="update "+@tablename+"S set zd9991='" + convert(varchar(10),@historydate,21) +"' where setnumber="+cast(@intMaxset+1 as varchar(10)) 
			exec(@strsql)
		end
		if(@@error<>0)
			goto abandon
		fetch next from  curs_gwmc into @Tablename
	end

close Curs_gwmc
deallocate Curs_gwmc
SET QUOTED_IDENTIFIER on
return 0
abandon:
return 1





GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

CREATE               PROCEDURE   flxp_Bank_Requery  
@bankid  int,
@STRCondtion varchar(8000),--条件
@subconditon varchar(8000),
 @strOut varchar(8000) output--输出

AS
--select * from gs_bankItem

declare @strSQl varchar(6000)
declare @strTBL varchar(1000)
declare @field varchar(20)
declare @fieldname varchar(20)
declare @fieldformat varchar(20)
declare @fieldtype  varchar(20)
declare @start int
declare @strtemp varchar(4000)
declare @groupby varchar(200)
declare @groupsql varchar(200)

declare @dictid as varchar(20)
set @groupby=''
set @groupsql = ''
set @strtemp=''

SET QUOTED_IDENTIFIER OFF  
if isnull(@subconditon,'')=''
	set @strTBL=" aa59 left join aa01 on aa01.za0100=aa59.za0100 and aa01.zc9993='1' "
else
	set @strTBL=" aa59 left join aa01 on aa01.za0100=aa59.za0100 and aa01.zc9993='1' and "+@subconditon


set @strSQl=" declare curs_g cursor for select field,fieldname,fieldformat,fieldtype from gs_bankItem where bankid="+cast(@bankid as varchar)+" order by Itemid   open curs_g"
exec(@strsql)

fetch next from  curs_g into @field,@fieldname,@fieldformat,@fieldtype
while(@@fetch_status=0)
	begin
	
	if @fieldtype='2'
		begin

			select @dictid=isnull(dictid,'') from gs_property where infoid+'.'+infofield=@field
			if len(@dictid)<=1	
				begin		
					if (@strtemp='')
						set @strtemp=@field+" as '"+@fieldname+"'"
					else	
						set @strtemp=@strtemp+","+@field+" as '"+@fieldname+"'"
					if @groupby<>''
					begin
						set @groupby=@groupby+","+@field
						--set @groupsql =@groupsql+ " and " + @field + " is not null "
					end
					else
					begin
						set @groupby=@field
						--set @groupsql = @field + " is not null "
					end
				end
			else if len(@dictid)<=2
				begin
				if (@strtemp='')
						set @strtemp="(select description from gs_dictitem where dictid='"+@dictid+"' and dictvalue="+@field+") as '"+@fieldname+"'"
					else	
						set @strtemp=@strtemp+",(select description from gs_dictitem where dictid='"+@dictid+"' and dictvalue="+@field+") as '"+@fieldname+"'"
					if @groupby<>''
					begin
						set @groupby=@groupby+","+@field
						--set @groupsql = @groupsql + " and " + @field + " is not null "
					end
					else
					begin
						set @groupby=@field
						--set @groupsql = @field + " is not null "
					end
				end
			else
				begin
					if (@strtemp='')
						set @strtemp="(select za0101 from "+left(@dictid,4)+" where za0100="+@field+") as '"+@fieldname+"'"
					else	
						set @strtemp=@strtemp+",(select za0101 from "+left(@dictid,4)+" where za0100="+@field+") as '"+@fieldname+"'"
					if @groupby<>''
					begin
						set @groupby=@groupby+","+@field
						--set @groupsql = @groupsql + " and " + @field + " is not null "
					end 
					else
					begin
						set @groupby=@field
						--set @groupsql = @field + " is not null "
					end
				end



		end



	else
		begin

		if(isnull(@fieldformat,'')='')		
			if (@strtemp='')
				set @strtemp="sum(isnull("+@field+",0)) as '"+@fieldname+"'"
			else	
				set @strtemp=@strtemp+",sum(isnull("+@field+",0)) as '"+@fieldname+"'"

		else
			begin
				if (@strtemp='')
					set @strtemp="right('0000000000'+cast(sum(isnull("+@field+",0)) as varchar),"+cast(len(@fieldformat) as varchar)+") as '"+@fieldname+"'"
				else
					set @strtemp=@strtemp+",right('0000000000'+cast(sum(isnull("+@field+",0)) as varchar),"+cast(len(@fieldformat) as varchar)+") as '"+@fieldname+"'"

			end
		end

		fetch next from  curs_g into @field,@fieldname,@fieldformat,@fieldtype
	end
close Curs_g
deallocate Curs_g
if(isnull(@STRCondtion,'')<>'')
begin
	if (@groupsql<>'')
		set @strtemp="select "+@strtemp+" from "+@strTBL+" where aa01.za0100 in ("+@STRCondtion+") and "  + @groupsql
	else
		set @strtemp="select "+@strtemp+" from "+@strTBL+" where aa01.za0100 in ("+@STRCondtion+") "  
	
end
else
begin
	if (@groupsql<>'')
		set @strtemp="select "+@strtemp+" from "+@strTBL + " where " + @groupsql
	else
		set @strtemp="select "+@strtemp+" from "+@strTBL
end

if(@groupby<>'')
	set @strtemp = @strtemp + " group by aa01.za0100," + @groupby

set @strOut=@strtemp










GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO


















CREATE                PROCEDURE   flxp_CheckField  
@StrServer1 varchar(20),--本数据库名称
@StrServer2 varchar(20),--导入数据库名称
@strOut varchar(5000) output--输出

AS

declare @strSQl varchar(8000)
declare @strinsert varchar(8000)
declare @strdel varchar(8000)
declare @fieldlen1 int
declare @fieldtype1 varchar(20)
declare @fieldlen2 int
declare @fieldtype2 varchar(20)
--错误信息
declare @Messerror varchar(6000)
declare @fieldname1 varchar(6000)
declare @fieldname2 varchar(6000)


declare @field1 varchar(20)
declare @fielddec1 int
declare @field2 varchar(20)
declare @fielddec2 int
declare @restriction varchar(10)

declare @StrField1 varchar(20)--本数据库表名  
declare @StrField2  varchar(20)--导入数据库表名 

declare @tmpField1 varchar(20)--本数据库表名  临时
declare @tmpField2 varchar(20)--导入数据库表名 临时
--本数据库字段集合
declare @fieldlist1 varchar(1000)
declare @fieldlisterr1 varchar(1000)
--导入数据库字段集合
declare @fieldlist2 varchar(1000)
declare @fieldlisterr2 varchar(1000)
declare @fieldupdate varchar(1000)--替换机构数据

--人员类别
declare @aa010d varchar(2)

--人员编码
declare @a0100 varchar(50)
declare @za0100 varchar(20)
declare @bl varchar(1)
declare @temp varchar(50)
declare @temp1 varchar(50)

declare @iii int
set @iii = 1

--declare @StrServer1 varchar(20)
--declare @StrServer2 varchar(20)
--declare @strOut varchar(500)

--set @StrServer1 = "gmisinfo"
--set @StrServer2 = "gpms2000"
--set @strfield1 = "AA01"
--set @strfield2 = "A001A001"

set @strOut = ''
set @fieldlist1 = ''
set @fieldlisterr1 = ''
set @fieldlist2 = ''
set @fieldlisterr2 = ''
set @messerror = ''
--临时表
declare @jstable varchar(40)
declare @maxid int
set @maxid = 1
set @jstable ="[##"+convert(varchar(40),getdate(),21)+"]"
set @strSql = " create table "+ @jstable  + "(orderid int,strField varchar(50),strtmp varchar(10))"
exec(@strsql)


SET QUOTED_IDENTIFIER OFF  


--导入部门单位数据
declare @za0101 varchar(50)
declare @ZA9996 varchar(20)
declare @ZA9997 varchar(2)
declare @ZA9999 varchar(10)
declare @AB0160 varchar(10)
declare @AB01ID int
set @iii = 1
set @strSQL="declare curs_gwmc cursor for select code,cast(description as varchar(50)),case PPtr when 'UN' then null when 'UM' then null else cast(PPtr as varchar(20)) end,cast(CPtr as bit),cast(Spell as varchar(10)),case Dtype when 'C001' then '3' when 'C002' then '2' when 'C003' then '1' else '' end ,(select isnull(max(AB01ID),100) from " + @strserver1 + ".dbo.ab01) from " + @strserver2 + ".dbo.sr_department order by code open curs_gwmc"
exec(@strsql)
       	fetch next from  curs_gwmc into @za0100,@za0101,@ZA9996,@ZA9997,@ZA9999,@AB0160,@AB01ID
while(@@fetch_status=0)
begin
	set @AB01ID = @AB01ID + 100 *@iii
set @strSQL = " delete "+ @strserver1 +".dbo.ab01 where ZA0100 = '" + @za0100 + "' "
exec(@strsql)
if isnull(@ZA9996,'') = ''
	set @strSQL = " insert into "+ @strserver1 +".dbo.ab01 (ZA0100,ZA0101,ZA9996,ZA9997,ZA9999,AB0160,AB01ID) values ('" + @za0100 + "','" + @za0101 + "',null,cast('" + isnull(@ZA9997,'')+"' as bit),'" + isnull(@ZA9999,'') + "','" + isnull(@AB0160,'') + "'," + cast(@AB01ID as varchar(10)) + ") "
else
	set @strSQL = " insert into "+ @strserver1 +".dbo.ab01 (ZA0100,ZA0101,ZA9996,ZA9997,ZA9999,AB0160,AB01ID) values ('" + @za0100 + "','" + @za0101 + "','" + @ZA9996 + "',cast('" + isnull(@ZA9997,'')+"' as bit),'" + isnull(@ZA9999,'') + "','" + isnull(@AB0160,'') + "'," + cast(@AB01ID as varchar(10)) + ") "
set @iii = @iii+1
exec(@strsql)
--print @strSQL
fetch next from  curs_gwmc into @za0100,@za0101,@ZA9996,@ZA9997,@ZA9999,@AB0160,@AB01ID
end
close Curs_gwmc
deallocate Curs_gwmc



--取本数据库和导入数据库中的表对应
set @strsql = "declare curs_gwmc cursor for select ('A'+left(setId,1)+Right(setId,2)) as InfoId,(setId + typeid) as aa from " + @strserver2+ ".dbo.sr_builtcollect where ('A'+left(setId,1)+Right(setId,2)) in (Select InfoId from " + @strserver1 + ".dbo.gs_structure) order by aa  open curs_gwmc "
exec(@strsql)
fetch next from  curs_gwmc into @strField1,@strField2
while(@@fetch_status=0)
	begin
		set @strdel = ''
		set @strinsert = ''

set @strsql = "declare curs11 cursor for select cast(count(*) as varchar(10)) from " + @strserver2+ ".dbo."+ @strField2 +"   open curs11 "
--print @strsql
exec(@strsql)
fetch next from  curs11 into @temp1
while(@@fetch_status=0)
	begin
				fetch next from  curs11 into @temp1
			end
		close curs11
		deallocate curs11
if isnull(@temp1,'0') <> '0'
begin
		if substring(@StrField2,5,4) = 'A001'
			set @aa010d = '1'
		else if substring(@StrField2,5,4) = 'A002'
			set @aa010d = '2'
		else if substring(@StrField2,5,4) = 'A003'
			set @aa010d = '3'
		else
			set @aa010d = '3'

		set @fieldlist1 = ''
		set @fieldlist2 = ''
		set @fieldupdate = ''

		set @strSql = "declare curs_gwmc1 cursor for select  infofield,fieldname,datatype,length,decimal,fieldtype,fieldlen,fielddec,restriction,a.description,b.description from " + @strserver1 + ".dbo.gs_property  a left join " + @strserver2 + ".dbo.SR_SourceItem b on secondname = fieldname and fieldname in (select fieldname from " + @strserver2 + ".dbo.sr_builtitem   where setid + typeid = '" + @strfield2 + "') where isnull(secondname,'') <> '' and isnull(fieldname,'') <> '' and setid = '"+substring(@strfield2,1,4)+"' and infoid = '" + @strfield1 + "'  open curs_gwmc1 "

		--print @strsql
		exec(@strsql)

		fetch next from  curs_gwmc1 into @field1,@field2,@fieldtype1,@fieldlen1,@fielddec1,@fieldtype2,@fieldlen2,@fielddec2,@restriction,@fieldname1,@fieldname2
		while(@@fetch_status=0)
			begin
			--查找对应字段并且修改本数据库中比较短的字段长度，数据类型不匹配提出错误信息

				if @restriction = '7'
				begin
					set @fieldlisterr1 = @fieldlisterr1 + "," + @field1
					set @fieldlisterr2 = @fieldlisterr2 + "," + @field2
					set @messerror = @messerror + "," + @field1 + ":" + @fieldname1 + ":计算字段~" + @field2 + ":" + @fieldname2 + ":" + @fieldtype2
				end
				else
				begin
					if @fieldtype2 = 'VARCHAR'
					begin
						if @fieldtype1 <> '2' and @fieldtype1 <> '3' and @fieldtype1 <> '4' and @fieldtype1 <> '5' and @fieldtype1 <> '9' and @fieldtype1 <> '11'  and @fieldtype1 <> '15'
						begin
							if @fieldlen1<@fieldlen2
							begin
								set @strSql = "alter table " + @StrServer1 + ".dbo." + @StrField1 + " ALTER COLUMN " + @field1 + " varchar(" + cast(@fieldlen2 as varchar(10)) + ") "
								exec(@strsql)
								set @strSql = "update " + @StrServer1 + ".dbo.gs_property set length = " + cast(@fieldlen2 as varchar(10)) + " where infoid = '" + @StrField1 + "' and  infofield = '" + @field1 + "' "
								exec(@strsql)
							end
							if @strfield1 = 'AB01'
							begin
								set @fieldupdate = @fieldupdate + "," + @field1 + " = " + @field2
							end
							else
							begin
								set @fieldlist1 = @fieldlist1 + "," + @field1
								set @fieldlist2 = @fieldlist2 + "," + @field2
							end
						end
						else
						begin
							set @fieldlisterr1 = @fieldlisterr1 + "," + @field1
							set @fieldlisterr2 = @fieldlisterr2 + "," + @field2
							--set @messerror = @messerror + "," + @field1 + ":" + @fieldname1 + ":" + dbo.field_typename(@fieldtype1) + "~" + @field2 + ":" + @fieldname2 + ":字符"  
						end
					end
					else if @fieldtype2 = 'DATETIME' or  @fieldtype2 = 'DATETIME6'
					begin
						if @fieldtype1 = '3' or @fieldtype1 = '4' or @fieldtype1 = '5'
						begin
							if @fieldtype2 = 'DATETIME'
							begin
								set @strSql = "update " + @StrServer1 + ".dbo.gs_property set length = 8,datatype = '5'  where infoid = '" + @StrField1 + "' and  infofield = '" + @field1 + "' "
								exec(@strsql)
							end
							else
							begin
								set @strSql = "update " + @StrServer1 + ".dbo.gs_property set length = 6,datatype = '4'  where infoid = '" + @StrField1 + "' and  infofield = '" + @field1 + "' "
								--print @strSql
								exec(@strsql)
							end
							if @strfield1 = 'AB01'
							begin
								set @fieldupdate = @fieldupdate + "," + @field1 + " = " + @field2
							end
							else
							begin
								set @fieldlist1 = @fieldlist1 + "," + @field1
								set @fieldlist2 = @fieldlist2 + "," + @field2
							end
						end
						else
						begin
							set @fieldlisterr1 = @fieldlisterr1 + "," + @field1
							set @fieldlisterr2 = @fieldlisterr2 + "," + @field2
							--set @messerror = @messerror + "," + @field1 + ":" + @fieldname1 + ":" + dbo.field_typename(@fieldtype1) + "~" + @field2 + ":" + @fieldname2 + ":日期"
						end
					end
					else if @fieldtype2 = 'INT'
					begin
						if @fieldtype1 = '2'
						begin
							if @strfield1 = 'AB01'
							begin
								set @fieldupdate = @fieldupdate + "," + @field1 + " = " + @field2
							end
							else
							begin
								set @fieldlist1 = @fieldlist1 + "," + @field1
								set @fieldlist2 = @fieldlist2 + "," + @field2
							end
						end
						else
						begin
							set @fieldlisterr1 = @fieldlisterr1 + "," + @field1
							set @fieldlisterr2 = @fieldlisterr2 + "," + @field2
							--set @messerror = @messerror + "," + @field1 + ":" + @fieldname1 + ":" + dbo.field_typename(@fieldtype1) + "~" + @field2 + ":" + @fieldname2 + ":整型"
						end
					end
					else if @fieldtype2 = 'NUMERIC'
					begin
						if @fieldtype1 = '2'
						begin
							if @fieldlen1<@fieldlen2
							begin
								set @strSql = "alter table " + @StrServer1 + ".dbo." + @StrField1 + " ALTER COLUMN " + @field1 + " NUMBERIC(" + cast(@fieldlen2 as varchar(10)) + ",0) "
								exec(@strsql)

								set @strSql = "update " + @StrServer1 + ".dbo.gs_property set length = " + cast(@fieldlen2 as varchar(10))+"  where infoid = '" + @StrField1 + "' and  infofield = '" + @field1 + "' "
								--print @strSql
								exec(@strsql)
						
							end
							if @fielddec1<@fielddec2
							begin
								set @strSql = "alter table " + @StrServer1 + ".dbo." + @StrField1 + " ALTER COLUMN " + @field1 + " NUMBERIC(" + cast(@fieldlen2 as varchar(10)) + ","+ cast(@fielddec2 as varchar(10)) +") "
								exec(@strsql)

								set @strSql = "update " + @StrServer1 + ".dbo.gs_property set decimal = " + cast(@fielddec2 as varchar(10))+"  where infoid = '" + @StrField1 + "' and  infofield = '" + @field1 + "' "
								--print @strSql
								exec(@strsql)
						
							end
							if @strfield1 = 'AB01'
							begin
								set @fieldupdate = @fieldupdate + "," + @field1 + " = " + @field2
							end
							else
							begin
								set @fieldlist1 = @fieldlist1 + "," + @field1
								set @fieldlist2 = @fieldlist2 + "," + @field2
							end
						end
						else
						begin
							set @fieldlisterr1 = @fieldlisterr1 + "," + @field1
							set @fieldlisterr2 = @fieldlisterr2 + "," + @field2
							--set @messerror = @messerror + "," + @field1 + ":" + @fieldname1 + ":" + dbo.field_typename(@fieldtype1) + "~" + @field2 + ":" + @fieldname2 + ":数值" 
						end
					end
					else if @fieldtype2 = 'TEXT'
					begin
						if @fieldtype1 = '2'
						begin
							if @strfield1 = 'AB01'
							begin
								set @fieldupdate = @fieldupdate + "," + @field1 + " = " + @field2
							end
							else
							begin
								set @fieldlist1 = @fieldlist1 + "," + @field1
								set @fieldlist2 = @fieldlist2 + "," + @field2
							end
						end
						else
						begin
							set @fieldlisterr1 = @fieldlisterr1 + "," + @field1
							set @fieldlisterr2 = @fieldlisterr2 + "," + @field2
							--set @messerror = @messerror + "," + @field1 + ":" + @fieldname1 + ":" + dbo.field_typename(@fieldtype1) + "~" + @field2 + ":" + @fieldname2 + ":备注"
						end
			    
					end
					else if @fieldtype2 = 'FLOAT'
					begin
						if @fieldtype1 = '2'
						begin
							if @fieldlen1<@fieldlen2
							begin
								set @strSql = "alter table " + @StrServer1 + ".dbo." + @StrField1 + " ALTER COLUMN " + @field1 + " NUMBERIC(" + cast(@fieldlen2 as varchar(10)) + ",0) "
								exec(@strsql)

								set @strSql = "update " + @StrServer1 + ".dbo.gs_property set length = " + cast(@fieldlen2 as varchar(10))+"  where infoid = '" + @StrField1 + "' and  infofield = '" + @field1 + "' "
								--print @strSql
								exec(@strsql)
						
							end
							if @fielddec1<@fielddec2
							begin
								set @strSql = "alter table " + @StrServer1 + ".dbo." + @StrField1 + " ALTER COLUMN " + @field1 + " NUMBERIC(" + cast(@fieldlen2 as varchar(10)) + ","+ cast(@fielddec2 as varchar(10)) +") "
								exec(@strsql)

								set @strSql = "update " + @StrServer1 + ".dbo.gs_property set decimal = " + cast(@fielddec2 as varchar(10))+"  where infoid = '" + @StrField1 + "' and  infofield = '" + @field1 + "' "
								--print @strSql
								exec(@strsql)
						
							end

							if @strfield1 = 'AB01'
							begin
								set @fieldupdate = @fieldupdate + "," + @field1 + " = " + @field2
							end
							else
							begin
								set @fieldlist1 = @fieldlist1 + "," + @field1
								set @fieldlist2 = @fieldlist2 + "," + @field2
							end
						end
						else
						begin
							set @fieldlisterr1 = @fieldlisterr1 + "," + @field1
							set @fieldlisterr2 = @fieldlisterr2 + "," + @field2
							--set @messerror = @messerror + "," + @field1 + ":" + @fieldname1 + ":" + dbo.field_typename(@fieldtype1) + "~" + @field2 + ":" + @fieldname2 + ":备注"
						end
			    
					end
					else	
					begin
						set @fieldlisterr1 = @fieldlisterr1 + "," + @field1
						set @fieldlisterr2 = @fieldlisterr2 + "," + @field2
					end
				end

				fetch next from  curs_gwmc1 into @field1,@field2,@fieldtype1,@fieldlen1,@fielddec1,@fieldtype2,@fieldlen2,@fielddec2,@restriction,@fieldname1,@fieldname2
			end
		close curs_gwmc1
		deallocate curs_gwmc1

		if substring(@strField2,1,4) = 'A001'
		begin
			--处理人员信息（主集）
			--替换status2，人员编号唯一

			if @strField2 = 'A001A001'

			begin
				set @strsql = "declare curs cursor for select ('A'+left(setId,1)+Right(setId,2)) as InfoId,setId + typeid from " + @strserver2+ ".dbo.sr_builtcollect where ('A'+left(setId,1)+Right(setId,2)) in (Select InfoId from " + @strserver1 + ".dbo.gs_structure) and setid = 'A001'  open curs "
				exec(@strsql)
			   	fetch next from  curs into @tmpField1,@tmpField2
				while (@@fetch_status=0)
				begin
					--将导入库中人员信息中的status2字段提空
					set @strSql = "update " + @StrServer2 + ".dbo." + @tmpField2 +" set status2 = null "
					exec(@strsql)
					
						set @strSQL="declare curs2 cursor for select  max(isnull(orderid,1)) from " + @jstable + "   open curs2" 
						exec(@strsql)
				 		fetch next from  curs2 into @maxid
						while(@@fetch_status=0)
						begin
							fetch next from  curs2 into @maxid
						end
						close Curs2
						deallocate Curs2
						set @maxid = isnull(@maxid,0) +1
						set @strSQL="select identity(int,"+ cast(@maxid as varchar) +",1) as aa,b0110+'_'+a0100 as bb,'" + @tmpfield2 + "' as cc into ##kk from  " + @StrServer2 + ".dbo." + @tmpField2 
						
						exec(@strsql)
						set @strSQL="insert into "+ @jstable + " select cast(aa as int),bb,cc from ##kk"
						exec(@strsql)
						drop table ##kk

/*
						set @strSQL="declare curs2 cursor for select  a0100 from " + @StrServer2 + ".dbo." + @tmpField2 + "   open curs2" 
						exec(@strsql)
				 		fetch next from  curs2 into @temp1
						while(@@fetch_status=0)
						begin
							set @maxid = isnull(@maxid,0) +1
							set @strsql = " insert into " + @jstable + " values (" + cast(@maxid as varchar(10)) + ",'" + @temp1 + "','" + @tmpfield2 + "') "
							
							exec(@strsql)

							fetch next from  curs2 into @temp1
						end
						close Curs2
						deallocate Curs2
*/

					--替换人员编码
					set @strSql = "update " + @StrServer2 + ".dbo." + @tmpField2 +" set status2 = cast(orderid  as varchar(20)) from " + @jstable  + "  where b0110 + '_' + a0100 = strfield  and strtmp = '" + @tmpField2 + "' "
					exec(@strsql)

					fetch next from  curs into @tmpField1,@tmpField2
				end
				close Curs
				deallocate Curs

				--替换子集中的人员编号在status2
				set @strSQL="declare curs_gwmc2 cursor for select  setid,typeid from "+ @StrServer2 + ".dbo.sr_builtcollect" +" where substring(isnull(typeid,'A'),1,1) = 'A'   open curs_gwmc2" 

				exec(@strsql)
				fetch next from  curs_gwmc2 into @temp,@temp1
				while(@@fetch_status=0)
				begin
					if @temp <> 'A001'
					begin
						set @strsql = " update " + @StrServer2 + ".dbo." + @temp + @temp1 + "  set status2 = b.status2 from " + @StrServer2 + ".dbo.A001" + @temp1 + "  b," + @StrServer2 + ".dbo." + @temp + @temp1 + " a where a.b0110 + '_' + a.a0100 = b.b0110 + '_' + b.a0100 "
						--print @strSQL
						exec(@strsql)
					end

					fetch next from  curs_gwmc2 into @temp,@temp1
				end
				close Curs_gwmc2
				deallocate Curs_gwmc2

			end

			--输出语句
				if isnull(@fieldlist1,'') <>'' and isnull(@fieldlist2,'')<>''
				begin
					set @strdel = " delete  " + @StrServer1 + ".dbo." + @strField1 +" where ZA0100 in (select status2 from "  + @StrServer2 + ".dbo." + @strField2 + ") "
					set @strinsert = " insert into  " + @StrServer1 + ".dbo." + @strField1 +"(ZA0100,ZC9993,AB0110,AA010D," + @strField1 + "ID" + @fieldlist1 + ") select status2,substring(status,1,1),B0110," + @aa010d + ",ID" + @fieldlist2 + " from "  + @StrServer2 + ".dbo." + @strField2 + " where status2 is not null "
				end
				else
				begin
					set @strdel = ''
					set @strinsert = ''
				end
		end
		else
		begin
			--处理人员信息（子集）
			if substring(@strField1,1,2) = 'AA'
			begin
				if isnull(@fieldlist1,'') <>'' and isnull(@fieldlist2,'')<>''
				begin
					set @strdel = " delete  " + @StrServer1 + ".dbo." + @strField1 +" where ZA0100 in (select status2 from "  + @StrServer2 + ".dbo." + @strField2 + " ) "
					set @strinsert = " insert into  " + @StrServer1 + ".dbo." + @strField1 +"(ZA0100,ZC9993," + @strField1 + "ID" + @fieldlist1 + ") select status2,substring(status,1,1),ID" + @fieldlist2 + " from "  + @StrServer2 + ".dbo." + @strField2 + " where status2 in (select za0100 from " + @StrServer1 + ".dbo.AA01) "
				end
				else
				begin
					set @strdel = ''
					set @strinsert = ''
				end
			end
			else if @strfield1 = 'AB01'
			begin
				if isnull(@fieldupdate,'') <>'' 
				begin
					set @strinsert = " update " + @StrServer1 + ".dbo." + @strField1 +" set " + substring(@fieldupdate,2,len(@fieldupdate)) + " from " + @StrServer2 + ".dbo." + @strField2 + "  where ZA0100 = b0110 "
				end
				else
						set @strinsert = ''
			end
			else
			begin
				if isnull(@fieldlist1,'') <>'' and isnull(@fieldlist2,'')<>''
				begin
					set @strdel = " delete  " + @StrServer1 + ".dbo." + @strField1 +" where ZA0100 in (select b0110 from "  + @StrServer2 + ".dbo." + @strField2  + ") "
					set @strinsert = " insert into  " + @StrServer1 + ".dbo." + @strField1 +"(ZA0100,ZC9993," + @strField1 + "ID" + @fieldlist1 + ") select b0110,substring(status,1,1),ID" + @fieldlist2 + " from "  + @StrServer2 + ".dbo." + @strField2 + " where b0110 in (select za0100 from " + @StrServer1 + ".dbo.AB01) "
				end
				else
				begin
					set @strdel = ''
					set @strinsert = ''
				end
			end
		end

		exec(@strdel)
		exec(@strinsert)
--print @strinsert
end
		fetch next from  curs_gwmc into @strField1,@strField2

	END	

close curs_gwmc
deallocate curs_gwmc

set @strsql = " drop table " + @jstable
exec(@strsql)

DECLARE @retstat varchar(20)
set @retstat = cast(@@ERROR  as varchar(10))
set @strOut= @fieldlisterr1 + ";" + @fieldlisterr2 + ";" + @retstat + ";" + @messerror
















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO



CREATE   PROCEDURE  flxp_CopyStandTable
 @SourceId varchar(10),
 @TargetPPtr varchar(10),
 @InfoId varchar(4),
 @newStandId varchar(10) output
 
AS

SET QUOTED_IDENTIFIER OFF 
declare @MaxId varchar(10)
declare @Sqls varchar(2000)

--取最大的standID
set @Sqls=" declare cursor_MaxId cursor for select isnull(max(standId)+1,9) as MaxId from gs_stand where pptr="+@TargetPPtr+"  open cursor_MaxId"
exec(@Sqls)
fetch next from  cursor_MaxId into @MaxId
close cursor_MaxId
deallocate cursor_MaxId
--
if(@MaxId = '9')
   begin
       set @MaxId = @TargetPPtr +'11'
       set @Sqls = "update gs_stand set ischild=1 where standId="+@TargetPPtr
	exec (@Sqls)
   end
--print @MaxId
set  @Sqls = " insert  gs_stand select "+ @MaxId +" as standId,description,type,isChild,"+@TargetPPtr+" as pptr,target,'"
+ @InfoId +"' as infoId,mainobject,HeaderCols,RowTitle,IsUsual,StandbyInt,"+
"StandbyVarChar,baseExpr,baseitem,setsql,chineseitem,FormulaStyle,purFileName,SetNo from gs_stand where standId=" + @SourceId
exec(@Sqls)
set @Sqls ="insert gs_standItem select "+@MaxId+" as standId,Type,Layer,IsCondition,DictId,DictValue,"+
"Description,Target,baseExpr, baseItem,setSql,ChineseItem,'' as InfoFields,InfoId,InfoField  from gs_standitem where standId="+@SourceId
exec (@Sqls)
set @newStandId = @MaxId
SET QUOTED_IDENTIFIER on

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO





CREATE  PROCEDURE flxp_Gs_id  
--处理ID约束
 @MainObject varchar(4),--主对象
 @Fieldname varchar(6),--字段名
 @Order varchar(50)--重建ID的排序字段，用逗号分开
 
AS
declare @strsql  varchar(2000)--SQL语句
declare @strtemp varchar(2000)--存放临时的SQL语句
declare @infoid varchar(4)--对象名
declare @infofield varchar(6)--字段名
declare @restr varchar(100)--ID的处理表达式
declare @strFirst varchar(100)--GID或LID之前的分组部分
declare @length int--GID()或LID()中表示长度的值
declare @value int--表示GID或LID的种子数
declare @intFirst int--临时变量
declare @intSecond int--临时变量
declare @count int--临时变量
declare @za0100 varchar(20)--人员编码
declare @id int--对象的ID值
declare @group varchar(20)--分组
 --如果字段名为空按主对象中的所有ID约束处理
--如果mainObject为空，按整个数据库处理
declare @intGID int
declare @intLid int

SET QUOTED_IDENTIFIER OFF  
begin tran
--根据传入的对象名和字段名来生成过滤条件
if isnull(@Fieldname,'')<>''
	set @strtemp=" infofield='"+@Fieldname+"'"
if isnull(@MainObject,'')<>''
	if @strtemp=''
		set @strtemp=" infoid='"+@MainObject+"'"
	else
		set @strtemp=@strtemp+" and  infoid='"+@MainObject+"'"
--生成过滤条件
if @strtemp<>""
	set @strsql="select infoid,infofield,restrictionexplain from gs_property where not isnull(restrictionexplain,'') ='' and "+@strtemp+" and infofield<>'ZA0100'"
else
	set @strsql="select infoid,infofield,restrictionexplain from gs_property where not isnull(restrictionexplain,'') =''  and infofield<>'ZA0100'"

set @strsql="declare curs_gwmc cursor for "+@strsql+"  open curs_gwmc"
exec(@strsql)
	fetch next from  curs_gwmc into @infoid,@infofield,@restr
--循环
	while(@@fetch_status=0)
		begin
			--删除gs_id表中对应的数据
			delete from gs_id where infoid=@infoid and infofield=@infofield
			--处理是GID或是LID
			set @intGID=CHARINDEX('GID',upper(@restr))
			set @intLID=CHARINDEX('LID',upper(@restr))
			if @intGID>=1--GID
				begin
					if @intGID=1--只有GID
						begin
							select @strFirst=''
							if isnull(@order,'')=''
								set @strsql="select za0100,isnull("+@infoid+"ID,-12345),'' from "+@infoid+" order by "+@infoid+"ID"
							else
								set @strsql="select za0100,isnull("+@infoid+"ID,-12345),'' from "+@infoid+" order by "+@order+","+@infoid+"ID"
						end

					else --除GID外还有分组
						begin
							select @strFirst=substring(@restr,1,@intGID-2)
							if (left(upper(ltrim(@strFirst)),9)<>'SUBSTRING')
								set @strFirst="'"+@strFirst+"'"
							else
								set @strFirst="isnull("+@strFirst+",'')"

							if isnull(@order,'')=''
								set @strsql="select za0100,isnull("+@infoid+"ID,-12345),"+@strFirst+" from "+@infoid+" order by "+@strFirst+","+@infoid+"ID"
							else
								set @strsql="select za0100,isnull("+@infoid+"ID,-12345),"+@strFirst+" from "+@infoid+" order by "+@strFirst+","+@order+","+@infoid+"ID"
						end
						
					--找出有关数据
					set @intfirst=CHARINDEX('(',substring(@restr,@intGID,10))
					set @intSecond=CHARINDEX(',',substring(@restr,@intGID,10))
					set @length=cast(substring(substring(@restr,@intGID,10),@intfirst+1,@intSecond-@intfirst-1) as int)
					set @intfirst=CHARINDEX(',',substring(@restr,@intGID,10))
					set @intSecond=CHARINDEX(')',substring(@restr,@intGID,10))
					set @value=cast(substring(substring(@restr,@intGID,10),@intfirst+1,@intSecond-@intfirst-1) as int)
					set @strsql="declare curs_record cursor for "+@strsql+"  open curs_record"
					exec(@strsql)
					fetch next from  curs_record into @za0100,@id,@group

					while(@@fetch_status=0)
						begin

							select @count=count(*) from gs_id where infoid=@infoid and infofield=@infofield and groupvalue=''
							if @count=0 
								begin
									set @strsql="insert into gs_id (infoid,infofield,groupvalue,type,value) values ('"+@infoid+"','"+@infofield+"','','0','"+cast(@value-1 as varchar(10))+"')"
									exec(@strsql)
								end

							set @strsql="update gs_id set value=cast(cast(value as int)+1 as varchar(10)) where infoid='"+@infoid+"' and infofield='"+@infofield+"' and isnull(groupvalue,'')=''"
							exec(@strsql)
							--更新数据
							if @length<>0
								begin
								select @strtemp=right('00000000000000000000'+value,@length) from gs_id where infoid=@infoid and infofield=@infofield and groupvalue=''
								if charindex("'",@strtemp,0)>0
								   set @strtemp=''

								if @id=-12345
									set @strsql="update "+@infoid+" set "+@infofield+"="+@strFirst+"+'"+@strtemp+"' where za0100='"+@za0100+"'"
								else
									set @strsql="update "+@infoid+" set "+@infofield+"="+@strFirst+"+'"+@strtemp+"' where za0100='"+@za0100+"' and "+@infoid+"ID="+cast(@id as varchar(10))


								
								end

							else
								begin

								select @strtemp=value from gs_id where infoid=@infoid and infofield=@infofield and groupvalue=''
								if charindex("'",@strtemp,0)>0
								   set @strtemp=''

								if @id=-12345
									set @strsql="update "+@infoid+" set "+@infofield+"='"+@strtemp+"' where za0100='"+@za0100+"'"
								else
									set @strsql="update "+@infoid+" set "+@infofield+"='"+@strtemp+"' where za0100='"+@za0100+"' and "+@infoid+"ID="+cast(@id as varchar(10))

								
								end
							exec(@strsql)
							fetch next from  curs_record into @za0100,@id,@group
							
						end
					close curs_record
					deallocate curs_record
				end
			if @intLid>=1
				begin


					if @intLID=1
						begin
							select @strFirst=''
							if isnull(@order,'')=''
								set @strsql="select za0100,"+@infoid+"ID,'' from "+@infoid+" order by "+@infoid+"ID"
							else
								set @strsql="select za0100,"+@infoid+"ID,'' from "+@infoid+" order by "+@order+","+@infoid+"ID"
						end
					else 
						begin
							select @strFirst=substring(@restr,1,@intLID-2)
							if isnull(@order,'')=''
								set @strsql="select za0100,"+@infoid+"ID,"+@strFirst+" from "+@infoid+" order by "+@strFirst+","+@infoid+"ID"
							else
								set @strsql="select za0100,"+@infoid+"ID,"+@strFirst+" from "+@infoid+" order by "+@strFirst+","+@order+","+@infoid+"ID"
						end
					set @intfirst=CHARINDEX('(',substring(@restr,@intLID,10))
					set @intSecond=CHARINDEX(',',substring(@restr,@intLID,10))
					set @length=cast(substring(substring(@restr,@intLID,10),@intfirst+1,@intSecond-@intfirst-1) as int)
					set @intfirst=CHARINDEX(',',substring(@restr,@intLID,10))
					set @intSecond=CHARINDEX(')',substring(@restr,@intLID,10))
					set @value=cast(substring(substring(@restr,@intLID,10),@intfirst+1,@intSecond-@intfirst-1) as int)
					set @strsql="declare curs_record cursor for "+@strsql+"  open curs_record"
					exec(@strsql)
					fetch next from  curs_record into @za0100,@id,@group
					while(@@fetch_status=0)
						begin
							select @count=count(*) from gs_id where infoid=@infoid and infofield=@infofield and groupvalue=@group

							if @count=0 
								begin
									set @strsql="insert into gs_id (infoid,infofield,groupvalue,type,value) values ('"+@infoid+"','"+@infofield+"','"+@group+"','1','"+cast(@value-1 as varchar(10))+"')"

									exec(@strsql)
								end

								--insert into gs_id (infoid,infofield,groupvalue,type,value) values (@infoid,@infofield,@group,'1',cast(@value-1 as varchar(10)))
							update gs_id set value=cast(cast(value as int)+1 as varchar(10)) where infoid=@infoid and infofield=@infofield and groupvalue=@group
							if @length<>0
								begin
								select @strtemp=right('00000000000000000000'+value,@length) from gs_id where infoid=@infoid and infofield=@infofield and groupvalue=@group
								--还有问题
								if charindex("'",@strtemp,0)>0
								   set @strtemp=''

								if @id=-12345
									set @strsql="update "+@infoid+" set "+@infofield+"="+@strFirst+"+'"+@strtemp+"' where za0100='"+@za0100+"' "
								else
									set @strsql="update "+@infoid+" set "+@infofield+"="+@strFirst+"+'"+@strtemp+"' where za0100='"+@za0100+"' and "+@infoid+"ID="+cast(@id as varchar(10))

								end

							else
								begin
								select @strtemp=value from gs_id where infoid=@infoid and infofield=@infofield and groupvalue=@group
								if charindex("'",@strtemp,0)>0
								   set @strtemp=''

								if @id=-12345
									set @strsql="update "+@infoid+" set "+@infofield+"='"+@strtemp+"' where za0100='"+@za0100+"' "
								else
									set @strsql="update "+@infoid+" set "+@infofield+"='"+@strtemp+"' where za0100='"+@za0100+"' and "+@infoid+"ID="+cast(@id as varchar(10))

								end


							exec(@strsql)
							fetch next from  curs_record into @za0100,@id,@group
							
						end
					close curs_record
					deallocate curs_record
				end

		        fetch next from  curs_gwmc into @infoid,@infofield,@restr
		end
	close Curs_gwmc
	deallocate Curs_gwmc

commit tran
SET QUOTED_IDENTIFIER OFF



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO





------------------------------------------------
-- PopFirstWord
------------------------------------------------
CREATE PROCEDURE flxp_PopFirstWord
    @SourceString   VARCHAR(4000) = NULL OUTPUT,
    @FirstWord      VARCHAR(4000) = NULL OUTPUT
 
AS
    SET NOCOUNT ON

    -- Procedure accepts a comma delimited string as the first parameter
    -- Procedure outputs the first word in the second parameter
    -- Procedure outputs the remainder of the delimeted string in the first parameter
    -- Procedure yields the length of the First Word as the return value

    DECLARE @Oldword        VARCHAR(4000)
    DECLARE @Length         INT
    DECLARE @CommaLocation  INT

    SELECT @Oldword = @SourceString

    IF NOT @Oldword IS NULL
    BEGIN
        SELECT @CommaLocation = CHARINDEX(',',@Oldword)
        SELECT @Length = DATALENGTH(@Oldword)

        IF @CommaLocation = 0
        BEGIN
            SELECT @FirstWord = @Oldword
            SELECT @SourceString = NULL

            RETURN 0
        END

        SELECT @FirstWord = SUBSTRING(@Oldword, 1, @CommaLocation -1)
        SELECT @SourceString = SUBSTRING(@Oldword, @CommaLocation + 1, @Length - @CommaLocation)

        RETURN @Length - @CommaLocation
    END

    RETURN 0
------------------------------------------------

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO













CREATE                      PROCEDURE   flxp_SQL_Requery  
@StrZA0100 varchar(500),--编号
@StrField  varchar(500),--显示字段串'aa0101','aa0102'
@StrMainObject varchar(4),--显示对象
@strOut varchar(8000) output--输出
 
AS

declare @strSQl varchar(8000)
declare @strTBL varchar(1000)
declare @field varchar(20)
declare @fieldname varchar(20)
declare @strtemp varchar(8000)
declare @strdatatype varchar(10)

declare @dictid as varchar(20)
set @strtemp=''

set @strOut = ''

SET QUOTED_IDENTIFIER OFF  
--set @strTBL= @StrMainObject + " where " + @StrMainObject + ".ZA0100 = '" + @StrZA0100 + "' and " + @StrMainObject + ".ZC9993 = '1' " 
set @strTBL= @StrMainObject + " where " + @StrZA0100

if	@StrField = ''
	set @strSql = "declare curs_g cursor for select InfoField,Description from gs_property where infoid = '"+ @StrMainObject +"' and propertySet = '0' order by orderNo open curs_g"
else
	set @strSql = "declare curs_g cursor for select InfoField,Description from gs_property where infoid = '"+ @StrMainObject +"' and InfoField in (" + @StrField + ") and propertySet = '0' order by orderNo open curs_g"
exec(@strsql)

fetch next from  curs_g into @field,@fieldname
while(@@fetch_status=0)
	begin
	
		select @dictid=isnull(dictid,'') from gs_property where infoid +'.'+infofield= @StrMainObject+'.'+@field
		select @strdatatype=isnull(DataType,'1') from gs_property where infoid +'.'+infofield= @StrMainObject+'.'+@field
	
		if len(@dictid)<=1	
			begin		
				if (@strtemp='')
					if @strdatatype = '5' 
						set @strtemp= "CONVERT(varchar(10)," + @field + ",21)"+" as '"+@fieldname + "." + @strdatatype + "' "
					else if @strdatatype = '4'
						set @strtemp= "CONVERT(varchar(7)," + @field + ",21)"+" as '"+@fieldname + "." + @strdatatype + "' "
					else if @strdatatype = '3'
						set @strtemp= "CONVERT(varchar(4)," + @field + ",21)"+" as '"+@fieldname + "." + @strdatatype + "' "
					else
						set @strtemp=@field+" as '"+@fieldname + "." + @strdatatype + "' "
				else	
					if @strdatatype = '5' 
						set @strtemp= @strtemp + "," + "CONVERT(varchar(10)," + @field + ",21)"+" as '"+@fieldname + "." + @strdatatype + "' "
					else if @strdatatype = '4'
						set @strtemp= @strtemp + "," + "CONVERT(varchar(7)," + @field + ",21)"+" as '"+@fieldname + "." + @strdatatype + "' "
					else if @strdatatype = '3'
						set @strtemp= @strtemp + "," + "CONVERT(varchar(4)," + @field + ",21)"+" as '"+@fieldname + "." + @strdatatype + "' "
					else
						set @strtemp=@strtemp + "," + @field+" as '"+@fieldname + "." + @strdatatype + "' "
			end
		else if len(@dictid)<=2
			begin
			if (@strtemp='')
					set @strtemp="(select description from gs_dictitem where dictid='"+@dictid+"' and dictvalue="+@field+") as '"+@fieldname+ "." + @strdatatype + "' "
				else	
					set @strtemp=@strtemp+",(select description from gs_dictitem where dictid='"+@dictid+"' and dictvalue="+@field+") as '"+@fieldname+ "." + @strdatatype + "' "
			end
		else
			begin
				if (@strtemp='')
					set @strtemp="(select za0101 from "+left(@dictid,4)+" where za0100="+@field+") as '"+@fieldname+ "." + @strdatatype + "' "
				else	
					set @strtemp=@strtemp+",(select za0101 from "+left(@dictid,4)+" where za0100="+@field+") as '"+@fieldname+ "." + @strdatatype + "' "
			end

		fetch next from  curs_g into @field,@fieldname
	end
close Curs_g
deallocate Curs_g

set @strtemp="select "+@strtemp+"," +@StrMainObject+".ZA0100 from "+@strTBL

set @strOut=@strtemp












GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO




CREATE    PROCEDURE  flxp_code_change 
@dictid varchar(20),
@beforeCode varchar(20),
@afterCode varchar(20)=null
 
AS

SET QUOTED_IDENTIFIER OFF 
if @aftercode=''
	set @aftercode=null
if @beforeCode=''
	set @beforeCode=null
declare @strsql varchar(2000)
declare @infoid varchar(4)
declare @infofield varchar(10)
if(len(@dictid)=2)
	set @strSQl=" declare curs_gwmc cursor for select infoid,infofield from gs_property where state='1'  and upper(dictid)='"+upper(@dictid)+"'  open curs_gwmc"
else
	set @strSQl=" declare curs_gwmc cursor for select infoid,infofield from gs_property where state='1'  and upper(substring(dictid,1,4))='"+upper(substring(@dictid,1,4))+"'  open curs_gwmc"
exec(@strsql)
fetch next from  curs_gwmc into @infoid,@infofield
while(@@fetch_status=0)
	begin
		if @aftercode is null or upper(@aftercode)='NULL'
			begin
			set @strSQl="update "+@infoid+" set "+@infofield+"=null where "+@infofield+"='"+@beforecode+"'"
			end
		else
			begin
			set @strSQl="update "+@infoid+" set "+@infofield+"='"+@afterCode+"' where "+@infofield+"='"+@beforecode+"'"
			end
		if @aftercode is null and @beforecode is null
			begin
				set @strSQl="update "+@infoid+" set "+@infofield+"=null "
			end
		exec(@strsql)
		fetch next from  curs_gwmc into @infoid,@infofield

	end
close Curs_gwmc
deallocate Curs_gwmc

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO





--该存储过程生成一个统计报表的结构，具体充填一张表时可通过拷贝方式处理
CREATE  PROCEDURE  flxp_create_AppTable
 @typeNo  int,
 @setTableNo int,
 @tableNo int
 
    AS
--set @typeno=1
--set @settableno=1
--set @tableno=1 
--生成的数据表表名
--生成的数据表表名
declare @tableName varchar(50)
--下面都是临时变量
declare @strSQL varchar(1000)
declare @row int
declare @col int
declare @type varchar(10)
declare @Count int 
declare @i int
set @row=0
set @col=0
set @i=1
SET QUOTED_IDENTIFIER OFF
--生成表名
set @tablename='T'+cast(@typeNo as varchar(10))+'_'+cast(@settableno as varchar(10))+'_'+cast(@tableno as varchar(10))
set @strsql="if exists (select * from dbo.sysobjects where id = object_id(N'[dbo]."+@tablename +"') and OBJECTPROPERTY(id, N'IsUserTable') = 1)   drop table [dbo].["+@tablename+"]"
exec(@strsql)
--删除r220
set @strsql='delete from r220 where typeno=' + cast(@typeNo as varchar(10))+" and settableno="+cast(@settableno as varchar(10))+" and tableno="+cast(@tableno as varchar(10))
exec(@strsql)
--产生表结构
set @strsql="create table  [dbo].["+@tablename+"](zb0110 varchar(20)  null,ROWid int  null,starttime varchar(20)  null,zc9993 varchar(1))  "
--set @strsql=@strSQL+" ALTER TABLE [dbo].["+@tableName+"] WITH NOCHECK ADD  	CONSTRAINT [PK_"+@tablename+"] PRIMARY KEY  CLUSTERED (ZB0110,s,STARTTIME) ON  [PRIMARY] "
exec(@strsql)
set @strsql="ALTER TABLE "+@tableName +" ADD  C1  numeric(17,4)  null  CONSTRAINT AddDateDflt"+@tablename+"C1 DEFAULT 0  WITH VALUES"
exec(@strsql)
set @strsql="insert into  "+@tableName +" (rowid) values(1)"
exec(@strsql)

--根据r202来决定表的结构
set @strsql="declare curs_gwmc cursor for select serialType,iCount from r202 where typeno="+cast(@typeno as varchar(10))+" and settableno="+cast(@settableno as varchar(10))+" and tableno="+cast(@tableno as varchar(10))+" and (serialtype=2 or serialtype=1)  open curs_gwmc"
exec(@strsql)

--下面向表中增加行或列，由于存在着多个序列，因而增加变量row和col来记录
fetch next from  curs_gwmc into @type,@Count
while(@@fetch_status=0)
	begin

		set @i=1
		if(@type=1)
			begin
				if(@row=0) set @i=2
				while(@i<=@count)
				begin
					--行处理

					set @strsql="insert into  "+@tableName +" (rowid) values("+ cast(@i+@row as varchar(3))+ ")"
					exec(@strsql)
					set @i=@i+1
				end
				set @row=@row+@count
			end
		else
			begin
				if(@col=0) set @i=2
				while(@i<=@count)
				begin
					--列处理,同时增加默认值
					set @strsql="ALTER TABLE "+@tableName +" ADD  C"+ cast(@col+@i as varchar(3))+"  numeric(17,4)  null  CONSTRAINT AddDateDflt"+@tablename+"C"+cast(@col+@i as varchar(3))+" DEFAULT 0  WITH VALUES"
					exec(@strsql)
					set @i=@i+1
				end
				set @col=@col+@count
			end
			fetch next from  curs_gwmc into @type,@Count
	end
close Curs_gwmc
deallocate Curs_gwmc
SET QUOTED_IDENTIFIER on



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO







--处理SQL语句的常量、表达式、函数、组成SQL语句
CREATE    PROCEDURE  flxp_create_condition
@strMainObject varchar(4),
--@strTBL varchar(100),
--@strFLD varchar(500),
--@strCON varchar(500),
--@strEXP varchar(500),
--@strFUN varchar(500),
@strSQL varchar(8000),
@stroutSQL varchar(8000) out
 
  AS
	
	SET QUOTED_IDENTIFIER OFF  
	declare @tempSQL varchar(5000)
        declare @declareSQL varchar(1000)
	declare @createSQL varchar(1000)
	declare @SQL varchar(2000)
	declare @za0101 varchar(50)
	declare @value varchar(500)
	--处理字符串长度的变量
	declare @length int
	declare @ItemIdList varchar(5000)
	declare @FirstItemIdWord varchar(1000)
	declare @strTBL varchar(100)

	set @ItemIdList=@strSQL
	set @strTBL=''

---------------------------------------------------

			SELECT @Length = DATALENGTH(@strSQL)
		
			    WHILE @Length > 0
			    BEGIN
				--从表名字串中取出表名
			   	 EXECUTE @Length = Zwd_PopFirstWord @ItemIdList OUTPUT, @FirstItemIdWord OUTPUT,'['
				if(substring(@FirstItemIdWord,5,1)='.')
				begin
				if @strTBL=''
					set @strTBL=left(@FirstItemIdWord,4)
				else 
					set @strTBL=@strTBL+','+left(@FirstItemIdWord,4)

				end
			     end

-----------------------------------------------------


	EXECUTE flxp_info_combTable @strTBL, @strMainObject,null,@tempSQL output
	set @strTBL=@tempSQL
	set @tempSQL=@strSQL
	set @ItemIdList=''
	--处理常量
		set @strsql="declare curs_gwmc cursor for select za0101,ec0111 from ec01  open curs_gwmc"
		exec(@strsql)
	        	fetch next from  curs_gwmc into @za0101,@value
		while(@@fetch_status=0)
			begin
				
				set @tempSQL=replace(@tempSQL,'$'+@za0101,@value)
			        	fetch next from  curs_gwmc into @za0101,@value
			end
		close Curs_gwmc
		deallocate Curs_gwmc
	--处理函数
	declare @ed0114 varchar(100)

		set @strSQL="declare curs_gwmc cursor for select za0101,ed0110 from ed01 where ed0111 in ('0','1')  open curs_gwmc"
		exec(@strsql)
	        	fetch next from  curs_gwmc into @za0101,@value
		while(@@fetch_status=0)
			begin
				if(@za0101='数字开始时间' or @za0101='数字截止时间')
					set @tempSQL=replace(@tempSQL,'#'+@za0101,'getdate()')
				else
							set @tempSQL=replace(@tempSQL,'#'+@za0101,@value)
			        	fetch next from  curs_gwmc into @za0101,@value
			end
		close Curs_gwmc
		deallocate Curs_gwmc
	--处理表达式的前五种

	set @declareSQL=''
		set @strSQL=" declare Curs_gwmc cursor for 	select za0101,ee0114  from ee01  where  ee0115<>'6'  open curs_gwmc"
		exec(@strsql)

	        	fetch next from  curs_gwmc into @za0101,@value
		while(@@fetch_status=0)
			begin
				
				set @declareSQL=@declareSQL +' '+@value
				--将SQL语中的^加变量替换成@加变量
				set @tempSQL=replace(@tempSQL,'^'+@za0101,'('+@value+')')
			        	fetch next from  curs_gwmc into @za0101,@value
			end
		close Curs_gwmc
		deallocate Curs_gwmc



			set @strSQL=" declare Curs_gwmc cursor for 	select za0101,ee0114  from ee01  where   ee0115='6'  open curs_gwmc"
		exec(@strsql)
	        	fetch next from  curs_gwmc into @za0101,@value
		while(@@fetch_status=0)
			begin
				
				set @tempSQL=replace(@tempSQL,'^'+@za0101,'['+@za0101+']')
			        	fetch next from  curs_gwmc into @za0101,@value
			end
		close Curs_gwmc
		deallocate Curs_gwmc
        set  @stroutSQL="select "+@strMainObject+".za0100 from "+@strTBL+" where "+@tempSQL
	set @stroutsql=replace(@stroutsql,'[','')
	set @stroutsql=replace(@stroutsql,']','')

	SET QUOTED_IDENTIFIER on





GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO




CREATE               PROCEDURE  flxp_info_GZBF
 @usercondition varchar(500),--用户条件
 @modulecondition varchar(500),--模块条件
 @setCondition varchar(500),--帐套条件
 @typecondition varchar(500),--业务类别条件
 @SetNo varchar(10), --帐套号
 @TypeNo varchar(10), --类别号
 @sDate  DateTime
AS

SET QUOTED_IDENTIFIER OFF 
declare @strsql varchar(1000)
declare @strwhereSQL varchar(1000)
declare @strDate varchar(10)
declare @strIns varchar(1000)
declare @intDate int

declare @strDatetmp DateTime

set @strDate = cast(@sDate as varchar(10))
set @strwhereSQL = " AA58.ZA0100 not in ( select AA01.ZA0100 from AA01 where isnull(ZD0010,'0') = '0')"
if (@usercondition <> '')
	set @strwhereSQL = @strwhereSQL + "AA58.ZA0100 in (" + @usercondition + ")"

if (@modulecondition <> '')
	begin
		if(@strwhereSQL <> '')
			set @strWhereSQL = @strWhereSQL + " and AA58.ZA0100 in (" + @modulecondition + ")"
		else
			set @strWhereSQL = " AA58.ZA0100 in (" + @modulecondition + ")"
	end

if (@setCondition <> '')
	begin
		if(@strwhereSQL <> '')
			set @strWhereSQL = @strWhereSQL + " and AA58.ZA0100 in (" + @setCondition + ")"
		else
			set @strWhereSQL = " AA58.ZA0100 in (" + @setCondition + ")"
	end

if (@typecondition <> '')
	begin
		if(@strwhereSQL <> '')
			set @strWhereSQL = @strWhereSQL + " and AA58.ZA0100 in (" + @typecondition + ")"
		else
			set @strWhereSQL = " AA58.ZA0100 in (" + @typecondition + ")"
	end


set @strsql = " declare curs_gwmc cursor for select distinct AA58.ZD0003 as ff  from AA58 where isnull(AA58.ZD0002,'0') = '0' and AA58.ZC9993 = '1' and " + @strWhereSQL + "   open curs_gwmc "
--print @strsql
exec(@strsql)
		fetch next from  curs_gwmc into @strDate

	while(@@fetch_status=0)
		begin
			set @intDate = DATEDIFF(Month,cast(@strDate as DateTime),@sDate)
			set @strDatetmp = cast(@strDate as DateTime)

			WHILE @intDate >= 1
			begin
				set @strIns = " insert into GZBF(ZA0100,ZTCode,SendType,BfMonth) select AA58.ZA0100," + @SetNo + "," + @TypeNo + ",'" + @strDate + "' from aa58  where  isnull(AA58.ZD0002,'0') = '0' and AA58.ZC9993 = '1' and ZD0003 = '" + convert(varchar(10),cast(@strDatetmp as DateTime),21) + "' and " + @strWhereSQL
				exec(@strIns)
				set @strDate = DATEADD(Month,1,@strDate)
				set @intDate = @intDate-1
			end

			fetch next from  curs_gwmc into @strDate

		end
	close Curs_gwmc
	deallocate Curs_gwmc
set @strsql = "update AA58 set ZD0002 = '1' where isnull(AA58.ZD0002,'0') = '0' and AA58.ZC9993 = '1' and " + @strWhereSQL
exec(@strsql)



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO



CREATE PROCEDURE  flxp_info_bhdeal 
@mainObject varchar(4)
 
AS

SET QUOTED_IDENTIFIER OFF 

declare @strsql varchar(2000)
declare @intLen int
declare @I int

set @strSQl=" declare curs_gwmc cursor for select isnull(max(distinct(len(za0101))),0) from "+@mainObject+"   open curs_gwmc"
exec(@strsql)
fetch next from  curs_gwmc into @intlen
close Curs_gwmc
deallocate Curs_gwmc
print @intlen
set @i=1
while (@intlen>0)
begin
	if @i=1
		set @strsql="update "+@mainObject+"        set zc9995=(select isnull(dp0104,'') from dp01 where      left("+@mainObject+".za0101,1)=dp01.za0101 )                                 where left("+@mainObject+".za0101,"+cast(@i as varchar(10))+") in (select za0101 from dp01)   and   len("+@mainObject+".za0101)>="+cast(@i as varchar(10))

	else
		set @strsql="update "+@mainObject+" set zc9995=zc9995+(select isnull(dp0104,'') from dp01 where substring("+@mainObject+".za0101,"+cast(@i as varchar(10))+",1)=dp01.za0101) where substring("+@mainObject+".za0101,"+cast(@i as varchar(10))+",1) in (select za0101 from dp01) and   len("+@mainObject+".za0101)>="+cast(@i as varchar(10))

	exec(@strsql)
	set @i=@i+1
	set @intlen=@intlen-1

end



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO












CREATE          PROCEDURE   flxp_info_combTable  
 @TBL varchar(1000),--表名
 @strMainObject varchar(100),--主对象名
 @ishistory varchar(1)=null,
 @strOut varchar(6000) output--输出
AS
declare @strSQl varchar(6000)
declare @strTBL varchar(6000)
declare @length int
declare @ItemIdList varchar(5000)
declare @FirstItemIdWord varchar(1000)
declare @strtemp varchar(100)
declare @strTempTable varchar(1000)
--向关联字段中填加名称
SET QUOTED_IDENTIFIER OFF  
if charindex('left join',@TBL,1)>0
	begin
 		set @strTBL=@TBL
		set @ItemIdList=@strMainObject
		SELECT @Length = DATALENGTH(@ItemIdList)
		    WHILE @Length > 0
		    BEGIN
   			 EXECUTE @Length = flxp_PopFirstWord @ItemIdList OUTPUT, @FirstItemIdWord OUTPUT
			 if(charindex(left(@FirstItemIdWord,4),@strTBL,1)<=0 )
			 begin
				if @ishistory='1'
					set @strTBL=@strTBL+" left join " +left(@FirstItemIdWord,4) +" on "+left(@FirstItemIdWord,4)+".za0100="+left(@strTBL,4)+".za0100  "
				else
					set @strTBL=@strTBL+" left join " +left(@FirstItemIdWord,4) +" on "+left(@FirstItemIdWord,4)+".za0100="+left(@strTBL,4)+".za0100 and "+left(@FirstItemIdWord,4)+".zc9993='1' "
			 end
		    end
		
	end
else
begin
	set @strTempTable=@strMainObject
	set @strTBL=@strMainObject+" "
		--表名
		set @ItemIdList=@TBL

		SELECT @Length = DATALENGTH(@ItemIdList)
		    WHILE @Length > 0
	
		    BEGIN
   			 EXECUTE @Length = flxp_PopFirstWord @ItemIdList OUTPUT, @FirstItemIdWord OUTPUT
			if(charindex(left(@FirstItemIdWord,4),@strTempTable,1)<=0      and left(@FirstItemIdWord,4)<>'')
				begin
				     set 	@strTempTable=@strTempTable+"~"+left(@FirstItemIdWord,4)
					if(left(@strMainObject,2)=left(@FirstItemIdWord,2))
					begin
						if @ishistory='1'
							set @strTBL=@strTBL+" left join " +left(@FirstItemIdWord,4) +" on "+@strMainObject+".za0100="+left(@FirstItemIdWord,4)+".za0100  and "+@strMainObject+".zc9993='1'"
						else
							set @strTBL=@strTBL+" left join " +left(@FirstItemIdWord,4) +" on "+@strMainObject+".za0100="+left(@FirstItemIdWord,4)+".za0100 and "+left(@FirstItemIdWord,4)+".zc9993='1' and "+@strMainObject+".zc9993='1'"
			
					end
					else if(left(@strMainObject,2)<>left(@FirstItemIdWord,2) and substring(@FirstItemIdWord,3,2)='01' )
		
						begin
							set @strSQl=" declare curs_gwmc cursor for select top 1 isnull(infofield,'ZA0100') from gs_property where left(dictid,4)='"+left(@FirstItemIdWord,4)+"' and infoid='"+@strMainObject+"'   open curs_gwmc"
							exec(@strsql)
							fetch next from  curs_gwmc into @strtemp
							close Curs_gwmc
							deallocate Curs_gwmc
							set @strTBL=@strTBL+" left join "+left(@FirstItemIdWord,4)+" on "+@strMainObject+"."+@strtemp+"="+left(@FirstItemIdWord,4)+".za0100 and "+@strMainObject+".zc9993='1'"--and "+@FirstItemIdWord+".zc9993='1' "
						end
					else
						begin
							set @strSQl="declare curs_gwmc cursor for  select top 1 isnull(infofield,'ZA0100') from gs_property where left(dictid,4)='"+left(@FirstItemIdWord,2)+"01' and infoid='"+@strMainObject+"'  open curs_gwmc"
							exec(@strsql)
							fetch next from  curs_gwmc into @strtemp
							close Curs_gwmc
							deallocate Curs_gwmc
							if @ishistory='1'
								set @strTBL=@strTBL+" left join "+left(@FirstItemIdWord,4)+"  on "+@strMainObject+"."+@strtemp+"="+left(@FirstItemIdWord,4)+".za0100 and "+@strMainObject+".zc9993='1'"
							else
								set @strTBL=@strTBL+" left join "+left(@FirstItemIdWord,4)+"  on "+@strMainObject+"."+@strtemp+"="+left(@FirstItemIdWord,4)+".za0100 and "+left(@FirstItemIdWord,4)+".zc9993='1' and "+@strMainObject+".zc9993='1'"

						end
				end
		    end 
end
		set @strOut=@strTBL

print @strOut





GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO







CREATE     PROCEDURE  flxp_info_dealformula 
 @formulaid varchar(5000),
 @rycondtion varchar(2000)=null
 
AS

-- @Mainobject varchar(4) ,--主对象
 --@infoid varchar(4),--表
 --@infofield varchar(6),--字段 
 --@formulaSQL varchar(1000),--公式
 --@formulaFieldname varchar(100),--字段列表,if 次数，表名
 --@Condition varchar(1000),--使用范围
 --@subCondition varchar(1000),--子条件
 --@Fieldtype varchar(1),--类型
 --@isHistory varchar(1)--历史


SET QUOTED_IDENTIFIER OFF 
declare @strsql varchar(2000)
declare  @mainobject varchar(4)
declare @infoid varchar(4)
declare @infofield varchar(6)
declare @formulaSQL varchar(1000)
declare @formulaFieldname varchar(400)
declare @Condition varchar(1000)
declare @subCondition varchar(1000)
declare @Fieldtype varchar(1)
declare @isHistory varchar(1)
declare @strwhere varchar(2000)

--flag是计算的表示
--formulaflag修该过的计算标志
set @strSQl=" declare curs_g cursor for select mainobject,infoid,infofield,isnull(fieldtype,'2'),isnull(condition,''),isnull(subcondition,''),isnull(formulasql,''),isnull(formulafieldname,''),isnull(ishistory,'0') from gs_formula where  formulaid in ("+@formulaid+") and flag='1' order by orderno  open curs_g"
exec(@strsql)
fetch next from  curs_g into @mainobject,@infoid,@infofield,@Fieldtype,@Condition,@subCondition,@formulaSQL,@formulaFieldname,@isHistory
while(@@fetch_status=0)
	begin
		execute flxp_info_formula @mainobject,@infoid,@infofield,@formulaSQL,@formulaFieldname,@Condition,@subCondition,@Fieldtype,@isHistory,@rycondtion
		fetch next from  curs_g into @mainobject,@infoid,@infofield,@Fieldtype,@Condition,@subCondition,@formulaSQL,@formulaFieldname,@isHistory
	end
close Curs_g
deallocate Curs_g
--set @strSQl="update gs_formula set formulaflag='1'  where userid='"+@userid+"' and funcid='"+@funcid+"' and flag='1'  and formulaflag='0'  "
--exec(@strsql)





GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

--select * from gs_formula
CREATE                                          PROCEDURE flxp_info_formula 
 @Mainobject varchar(4) ,--主对象
 @infoid varchar(4),--表
 @infofield varchar(6),--字段 
 @formulaSQL varchar(1000),--公式
 @formulaFieldname varchar(500),--字段列表,if 次数，表名
 @Condition varchar(1000),--使用范围
 @subCondition varchar(1000),--子条件
 @Fieldtype varchar(1),--类型
 @isHistory varchar(1),--历史
 @rycondition varchar(2000)
 
AS
--计算方式是分类处理
--1.无参数，2一个参数，3两个参数4，历史记录，5特殊处理 
--1,2,3
declare @strwhereSQL varchar(1000)
declare @za0101 varchar(1000)
declare @value varchar(500)
declare @ed0114 varchar(100)
declare @strsql varchar(2000)
declare @FirstItemIdWord varchar(100)
declare @style varchar(10)--1正数，2倒数
declare @num varchar(10)--个数
declare @length int
declare @tablename varchar(1000)
declare @strtempSQL varchar(1000)
declare @ItemIdList varchar(2000)
declare @datatype varchar(10)
declare @intNum int

--declare  @Mainobject varchar(4)--主对象
--declare   @infoid varchar(4)--表
--declare   @infofield varchar(6)--字段
--declare   @formulaSQL varchar(1000)--公式
--declare   @formulaFieldname varchar(100)--字段列表,if 次数，表名
--declare   @Condition varchar(1000)--使用范围
--declare   @subCondition varchar(1000)--子条件
--declare   @Fieldtype varchar(1)--类型
--declare   @isHistory varchar(1)--历史
--set @Mainobject='AA01'
--set @infoid='AA01'
--set @infofield='wl1'
--set @formulaSQL='#进元(int,[aa01.aa01id])'
--set @formulaFieldname='aa01.aa01id'
--set @Fieldtype='3'
--set @ishistory='1'
--set @Condition=''
--set @subCondition=''
SET QUOTED_IDENTIFIER OFF 
if(isnull(@rycondition,'')='')
	begin
	set @rycondition="1=1"
	end
else
    if upper(left(ltrim(@rycondition),6))='SELECT'
	begin
	set @rycondition=@infoid+".za0100 in ("+@rycondition+")"
	end
    else
	begin
	set @rycondition=@infoid+".za0100 in (select za0100 from "+ @Mainobject+" where "+@rycondition+")"
	end
if(isnull(@Condition,'')='')
	begin
		if charindex('汇总',@formulaSQL,1)<=0
			begin
				set @Condition="1=1"
			end
	end
else
	begin
		if charindex('汇总',@formulaSQL,1)<=0
		begin
			set @Condition=@infoid+".za0100 in ("+@Condition+") "
		end
		--	set @Condition="za0100 in ("+@Condition+") "
	end

if(isnull(@subCondition,'')='')
	begin
	set @subCondition='1=1'
	end
--else
--	set @subCondition=@infoid+"."+@Condition

set @strwhereSQL=@formulaSQL

if not  (charindex('税前',@formulaSQL,1)>0  or charindex('扣税',@formulaSQL,1)>0  or charindex('扣零',@formulaSQL,1)>0  or charindex('税后',@formulaSQL,1)>0  or charindex('取描述',@formulaSQL,1)>0  or charindex('上层',@formulaSQL,1)>0  or charindex('下层',@formulaSQL,1)>0  or  charindex('次数',@formulaSQL,1)>0  or charindex('取值',@formulaSQL,1)>0 or charindex('计算',@formulaSQL,1)>0 or charindex('汇总',@formulaSQL,1)>0 or charindex('简拼',@formulaSQL,1)>0 )
begin
if charindex('#分情况',@formulaSQL,1)>0
	begin
		set @strwhereSQL=replace(@strwhereSQL,"#分情况","case")
		set @strwhereSQL=replace(@strwhereSQL,"如果","when")
		set @strwhereSQL=replace(@strwhereSQL,"那么","then")
		set @strwhereSQL=replace(@strwhereSQL,"否则","else")
		set @strwhereSQL=replace(@strwhereSQL,"结束","end")
	select @datatype=datatype from gs_property where infoid=@infoid and infofield=@infofield
	set @intNum=0
	select @intnum=count(*) from ed01 where charindex(za0101,@formulaSQL)>0
	if @datatype='2'  and @intNum>=1
		begin
			set @ItemIdList=@formulaFieldname
			SELECT @Length = DATALENGTH(@formulaFieldname)
			    WHILE @Length > 0
			    BEGIN
			   	 EXECUTE @Length = flxp_PopFirstWord @ItemIdList OUTPUT, @FirstItemIdWord OUTPUT
				set @strwhereSQL=replace(@strwhereSQL,@FirstItemIdWord,"isnull("+@FirstItemIdWord+",0)")
		    end 
		end

		set @strwhereSQL=replace(@strwhereSQL,"[",'')
		set @strwhereSQL=replace(@strwhereSQL,"]",'')
	end
else 
begin
if(isnull(@rycondition,'')='1=1')
	begin
	set @rycondition=@Mainobject+".zc9993='1' "
	end

if(isnull(@Condition,'')='1=1')
	set @Condition=@Mainobject+".zc9993='1' "


	set @strSQL="declare curs_gwmc cursor for select isnull(za0101,''),isnull(ed0110,'') from ed01 where za0101<>'数字开始时间' and  za0101<>'数字截止时间'  open curs_gwmc"

	exec(@strsql)
		fetch next from  curs_gwmc into @za0101,@value
	while(@@fetch_status=0)
		begin
			set @strwhereSQL=replace(@strwhereSQL,"#"+@za0101,@value)
			fetch next from  curs_gwmc into @za0101,@value

		end
	close Curs_gwmc
	deallocate Curs_gwmc
	set @strwhereSQL=replace(@strwhereSQL,"[",'')
	set @strwhereSQL=replace(@strwhereSQL,"]",'')
	if @isHistory='1'
	 begin
	if charindex(@infoid,@formulaFieldname+","+@Mainobject,1)<=0
		 EXECUTE  flxp_info_combTable @formulaFieldname,@Mainobject,'0', @tablename output
        else
		 EXECUTE  flxp_info_combTable @formulaFieldname,@Mainobject,'1', @tablename output

		if charindex(@infoid,@tablename,1)<=0
			 EXECUTE  flxp_info_combTable @tablename,@infoid,'1', @tablename output
         end
	else
	  begin
	 EXECUTE  flxp_info_combTable @formulaFieldname,@Mainobject,'0', @tablename output
	if charindex(@infoid,@tablename,1)<=0
		 EXECUTE  flxp_info_combTable @tablename,@infoid,'0', @tablename output
          end
       if(@tablename = '' or @tablename = null)
		set @tablename = @Mainobject
	set @strsql=''
	--if (@tablename<>@infoid)
	--	set @strsql='update ' +@infoid+" set "+@infofield+" = "+@strwhereSQL+" from "+@tablename+" where "+@Condition+" and "+@infoid+".zc9993='1' and "+@rycondition

	--else

	if(@strwhereSQL='')
		set @strwhereSQL="null"
	set @intNum=0
	select @intnum=count(*) from ed01 where charindex(za0101,@formulaSQL)>0
	select @datatype=datatype from gs_property where infoid=@infoid and infofield=@infofield

------  
        if @datatype='4'
		begin
		if(len(ltrim(@strwhereSQL))=9 and substring(ltrim(@strwhereSQL),6,1)='-' and substring(ltrim(@strwhereSQL),2,4)>='1900' and substring(ltrim(@strwhereSQL),2,4)<='2600' and substring(ltrim(@strwhereSQL),7,2)>='01' and substring(ltrim(@strwhereSQL),7,2)<='12')
			begin
			set @strwhereSQL="'"+replace(@strwhereSQL,"'","")+"-28'"
			end
		else
			begin
			set @strwhereSQL='null'
			end
		end
        else if @datatype='3'
		begin
		if(len(@strwhereSQL)=4  and substring(ltrim(@strwhereSQL),2,4)>='1900' and substring(ltrim(@strwhereSQL),2,4)<='2600')
			begin
			set @strwhereSQL="'"+replace(@strwhereSQL,"'","")+"-12-31'"
			end
		else
			begin
			set @strwhereSQL='null'
			end
		end
	else if @datatype='2'  and @intNum<=0
		begin
			set @ItemIdList=@formulaFieldname
			SELECT @Length = DATALENGTH(@formulaFieldname)
			    WHILE @Length > 0
			    BEGIN
			   	 EXECUTE @Length = flxp_PopFirstWord @ItemIdList OUTPUT, @FirstItemIdWord OUTPUT
				set @strwhereSQL=replace(@strwhereSQL,@FirstItemIdWord,"isnull("+@FirstItemIdWord+",0)")
		    end 
		end

	else if (@datatype='0' or @datatype='1' or @datatype='6' or @datatype='10' or @datatype='12' or @datatype='13') and @intNum<=0
		begin
		--declare @ItemIdList varchar(2000)
		set @ItemIdList=@formulaFieldname
		SELECT @Length = DATALENGTH(@formulaFieldname)
		    WHILE @Length > 0
		    BEGIN
			--从表名字串中取出表名
	
		   	 EXECUTE @Length = flxp_PopFirstWord @ItemIdList OUTPUT, @FirstItemIdWord OUTPUT
			set @strwhereSQL=replace(@strwhereSQL,@FirstItemIdWord,'isnull('+@FirstItemIdWord+",'')")
		    end 

		end
end
---------

	if(@isHistory='1')
		begin
		if isnull(ltrim(@tablename),'')=''
			begin
				set @strsql='update ' +@infoid+" set "+@infofield+" = "+@strwhereSQL+"  where  " +@Condition+" and "+@rycondition--历史
			end
		else
			begin
			if len(@tablename)>=5
				set @tablename =@tablename+" and "+@subCondition
				set @strsql='update ' +@infoid+" set "+@infofield+" = "+@strwhereSQL+" from "+@tablename +" where  " +@Condition+" and "+@rycondition--历史
			end
		end
	else
		if isnull(@tablename,'')=''
			begin
		 		set @strsql='update ' +@infoid+" set "+@infofield+" = "+@strwhereSQL+"  where "+@infoid+".zc9993='1' and "+@Condition+" and "+@rycondition--非历史
			end
		else
			begin
		 		set @strsql='update ' +@infoid+" set "+@infofield+" = "+@strwhereSQL+" from "+@tablename+" where "+@infoid+".zc9993='1' and "+@Condition+" and "+@rycondition--非历史
			end

end
else if charindex('次数',@formulaSQL,1)>0
	    set @strsql='update ' +@infoid+" set "+@infofield+" = 次数.次数  from ( select za0100,count(*) as 次数  from "+left(@formulaFieldname,4)+" where "+@Condition+" and  "+@subCondition+" and "+@rycondition+" group by  za0100 ) as  次数  where 次数.za0100="+@infoid+".za0100 "

else if charindex('取值',@formulaSQL,1)>0
begin
   set	@Length=len(@formulaFieldname)
    --@FirstItemIdWord字段，@num：记录数,@style1正数2倒数
    EXECUTE @Length = flxp_PopFirstWord @formulaFieldname OUTPUT, @FirstItemIdWord OUTPUT
    EXECUTE @Length = flxp_PopFirstWord @formulaFieldname OUTPUT, @num OUTPUT
    EXECUTE @Length = flxp_PopFirstWord @formulaFieldname OUTPUT, @style OUTPUT

    set @Length=cast(@num as int)
    set @strsql="update "+left(@FirstItemIdWord,4)+" set zc9995='' "
    exec(@strsql)
if(@isHistory='1')
    if(@style='1')
	begin

		while(@Length>1 )
		begin
			set @strsql="update "+left(@FirstItemIdWord,4)+" set zc9995='*' where   za0100+cast("+left(@FirstItemIdWord,4)+"id as varchar(10))+ZC9995 in (select za0100+cast(min("+left(@FirstItemIdWord,4)+"id) as varchar(10))+ZC9995 from "+left(@FirstItemIdWord,4)+" WHERE ZC9995<>'*' group by za0100,ZC9995) "
			exec(@strsql)
			set @Length=@Length-1 
		end
		if (@Condition=' 1=1 ')

	 		 set @strsql='update ' +@infoid+" set "+@infofield+" =kk."+right(@FirstItemIdWord,6)+"  from ( select za0100,"+@FirstItemIdWord+"  from "+left(@FirstItemIdWord,4)+" where  za0100+cast("+left(@FirstItemIdWord,4)+"id as varchar(10))+ZC9995 in (select za0100+cast(min("+left(@FirstItemIdWord,4)+"id ) as varchar(10))+ZC9995 from "+left(@FirstItemIdWord,4)+" WHERE ZC9995<>'*' group by za0100,ZC9995)) as kk  where kk.za0100="+@infoid+".za0100  and "+@subCondition+" and  "+@rycondition
		else
			 set @strsql='update ' +@infoid+" set "+@infofield+" =kk."+right(@FirstItemIdWord,6)+"  from ( select za0100,"+@FirstItemIdWord+"  from "+left(@FirstItemIdWord,4)+" where  za0100+cast("+left(@FirstItemIdWord,4)+"id as varchar(10))+ZC9995 in (select za0100+cast(min("+left(@FirstItemIdWord,4)+"id ) as varchar(10))+ZC9995 from "+left(@FirstItemIdWord,4)+" WHERE ZC9995<>'*' group by za0100,ZC9995)) as kk  where kk.za0100="+@infoid+".za0100  and "+@subCondition+" and  "+@Condition+" and  "+@rycondition
	end
    else 
	begin
		while(@Length>1 )
		begin
			set @strsql="update "+left(@FirstItemIdWord,4)+" set zc9995='*' where  za0100+cast("+left(@FirstItemIdWord,4)+"id as varchar(10))+ZC9995 in (select zc9995+cast(max("+left(@FirstItemIdWord,4)+"id) as varchar(10))+ZC9995 from  WHERE ZC9995<>'*'"+left(@FirstItemIdWord,4)+" group by za0100,ZC9995) "
			exec(@strsql)
			set @Length=@Length-1
		end
		if (@Condition=' 1=1 ')
		 	 set @strsql='update ' +@infoid+" set "+@infofield+" =kk."+right(@FirstItemIdWord,6)+"  from ( select za0100,"+@FirstItemIdWord+"  from "+left(@FirstItemIdWord,4)+" where  za0100+cast("+left(@FirstItemIdWord,4)+"id as varchar(10))+ZC9995 in (select za0100+cast(max("+left(@FirstItemIdWord,4)+"id ) as varchar(10))+ZC9995 from "+left(@FirstItemIdWord,4)+" WHERE ZC9995<>'*' group by za0100,ZC9995)) as kk  where kk.za0100="+@infoid+".za0100  and "+@subCondition+" and "+@rycondition
		else
		 	 set @strsql='update ' +@infoid+" set "+@infofield+" =kk."+right(@FirstItemIdWord,6)+"  from ( select za0100,"+@FirstItemIdWord+"  from "+left(@FirstItemIdWord,4)+" where  za0100+cast("+left(@FirstItemIdWord,4)+"id as varchar(10))+ZC9995 in (select za0100+cast(max("+left(@FirstItemIdWord,4)+"id ) as varchar(10))+ZC9995 from "+left(@FirstItemIdWord,4)+" WHERE ZC9995<>'*'  group by za0100,ZC9995)) as kk  where kk.za0100="+@infoid+".za0100  and "+@subCondition+" and "+@Condition +" and "+@rycondition

	end
else

    if(@style='1')
	begin
		while(@Length>1 )
		begin
			set @strsql="update "+left(@FirstItemIdWord,4)+" set zc9995='*' where   za0100+cast("+left(@FirstItemIdWord,4)+"id as varchar(10))+ZC9995 in (select za0100+cast(min("+left(@FirstItemIdWord,4)+"id) as varchar(10))+ZC9995 from "+left(@FirstItemIdWord,4)+" WHERE ZC9995<>'*' group by za0100,ZC9995) "
			exec(@strsql)

			set @Length=@Length-1
		end
		if (@Condition=' 1=1 ')
	 		 set @strsql='update ' +@infoid+" set "+@infofield+" =kk."+right(@FirstItemIdWord,6)+"  from ( select za0100,"+@FirstItemIdWord+"  from "+left(@FirstItemIdWord,4)+" where    za0100+cast("+left(@FirstItemIdWord,4)+"id as varchar(10))+ZC9995 in (select za0100+cast(min("+left(@FirstItemIdWord,4)+"id ) as varchar(10))+ZC9995 from "+left(@FirstItemIdWord,4)+"  WHERE ZC9995<>'*' group by za0100,ZC9995)) as kk  where kk.za0100="+@infoid+".za0100  and "+@infoid+".zc9993='1' and  "+@rycondition
		else
			 set @strsql='update ' +@infoid+" set "+@infofield+" =kk."+right(@FirstItemIdWord,6)+"  from ( select za0100,"+@FirstItemIdWord+"  from "+left(@FirstItemIdWord,4)+" where    za0100+cast("+left(@FirstItemIdWord,4)+"id as varchar(10))+ZC9995 in (select za0100+cast(min("+left(@FirstItemIdWord,4)+"id ) as varchar(10))+ZC9995 from "+left(@FirstItemIdWord,4)+"  WHERE ZC9995<>'*'  group by za0100,ZC9995)) as kk  where kk.za0100="+@infoid+".za0100  and "+@infoid+".zc9993='1' and "+@Condition+" and  "+@rycondition
	end
    else 
	begin
		while(@Length>1 )
		begin
			set @strsql="update "+left(@FirstItemIdWord,4)+" set zc9995='*' where   za0100+cast("+left(@FirstItemIdWord,4)+"id as varchar(10))+ZC9995 in (select zc9995+cast(max("+left(@FirstItemIdWord,4)+"id) as varchar(10))+ZC9995 from "+left(@FirstItemIdWord,4)+"  WHERE ZC9995<>'*' group by za0100,ZC9995) "
			exec(@strsql)
			set @Length=@Length-1
		end
		if (@Condition=' 1=1 ')
		 	 set @strsql='update ' +@infoid+" set "+@infofield+" =kk."+right(@FirstItemIdWord,6)+"  from ( select za0100,"+@FirstItemIdWord+"  from "+left(@FirstItemIdWord,4)+" where  za0100+cast("+left(@FirstItemIdWord,4)+"id as varchar(10))+ZC9995 in (select za0100+cast(max("+left(@FirstItemIdWord,4)+"id ) as varchar(10))+ZC9995 from "+left(@FirstItemIdWord,4)+" WHERE ZC9995<>'*' group by za0100,ZC9995)) as kk  where kk.za0100="+@infoid+".za0100  and "+@infoid+".zc9993='1' and "+@rycondition
		else
		 	 set @strsql='update ' +@infoid+" set "+@infofield+" =kk."+right(@FirstItemIdWord,6)+"  from ( select za0100,"+@FirstItemIdWord+"  from "+left(@FirstItemIdWord,4)+" where  za0100+cast("+left(@FirstItemIdWord,4)+"id as varchar(10))+ZC9995 in (select za0100+cast(max("+left(@FirstItemIdWord,4)+"id ) as varchar(10))+ZC9995 from "+left(@FirstItemIdWord,4)+" WHERE ZC9995<>'*'  group by za0100,ZC9995)) as kk  where kk.za0100="+@infoid+".za0100  and "+@infoid+".zc9993='1' and "+@Condition +" and "+@rycondition


	end
end
else if charindex('上层',@formulaSQL,1)>0
begin
  set	@Length=len(@formulaFieldname)
    --@FirstItemIdWord字段，@tablename：关联表名,@style 1其他表2本表
    EXECUTE @Length = flxp_PopFirstWord @formulaFieldname OUTPUT, @FirstItemIdWord OUTPUT
    EXECUTE @Length = flxp_PopFirstWord @formulaFieldname OUTPUT, @style OUTPUT
   -- EXECUTE @Length = flxp_PopFirstWord @formulaFieldname OUTPUT, @style OUTPUT 

   select @tablename=left(isnull(dictid,''),4) from gs_property where infoid=left(@FirstItemIdWord,4) and infofield=right(@FirstItemIdWord,6)
   if @tablename='' 
	goto abandon
   if(@style='1')
   begin
		if (@Condition=' 1=1 ')
		 	 set @strsql='update ' +@infoid+" set "+@infofield+" =kk.kk  from ( select za0100,(select za9996 from "+@tablename+" where "+@FirstItemIdWord+"="+@tablename+".za0100) as kk from "+left(@FirstItemIdWord,4)+") as kk where kk.za0100="+left(@FirstItemIdWord,4)+".za0100  and "+left(@FirstItemIdWord,4)+".zc9993='1'  "
		else
		 	 set @strsql='update ' +@infoid+" set "+@infofield+" =kk.kk  from ( select za0100,(select za9996 from "+@tablename+" where "+@FirstItemIdWord+"="+@tablename+".za0100) as kk from "+left(@FirstItemIdWord,4)+") as kk where kk.za0100="+left(@FirstItemIdWord,4)+".za0100  and "+left(@FirstItemIdWord,4)+".zc9993='1'  and "+@Condition
	--update aa01 set zc9995=kk.kk from (select za0100,(select za9996 from ab01 where aa01.ab0110=ab01.za0100 ) as kk from aa01) as kk where kk.za0100=aa01.za0100
	--update aa01 set zc9995=ab0110.ab0110 from (select za0100,(select za0101 from ab01 where ab01.za0100=aa01.ab0110 )as ab0110 from aa01 ) as ab0110 where ab0110.za0100=aa01.za0100
		set @strsql=@strsql+"  update  " +@infoid+" set "+@infofield+"=kk.kk from (select za0100,(select za0101 from "+@tablename+" where "+@FirstItemIdWord+"="+@tablename+".za0100) as kk  from "+left(@FirstItemIdWord,4)+") as kk where kk.za0100="+left(@FirstItemIdWord,4)+".za0100  and "+left(@FirstItemIdWord,4)+".zc9993='1'  "
		exec(@strsql)
		set @strsql=''
   end
else
 begin
	set @strSQL="declare curs_gwmc cursor for select za0100,(select isnull(za9996,'') from  "+@tablename+" where "+@FirstItemIdWord+"="+@tablename+".za0100) as kk from "+left(@FirstItemIdWord,4)+"  open curs_gwmc"

	--select za0100,(select za9996 from ab01 where aa01.ab0110=ab01.za0100 ) as kk from aa01
	exec(@strsql)


		fetch next from  curs_gwmc into @za0101,@value
	while(@@fetch_status=0 )
		begin
		set @strtempSQL=''
		if(@value='') goto abandon10
			set @strSQL="declare curs_gw cursor for select  top 5 isnull(za0101,'') from "+left(@FirstItemIdWord,4)+" where "+right(@FirstItemIdWord,6)+"='"+ @value+"'  open curs_gw"
			exec(@strsql)
				fetch next from  curs_gw into @ed0114
			while(@@fetch_status=0)
				begin
					if(@strtempSQL='')
						set  @strtempSQL=@ed0114
					else
						set  @strtempSQL=@strtempSQL+","+@ed0114
					fetch next from  curs_gw into @ed0114

				end
			close Curs_gw
			deallocate Curs_gw
			if(@strtempSQL<>'')
			begin
				set @strsql='update ' +@infoid+" set "+@infofield+"='"+left(@strtempSQL,25)+"' where za0100='"+@za0101+"' and zc9993='1' and "+@rycondition
				exec(@strsql)
			end
abandon10:
			set @strsql=''
			fetch next from  curs_gwmc into @za0101,@value
		end
	close Curs_gwmc
	deallocate Curs_gwmc
 end
end
else if charindex('下层',@formulaSQL,1)>0


begin
  set	@Length=len(@formulaFieldname)
    EXECUTE @Length = flxp_PopFirstWord @formulaFieldname OUTPUT, @FirstItemIdWord OUTPUT
   -- EXECUTE @Length = flxp_PopFirstWord @formulaFieldname OUTPUT, @tablename OUTPUT
    EXECUTE @Length = flxp_PopFirstWord @formulaFieldname OUTPUT, @style OUTPUT 
   select @tablename=left(isnull(dictid,''),4) from gs_property where infoid=left(@FirstItemIdWord,4) and infofield=right(@FirstItemIdWord,6)
   if @tablename='' 
	goto abandon
   if(@style='1')
   begin
	if (@Condition=' 1=1 ')
		set @strSQL="declare curs_gwmc cursor for select za0100,isnull("+substring(@FirstItemIdWord,6,6)+",'') from " +substring(@FirstItemIdWord,1,4)+"  where  "+left(@FirstItemIdWord,4)+".zc9993='1'    open curs_gwmc"
	else

		set @strSQL="declare curs_gwmc cursor for select za0100,isnull("+substring(@FirstItemIdWord,6,6)+",'') from " +substring(@FirstItemIdWord,1,4)+"   where  "+left(@FirstItemIdWord,4)+".zc9993='1'    and  "+@infoid+"."+@Condition +" open curs_gwmc"

	--select za0100,(select za9996 from ab01 where aa01.ab0110=ab01.za0100 ) as kk from aa01
	exec(@strsql)
	set @strtempSQL=''		fetch next from  curs_gwmc into @za0101,@value
	while(@@fetch_status=0)
		begin


		if (@value='') goto abandon11
			set @strSQL="declare curs_gw cursor for select top 10  isnull(za0101,'') from "+@tablename +" where za9996='"+ @value+"'  open curs_gw"
			exec(@strsql)
				fetch next from  curs_gw into @ed0114
			while(@@fetch_status=0)
				begin
					if(@strtempSQL='')
						set  @strtempSQL=@ed0114
					else
						set  @strtempSQL=@strtempSQL+","+@ed0114
					fetch next from  curs_gw into @ed0114
				end
			close Curs_gw
			deallocate Curs_gw
			if (@Condition=' 1=1 ')
				set @strsql='update ' +@infoid+" set "+@infofield+"='"+@strtempSQL+"' where za0100='"+@za0101+"' and zc9993='1' and "+@rycondition
			else
				set @strsql='update ' +@infoid+" set "+@infofield+"='"+@strtempSQL+"' where za0100='"+@za0101+"' and zc9993='1' and  "+@Condition +" and "+@rycondition
			exec(@strsql)
abandon11:
			set @strsql=''
			fetch next from  curs_gwmc into @za0101,@value
		end
	close Curs_gwmc
	deallocate Curs_gwmc
   end
else
   begin
	if (@Condition=' 1=1 ')
		set @strSQL="declare curs_gwmc cursor for select za0100,isnull("+substring(@FirstItemIdWord,6,6)+",'') from " +substring(@FirstItemIdWord,1,4)+"  where  "+left(@FirstItemIdWord,4)+".zc9993='1'    open curs_gwmc"
	else
		set @strSQL="declare curs_gwmc cursor for select za0100,isnull("+substring(@FirstItemIdWord,6,6)+",'') from " +substring(@FirstItemIdWord,1,4)+"   where  "+left(@FirstItemIdWord,4)+".zc9993='1'    and  "+@infoid+"."+@Condition +" open curs_gwmc"
	--select za0100,(select za9996 from ab01 where aa01.ab0110=ab01.za0100 ) as kk from aa01
	exec(@strsql)

		fetch next from  curs_gwmc into @za0101,@value
	while(@@fetch_status=0)
		begin
		set @strtempSQL=''
		if(@value='') goto abandon12
			set @strSQL="declare curs_gw cursor for select top 4 isnull(za0101,'') from "+substring(@FirstItemIdWord,1,4)+" where "+substring(@FirstItemIdWord,6,6)+" in (  select   za0100 from "+@tablename +" where za9996='"+ @value+"')  open curs_gw"
			exec(@strsql)
				fetch next from  curs_gw into @ed0114
			while(@@fetch_status=0)
				begin
					if(@strtempSQL='')
						set  @strtempSQL=@ed0114
					else
						set  @strtempSQL=@strtempSQL+","+@ed0114
					fetch next from  curs_gw into @ed0114
				end
			close Curs_gw
			deallocate Curs_gw
			if (@Condition=' 1=1 ')
				set @strsql='update ' +@infoid+" set "+@infofield+"='"+@strtempSQL+"' where za0100='"+@za0101+"' and zc9993='1' and "+@rycondition
			else
				set @strsql='update ' +@infoid+" set "+@infofield+"='"+@strtempSQL+"' where za0100='"+@za0101+"' and zc9993='1' and  "+@Condition+" and "+@rycondition
			exec(@strsql)
abandon12:
			set @strsql=''
			fetch next from  curs_gwmc into @za0101,@value
		end
	close Curs_gwmc
	deallocate Curs_gwmc
   end
end


--简拼
else if charindex('简拼',@formulaSQL,1)>0
--set @objName='aa01'
--set @za9999A='wl2'
--set @za0101A='za0101'
	begin
		set @strsql=''
		execute flxp_updateza9999 @infoid,@infofield,@formulaFieldname
	end
--计算
--@formulaFieldname0:计数1：倒第一条，2：第一条，3：求和，4：最大，5：最小，6：平均，7：中位
else if charindex('计算',@formulaSQL,1)>0
	begin
	    EXECUTE @Length = flxp_PopFirstWord @formulaFieldname OUTPUT, @FirstItemIdWord OUTPUT
	    EXECUTE @Length = flxp_PopFirstWord @formulaFieldname OUTPUT, @style OUTPUT 
	    if(@style='7')
	          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  za0100,(max(isnull("+right(@FirstItemIdWord,6)+",0))+min(isnull("+right(@FirstItemIdWord,6)+",0)))/2 as kk from "+left(@FirstItemIdWord,4)+" where "+@subCondition+" group by za0100 ) as kk where "+@Condition+" and "+@infoid+".za0100=kk.za0100 and "+@infoid+".zc9993='1'"
                 else  if(@style='6')
                       set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  za0100,avg(isnull("+right(@FirstItemIdWord,6)+",0)) as kk from "+left(@FirstItemIdWord,4)+" where "+@subCondition+" group by za0100 ) as kk where " +@Condition+" and "+@infoid+".za0100=kk.za0100 and "+@infoid+".zc9993='1'"                  --update aa01 set wl1=kk.kk from (select za0100,max(aa04id) as kk from  aa04  where  aa04id>200 group by za0100 having kk) as kk  where aa01.za0100=kk.za0100
                 else  if(@style='5')
                       set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  za0100,min(isnull("+right(@FirstItemIdWord,6)+",0)) as kk from "+left(@FirstItemIdWord,4)+" where "+@subCondition+" group by za0100 ) as kk where "+@Condition+" and "+@infoid+".za0100=kk.za0100 and "+@infoid+".zc9993='1'"                  --update aa01 set wl1=kk.kk from (select za0100,max(aa04id) as kk from  aa04  where  aa04id>200 group by za0100 having kk) as kk  where aa01.za0100=kk.za0100
                 else  if(@style='4')
                       set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  za0100,max(isnull("+right(@FirstItemIdWord,6)+",0)) as kk from "+left(@FirstItemIdWord,4)+" where "+@subCondition+" group by za0100 ) as kk where "+@Condition+" and "+@infoid+".za0100=kk.za0100 and "+@infoid+".zc9993='1'"                  --update aa01 set wl1=kk.kk from (select za0100,max(aa04id) as kk from  aa04  where  aa04id>200 group by za0100 having kk) as kk  where aa01.za0100=kk.za0100
                 else  if(@style='3')
                       set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  za0100,sum(isnull("+right(@FirstItemIdWord,6)+",0)) as kk from "+left(@FirstItemIdWord,4)+" where "+@subCondition+" group by za0100 ) as kk where "+@Condition+" and "+@infoid+".za0100=kk.za0100 and "+@infoid+".zc9993='1'"                  --update aa01 set wl1=kk.kk from (select za0100,max(aa04id) as kk from  aa04  where  aa04id>200 group by za0100 having kk) as kk  where aa01.za0100=kk.za0100
                 else  if(@style='2')
                      set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  za0100,"+right(@FirstItemIdWord,6)+" as kk from "+left(@FirstItemIdWord,4)+" where za0100+cast("+left(@FirstItemIdWord,4)+"id as varchar(10)) in (select za0100+cast(min("+left(@FirstItemIdWord,4)+"id ) as varchar(10)) from "+left(@FirstItemIdWord,4)+" where "+@subCondition+" group by za0100)) as kk where kk.za0100="+@infoid+".za0100 and "+@infoid+".zc9993='1' and "+@Condition
	  	 else  if(@style='1')
                       set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  za0100,"+right(@FirstItemIdWord,6)+" as kk from "+left(@FirstItemIdWord,4)+" where za0100+cast("+left(@FirstItemIdWord,4)+"id as varchar(10)) in (select za0100+cast(max("+left(@FirstItemIdWord,4)+"id ) as varchar(10)) from "+left(@FirstItemIdWord,4)+" where "+@subCondition+" group by za0100)) as kk where kk.za0100="+@infoid+".za0100 and "+@infoid+".zc9993='1' and "+@Condition
		 else
                       set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  za0100,count(isnull("+right(@FirstItemIdWord,6)+",0)) as kk from "+left(@FirstItemIdWord,4)+" where "+@Condition+" and "+@subCondition+" group by za0100 ) as kk where "+@infoid+".za0100=kk.za0100 and "+@infoid+".zc9993='1'"                  --update aa01 set wl1=kk.kk from (select za0100,max(aa04id) as kk from  aa04  where  aa04id>200 group by za0100 having kk) as kk  where aa01.za0100=kk.za0100


--" where "+@Condition+" and "+@subCondition+" group by za0100 ) 
--as kk where "+@infoid+".za0100=kk.za0100 and "+@infoid+".zc9993='1'"                  --update aa01 set wl1=kk.kk from (select za0100,max(aa04id) as kk from  aa04  where  aa04id>200 group by za0100 having kk) as kk  where aa01.za0100=kk.za0100
--select za0100,aa04id from aa04 where za0100+cast(aa04id as varchar(10)) in (select za0100+cast(min(aa04id) as varchar(10)) from aa04  group by za0100)
--+" where za0100+cast("+left(@FirstItemIdWord,4)+"id as varchar(10)) in (select za0100+cast(max("+left(@FirstItemIdWord,4)+"id ) as varchar(10)) from "+left(@FirstItemIdWord,4)+" where zc9995<>'*' group by za0100)) as "+left(@FirstItemIdWord,4)+"  where "+left(@FirstItemIdWord,4)+".za0100="+@infoid+".za0100  and "+@infoid+".zc9993='1'"
	end

else if charindex('取描述',@formulaSQL,1)>0
	begin
	   set @strsql="update "+@infoid+" set "+@infofield+"='' where "+@subCondition +" and "+@Condition+" and "+@rycondition
   	   exec(@strsql)
	   select @tablename=isnull(dictid,'') from gs_property where infoid=left(@formulaFieldname,4) and infofield=right(@formulaFieldname,6)
	   if @tablename=''
		begin
			set @strsql="update "+@infoid+" set "+@infofield+"=kk.kk from (select  za0100,"+@formulaFieldname+" as kk  from "+left(@formulaFieldname,4)+") as kk where kk.za0100="+@infoid+".za0100 and "+@infoid+".zc9993='1'  and  "+@subCondition +" and "+@Condition+" and "+@rycondition
		end
	   else if len(@tablename)>=4
		begin
			set @strsql="update "+@infoid+" set "+@infofield+"=kk.kk from (select za0100,za0101 as kk from "+left(@tablename,4)+ ") as kk where kk.za0100="+@formulaFieldname+"  and  "+@subCondition +" and "+@Condition+" and "+@rycondition
		end
	   else
		begin
			set @strsql="update "+@infoid+" set "+@infofield+"=kk.kk from (select dictvalue as za0100,description as kk from  gs_dictitem where dictid='"+@tablename+"') as kk where kk.za0100="+@formulaFieldname+"  and  "+@subCondition +" and "+@Condition+" and "+@rycondition
		end
	end
else if charindex('汇总',@formulaSQL,1)>0
	begin
	    declare @Flength varchar(4)
	    declare @Fdecimal varchar(2)
	    select @Flength=length ,@fdecimal=decimal from gs_property where infoid=@infoid and infofield=@infofield 
	    EXECUTE @Length = flxp_PopFirstWord @formulaFieldname OUTPUT, @FirstItemIdWord OUTPUT---赋值字段
	    EXECUTE @Length = flxp_PopFirstWord @formulaFieldname OUTPUT, @tablename OUTPUT---关联字段
	    EXECUTE @Length = flxp_PopFirstWord @formulaFieldname OUTPUT, @style OUTPUT --汇总方式2:个数，3：求和，4：最大，5：最小，6：平均，7：中位

	   if(left(@FirstItemIdWord,4)<>left(@tablename,4))
		set @strtempSQL=left(@tablename,4)+' left join '+left(@FirstItemIdWord,4)+' on '+left(@FirstItemIdWord,4)+'.za0100='+left(@tablename,4)+'.za0100 and '+left(@FirstItemIdWord,4)+".zc9993='1' "
	   else
		set @strtempSQL=left(@tablename,4)
	    if @rycondition=@Mainobject+".zc9993='1' " 
		set @rycondition=left(@tablename,2)+"01.zc9993='1'  " 
	    if @Condition=@Mainobject+".zc9993='1' " or @Condition="1=1" or isnull(@condition,'')=''
		set @Condition=left(@tablename,2)+"01.za0100 in (select za0100 from AA01  where AA010D ='1' and  zc9993='1')"
	    else
		set @Condition=left(@tablename,2)+"01.za0100 in ("+@condition+")"

		if right(@tablename,6)='AE0122'
		begin
		  	  if(@style='7')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",cast((max(isnull("+@FirstItemIdWord+",0))+min(isnull("+@FirstItemIdWord+",0)))/2 as numeric("+@Flength+","+@Fdecimal+")) as kk from "+@strtempSQL+" where "+@Condition+"  and "+@subCondition+" group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition+""
	                 else  if(@style='6')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",cast(avg(isnull("+@FirstItemIdWord+",0)) as numeric("+@Flength+","+@Fdecimal+")) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+" group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition
	                 else  if(@style='5')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",cast(min(isnull("+@FirstItemIdWord+",0)) as numeric("+@Flength+","+@Fdecimal+")) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+"  group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1'  and "+@rycondition+""
	                 else  if(@style='4')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",cast(max(isnull("+@FirstItemIdWord+",0)) as numeric("+@Flength+","+@Fdecimal+")) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+"  group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition+""
	                 else if(@style='3')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",cast(sum(isnull("+@FirstItemIdWord+",0)) as numeric("+@Flength+","+@Fdecimal+")) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+"  group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition+""
	                 else--if(@style='2')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",count(*) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+"  group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition+""
			exec(@strsql)
			SET @tablename=left(@tablename,4)+".AB0110"
		  	  if(@style='7')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",cast((max(isnull("+@FirstItemIdWord+",0))+min(isnull("+@FirstItemIdWord+",0)))/2 as numeric("+@Flength+","+@Fdecimal+")) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+"  group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition+""
	                 else  if(@style='6')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",cast(avg(isnull("+@FirstItemIdWord+",0)) as numeric("+@Flength+","+@Fdecimal+")) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+"  group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition+""
	                 else  if(@style='5')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",cast(min(isnull("+@FirstItemIdWord+",0)) as numeric("+@Flength+","+@Fdecimal+")) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+"  group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition+""
	                 else  if(@style='4')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",cast(max(isnull("+@FirstItemIdWord+",0)) as numeric("+@Flength+","+@Fdecimal+")) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+"  group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition+""
	                 else if(@style='3')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",cast(sum(isnull("+@FirstItemIdWord+",0)) as numeric("+@Flength+","+@Fdecimal+")) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+"  group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition+""
	                 else--if(@style='2')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",count(*) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+"  group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition+""
		end
		else if right(@tablename,6)='AE0123'
		begin
		  	  if(@style='7')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",cast((max(isnull("+@FirstItemIdWord+",0))+min(isnull("+@FirstItemIdWord+",0)))/2 as numeric("+@Flength+","+@Fdecimal+")) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+"  group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition+""
	                 else  if(@style='6')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",cast(avg(isnull("+@FirstItemIdWord+",0)) as numeric("+@Flength+","+@Fdecimal+")) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+"  group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition+""
	                 else  if(@style='5')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",cast(min(isnull("+@FirstItemIdWord+",0)) as numeric("+@Flength+","+@Fdecimal+")) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+"  group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition+""
	                 else  if(@style='4')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",cast(max(isnull("+@FirstItemIdWord+",0)) as numeric("+@Flength+","+@Fdecimal+")) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+"  group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition+""
	                 else if(@style='3')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",cast(sum(isnull("+@FirstItemIdWord+",0)) as numeric("+@Flength+","+@Fdecimal+")) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+"  group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition+""
	                 else--if(@style='2')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",count(*) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+"  group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition+""
			exec(@strsql)
			SET @tablename=left(@tablename,4)+".AE0122"
		  	  if(@style='7')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",cast((max(isnull("+@FirstItemIdWord+",0))+min(isnull("+@FirstItemIdWord+",0)))/2 as numeric("+@Flength+","+@Fdecimal+")) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+"  group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition+""
	                 else  if(@style='6')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",cast(avg(isnull("+@FirstItemIdWord+",0)) as numeric("+@Flength+","+@Fdecimal+")) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+"  group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition+""
	                 else  if(@style='5')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",cast(min(isnull("+@FirstItemIdWord+",0)) as numeric("+@Flength+","+@Fdecimal+")) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+"  group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition+""
	                 else  if(@style='4')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",cast(max(isnull("+@FirstItemIdWord+",0)) as numeric("+@Flength+","+@Fdecimal+")) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+"  group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition+""
	                 else if(@style='3')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",cast(sum(isnull("+@FirstItemIdWord+",0)) as numeric("+@Flength+","+@Fdecimal+")) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+" group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition+""
	                 else--if(@style='2')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",count(*) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+"  group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition+""

			exec(@strsql)
			SET @tablename=left(@tablename,4)+".AB0110"
		  	  if(@style='7')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",cast((max(isnull("+@FirstItemIdWord+",0))+min(isnull("+@FirstItemIdWord+",0)))/2 as numeric("+@Flength+","+@Fdecimal+")) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+"  group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition+""
	                 else  if(@style='6')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",cast(avg(isnull("+@FirstItemIdWord+",0)) as numeric("+@Flength+","+@Fdecimal+")) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+"  group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition+""
	                 else  if(@style='5')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",cast(min(isnull("+@FirstItemIdWord+",0)) as numeric("+@Flength+","+@Fdecimal+")) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+"  group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition+""
	                 else  if(@style='4')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",cast(max(isnull("+@FirstItemIdWord+",0)) as numeric("+@Flength+","+@Fdecimal+")) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+"  group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition+""
	                 else if(@style='3')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",cast(sum(isnull("+@FirstItemIdWord+",0)) as numeric("+@Flength+","+@Fdecimal+")) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+"  group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition+""
	                 else--if(@style='2')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",count(*) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+"  group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition+""

		end
		else if right(@tablename,6)='AE0124'
		begin
		  	  if(@style='7')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",cast((max(isnull("+@FirstItemIdWord+",0))+min(isnull("+@FirstItemIdWord+",0)))/2 as numeric("+@Flength+","+@Fdecimal+")) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+" group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition+""
	                 else  if(@style='6')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",cast(avg(isnull("+@FirstItemIdWord+",0)) as numeric("+@Flength+","+@Fdecimal+")) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+"  group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition+""
	                 else  if(@style='5')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",cast(min(isnull("+@FirstItemIdWord+",0)) as numeric("+@Flength+","+@Fdecimal+")) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+"  group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition+""

	                 else  if(@style='4')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",cast(max(isnull("+@FirstItemIdWord+",0)) as numeric("+@Flength+","+@Fdecimal+")) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+"  group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition+""
	                 else if(@style='3')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",cast(sum(isnull("+@FirstItemIdWord+",0)) as numeric("+@Flength+","+@Fdecimal+")) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+"  group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition+""
	                 else--if(@style='2')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",count(*) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+"  group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition+""
			exec(@strsql)
			SET @tablename=left(@tablename,4)+".AE0122"
		  	  if(@style='7')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",cast((max(isnull("+@FirstItemIdWord+",0))+min(isnull("+@FirstItemIdWord+",0)))/2 as numeric("+@Flength+","+@Fdecimal+")) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+"  group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition+""
	                 else  if(@style='6')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",cast(avg(isnull("+@FirstItemIdWord+",0)) as numeric("+@Flength+","+@Fdecimal+")) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+"  group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition+""
	                 else  if(@style='5')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",cast(min(isnull("+@FirstItemIdWord+",0)) as numeric("+@Flength+","+@Fdecimal+")) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+" group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition+""
	                 else  if(@style='4') 
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",cast(max(isnull("+@FirstItemIdWord+",0)) as numeric("+@Flength+","+@Fdecimal+")) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+"  group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition+""
	                 else if(@style='3')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",cast(sum(isnull("+@FirstItemIdWord+",0)) as numeric("+@Flength+","+@Fdecimal+")) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+"  group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition+""
	                 else--if(@style='2')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",count(*) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+"  group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition+""

			exec(@strsql)
			SET @tablename=left(@tablename,4)+".AB0110"
		  	  if(@style='7')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",cast((max(isnull("+@FirstItemIdWord+",0))+min(isnull("+@FirstItemIdWord+",0)))/2 as numeric("+@Flength+","+@Fdecimal+")) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+"  group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition+""
	                 else  if(@style='6')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",cast(avg(isnull("+@FirstItemIdWord+",0)) as numeric("+@Flength+","+@Fdecimal+")) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+"  group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition+""
	                 else  if(@style='5')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",cast(min(isnull("+@FirstItemIdWord+",0)) as numeric("+@Flength+","+@Fdecimal+")) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+"  group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition+""
	                 else  if(@style='4')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",cast(max(isnull("+@FirstItemIdWord+",0)) as numeric("+@Flength+","+@Fdecimal+")) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+"  group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition+""
	                 else if(@style='3')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",cast(sum(isnull("+@FirstItemIdWord+",0)) as numeric("+@Flength+","+@Fdecimal+")) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+"  group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition+""
	                 else--if(@style='2')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",count(*) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+"  group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition+""
		end
		else 
		begin
		  	  if(@style='7')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",cast((max(isnull("+@FirstItemIdWord+",0))+min(isnull("+@FirstItemIdWord+",0)))/2 as numeric("+@Flength+","+@Fdecimal+")) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+"  group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition+""
	                 else  if(@style='6')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",cast(avg(isnull("+@FirstItemIdWord+",0)) as numeric("+@Flength+","+@Fdecimal+")) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+"  group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition+""
	                 else  if(@style='5')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",cast(min(isnull("+@FirstItemIdWord+",0)) as numeric("+@Flength+","+@Fdecimal+")) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+"  group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition+""
	                 else  if(@style='4')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",cast(max(isnull("+@FirstItemIdWord+",0)) as numeric("+@Flength+","+@Fdecimal+")) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+"  group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition+""
	                 else if(@style='3')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",cast(sum(isnull("+@FirstItemIdWord+",0)) as numeric("+@Flength+","+@Fdecimal+")) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+"  group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition+""
	                 else--if(@style='2')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",count(*) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+"  group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition+""
		end

	end
--执行
else if charindex('税后',@formulaSQL,1)>0--税后
begin
	set @strwhereSQL=" case when "+@formulaFieldname+"<=1000 then "+@formulaFieldname 	+" when "+@formulaFieldname+"<=1500 then cast(cast("+@formulaFieldname+" as numeric(20,2))-(cast("+@formulaFieldname+" as numeric(20,2))-1000)*0.05 as varchar)  when "+@formulaFieldname+"<=3000 then cast(cast("+@formulaFieldname+" as numeric(20,2))-(cast("+@formulaFieldname+" as numeric(20,2))-1500)*0.1-25 as varchar)  when "+@formulaFieldname+"<=5000 then cast(cast("+@formulaFieldname+" as numeric(20,2))-(cast("+@formulaFieldname+" as numeric(20,2))-3000)*0.15-175 as varchar)  when "+@formulaFieldname+"<=20000 then cast(cast("+@formulaFieldname+" as numeric(20,2))-(cast("+@formulaFieldname+" as numeric(20,2))-5000)*0.2-475 as varchar)  when "+@formulaFieldname+"<=40000 then cast(cast("+@formulaFieldname+" as numeric(20,2))-(cast("+@formulaFieldname+" as numeric(20,2))-20000)*0.25-3475 as varchar) 	else cast(cast("+@formulaFieldname+" as numeric(20,2))-(cast("+@formulaFieldname+" as numeric(20,2))-20000)*0.3-8475 as varchar)  end "
	if @isHistory='1'
	begin
	if charindex(@infoid,@formulaFieldname+","+@Mainobject,1)<=0
		EXECUTE  flxp_info_combTable @formulaFieldname,@Mainobject,'0', @tablename output
        else
		EXECUTE  flxp_info_combTable @formulaFieldname,@Mainobject,'1', @tablename output
		if charindex(@infoid,@tablename,1)<=0
		         EXECUTE  flxp_info_combTable @tablename,@infoid,'1', @tablename output
        end
	else
	  begin
		EXECUTE  flxp_info_combTable @formulaFieldname,@Mainobject,'0', @tablename output
		if charindex(@infoid,@tablename,1)<=0
			 EXECUTE  flxp_info_combTable @tablename,@infoid,'0', @tablename output
          end
	if(@isHistory=1)
		begin
		if len(@tablename)>=5
			set @tablename =@tablename+" and "+@subCondition
			set @strsql='update ' +@infoid+" set "+@infofield+" = "+@strwhereSQL+" from "+@tablename +" where  " +@Condition+" and "+@rycondition--历史
		end
	else
		 	set @strsql='update ' +@infoid+" set "+@infofield+" = "+@strwhereSQL+" from "+@tablename+" where "+@infoid+".zc9993='1' and "+@Condition+" and "+@rycondition--非历史
	print @strsql
end

else if charindex('税前',@formulaSQL,1)>0--税前
begin
	set @strwhereSQL=" case when "+@formulaFieldname+"<=1000 then "+@formulaFieldname 	+" when "+@formulaFieldname+"<=1475 then ("+@formulaFieldname+"-1000)/0.95+1000  when "+@formulaFieldname+"<=2825 then ("+@formulaFieldname+"-1475)/0.9+1500   when "+@formulaFieldname+"<=4525 then ("+@formulaFieldname+"-2825)/0.85+3000  when "+@formulaFieldname+"<=16525 then ("+@formulaFieldname+"-4525)/0.8+5000  when "+@formulaFieldname+"<=31525 then ("+@formulaFieldname+"-16525)/0.75+20000 	else ("+@formulaFieldname+"-31525)/0.7+40000  end "
	if @isHistory='1'
	begin
	if charindex(@infoid,@formulaFieldname+","+@Mainobject,1)<=0
		EXECUTE  flxp_info_combTable @formulaFieldname,@Mainobject,'0', @tablename output
        else
		EXECUTE  flxp_info_combTable @formulaFieldname,@Mainobject,'1', @tablename output
		if charindex(@infoid,@tablename,1)<=0
		         EXECUTE  flxp_info_combTable @tablename,@infoid,'1', @tablename output
        end
	else
	  begin
		EXECUTE  flxp_info_combTable @formulaFieldname,@Mainobject,'0', @tablename output
		if charindex(@infoid,@tablename,1)<=0
			 EXECUTE  flxp_info_combTable @tablename,@infoid,'0', @tablename output
          end
	if(@isHistory=1)
		begin
		if len(@tablename)>=5
			set @tablename =@tablename+" and "+@subCondition
			set @strsql='update ' +@infoid+" set "+@infofield+" = "+@strwhereSQL+" from "+@tablename +" where  " +@Condition+" and "+@rycondition--历史
		end
	else
		 	set @strsql='update ' +@infoid+" set "+@infofield+" = "+@strwhereSQL+" from "+@tablename+" where "+@infoid+".zc9993='1' and "+@Condition+" and "+@rycondition--非历史
	print @strsql
end

else if charindex('扣税',@formulaSQL,1)>0--扣税
begin
	set @strwhereSQL=" case when "+@formulaFieldname+"<=1000 then 0 when "+@formulaFieldname+"<=1500 then (cast("+@formulaFieldname+" as numeric(20,2))-1000)*0.05   when "+@formulaFieldname+"<=3000 then (cast("+@formulaFieldname+" as numeric(20,2))-1500)*0.1+25   when "+@formulaFieldname+"<=5000 then (cast("+@formulaFieldname+" as numeric(20,2))-3000)*0.15+175   when "+@formulaFieldname+"<=20000 then (cast("+@formulaFieldname+" as numeric(20,2))-5000)*0.2+475   when "+@formulaFieldname+"<=40000 then (cast("+@formulaFieldname+" as numeric(20,2))-20000)*0.25+3475 	else (cast("+@formulaFieldname+" as numeric(20,2))-20000)*0.3+8475   end "

	if @isHistory='1'
	 begin
	if charindex(@infoid,@formulaFieldname+","+@Mainobject,1)<=0
		EXECUTE  flxp_info_combTable @formulaFieldname,@Mainobject,'0', @tablename output
        else
		EXECUTE  flxp_info_combTable @formulaFieldname,@Mainobject,'1', @tablename output
		if charindex(@infoid,@tablename,1)<=0
		         EXECUTE  flxp_info_combTable @tablename,@infoid,'1', @tablename output
         end
	else
	  begin
		EXECUTE  flxp_info_combTable @formulaFieldname,@Mainobject,'0', @tablename output
		if charindex(@infoid,@tablename,1)<=0
			 EXECUTE  flxp_info_combTable @tablename,@infoid,'0', @tablename output
          end
	if(@isHistory=1)
		begin
		if len(@tablename)>=5
			set @tablename =@tablename+" and "+@subCondition
			set @strsql='update ' +@infoid+" set "+@infofield+" = "+@strwhereSQL+" from "+@tablename +" where  " +@Condition+" and "+@rycondition--历史
		end
	else
		 	set @strsql='update ' +@infoid+" set "+@infofield+" = "+@strwhereSQL+" from "+@tablename+" where "+@infoid+".zc9993='1' and "+@Condition+" and "+@rycondition--非历史
end
else --扣零
begin
--style
--四舍五入：1
--取整　　：2
--进元　　：3
--进角　　：4
--取元　　：
--取角　　：7
    EXECUTE @Length = flxp_PopFirstWord @formulaFieldname OUTPUT, @FirstItemIdWord OUTPUT---赋值字段
    EXECUTE @Length = flxp_PopFirstWord @formulaFieldname OUTPUT, @style OUTPUT 
	if @style='1'--四舍五入
		begin
			set @strwhereSQL="ROUND("+@FirstItemIdWord+",0)"
		end
	else if @style='2'--取整
		begin
			set @strwhereSQL="convert(int,"+@FirstItemIdWord+")"
		end
	else if @style='3'--进元
		begin

			set @strwhereSQL="case when convert(int,"+@FirstItemIdWord+")<"+@FirstItemIdWord+" then convert(int,"+@FirstItemIdWord+")+1 else "+@FirstItemIdWord+" end"
		end
	else if @style='4'--进角
		begin
			set @strwhereSQL="case when  convert(numeric(20,1),"+@FirstItemIdWord+")<"+@FirstItemIdWord+" then convert(numeric(20,1), "+@FirstItemIdWord+")+0.1  else convert(numeric(20,1),"+@FirstItemIdWord+") end"
		end
	else if @style='5'--取元
		begin
			set @strwhereSQL="case when convert(int,"+@FirstItemIdWord+")<"+@FirstItemIdWord+" then convert(int,"+@FirstItemIdWord+") else "+@FirstItemIdWord+" end"
		end
	else if @style='6'--取角
		begin
			set @strwhereSQL="case when  convert(numeric(20,1),"+@FirstItemIdWord+")<"+@FirstItemIdWord+" then convert(numeric(20,1), "+@FirstItemIdWord+")  else convert(numeric(20,1),"+@FirstItemIdWord+")-0.1 end"

		end
	if @isHistory='1'
	 begin
	if charindex(@infoid,@formulaFieldname+","+@Mainobject,1)<=0
		EXECUTE  flxp_info_combTable @FirstItemIdWord,@Mainobject,'0', @tablename output
        else
		EXECUTE  flxp_info_combTable @FirstItemIdWord,@Mainobject,'1', @tablename output
		if charindex(@infoid,@tablename,1)<=0
		         EXECUTE  flxp_info_combTable @tablename,@infoid,'1', @tablename output
         end
	else
	  begin
		EXECUTE  flxp_info_combTable @FirstItemIdWord,@Mainobject,'0', @tablename output
		if charindex(@infoid,@tablename,1)<=0
			 EXECUTE  flxp_info_combTable @tablename,@infoid,'0', @tablename output
          end
	if(@isHistory=1)
		begin
		if len(@tablename)>=5
			set @tablename =@tablename+" and "+@subCondition
			set @strsql='update ' +@infoid+" set "+@infofield+" = "+@strwhereSQL+" from "+@tablename +" where  " +@Condition+" and "+@rycondition--历史
		end
	else
		 	set @strsql='update ' +@infoid+" set "+@infofield+" = "+@strwhereSQL+" from "+@tablename+" where "+@infoid+".zc9993='1' and "+@Condition+" and "+@rycondition--非历史

end
if(@strsql<>'')
exec(@strsql)
abandon:
SET QUOTED_IDENTIFIER On





SET QUOTED_IDENTIFIER OFF 

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO







--select * from ab01
create                                   PROCEDURE  flxp_info_relationFormula 
 @funcId varchar(5000),
 @gatherDate varchar(10),
 @tablename  varchar(10),
 @isdepartment varchar(1)--1是包含，0是不包含
AS
SET QUOTED_IDENTIFIER OFF 
declare @strsql varchar(2000)
declare  @mainobject varchar(4)
declare @infoid varchar(4)
declare @infofield varchar(6)
declare @formulaSQL varchar(1000)
declare @formulaFieldname varchar(100)
declare @Condition varchar(1000)
declare @subCondition varchar(1000)
declare @Fieldtype varchar(1)
declare @isHistory varchar(1)
declare @strwhere varchar(2000)
declare @formulaid int
declare @ryinfofield varchar(100)
declare @ID varchar(100)
--declare @isExist int
declare @ym varchar(10)
declare @dwza0100 varchar(100)
declare @ss varchar(10)
declare @formulanametemp varchar(100)
--flag是计算的表示
--formulaflag修该过的计算标志
--是否有记录

--update aa01 set zc9995=zc9993
select @infofield=dltime,@ym=dlway from gs_structure where infoid=@tablename
if @ym='月'
	set @id=left(@gatherDate,4)+substring(@gatherDate,6,2)
else
	set @id=left(@gatherDate,4)
set @mainobject=left(@tablename,2)+'01'
--找出关联的变化日期字段

if isnull(@infofield,'')=''
	set @infofield='zb9991'
--向被汇总表中插入记录
--if @isExist<=0
--	begin
declare @fieldname varchar(3000)
set @strSQl=" declare curs_g cursor for  select infofield from gs_property where infoid='"+ @tablename+"' and restriction<>'7'  open curs_g"
print @strSQl
exec(@strsql)
--汇总字段
fetch next from  curs_g into @formulaFieldname
while(@@fetch_status=0)
	begin
		if isnull(@fieldname,'')=''
			set @fieldname=@formulaFieldname
		else
			set @fieldname=@fieldname+","+@formulaFieldname

	fetch next from  curs_g into @formulaFieldname
	end
close Curs_g
deallocate Curs_g


set @strsql="select * into ##wl from "+@tablename+" where za0100+cast("+@tablename+"id as varchar) in (select za0100+cast(max("+@tablename+"id) as varchar) from "+@tablename+" group by za0100)"
exec(@strsql)
set @strsql="update ##wl set "+@tablename+"id="+@ID+","+@infofield+"='"+@gatherDate+"' "
exec(@strsql)
if exists(select * from ##wl)
	begin
		set @strsql="insert into "+@tablename+" ("+@fieldname+")  select "+@fieldname+" from ##wl  where not za0100 in (select za0100 from "+@tablename+" where "+@tablename+"id="+@id+")"
		exec(@strsql)
		set @strsql="insert into "+@tablename+" (za0100,"+@tablename+"id,"+@infofield+") "+" select distinct "+@mainobject+".za0100,"+@ID+", '"+@gatherDate+"' from "+@mainobject+" left join "+@tablename+" on "+@mainobject+".za0100="+@tablename+".za0100 and "+@tablename+".zc9993='1' where not "+@mainobject+".za0100 in (select za0100 from "+@tablename+" where "+@tablename+"id="+@id+")"
		exec(@strsql)

	end
else
	begin
		set @strsql="insert into "+@tablename+" (za0100,"+@tablename+"id,"+@infofield+") "+" select distinct "+@mainobject+".za0100,"+@ID+", '"+@gatherDate+"' from "+@mainobject+" left join "+@tablename+" on "+@mainobject+".za0100="+@tablename+".za0100 and "+@tablename+".zc9993='1' where not "+@mainobject+".za0100 in (select za0100 from "+@tablename+" where "+@tablename+"id="+@id+")"
		exec(@strsql)
	end
--	end
print @strsql
 drop table ##wl
set @strsql="update "+@tablename+" set zc9993='0' "
exec(@strsql)
set @strsql="update "+@tablename+" set zc9993='1' where  "+@tablename+"id="+@ID
exec(@strsql)

--首先处理汇总字段
--set @strsql="update "+left(@formulaFieldname,4)+" set zc9993='1' "
--exec(@strsql)
--set @strsql="update "+@tablename+" set zc9993='1' where  "+@tablename+"id="+@ID
--exec(@strsql)
set @strSQl=" declare curs_g cursor for  select formulaid,isnull(formulafieldname,'') from gs_formula where  funcid ='"+@funcid+"' and flag='1'  and formulasql like '#汇总%'  and errornum='0'  and infoid='"+@tablename+"' order by orderno    open curs_g"
print @strSQl
exec(@strsql)
--汇总字段
select * from gs_formula
fetch next from  curs_g into @formulaid,@formulaFieldname
while(@@fetch_status=0)
	begin

		select @ryinfofield=dltime from gs_structure where infoid=left(@formulaFieldname,4)
		if substring(@formulaFieldname,3,2)<>'01' 
		begin
			set @strsql="update "+left(@formulaFieldname,4)+" set zc9993='1' "
			exec(@strsql)
		end
		if isnull(@ryinfofield,'')=''
			set @ryinfofield='zb9991'
		if (substring(@formulaFieldname,3,2)<>'01')
		begin
			if @ym='月'
				set @strsql="update gs_formula set subcondition='"+left(@formulaFieldname,4)+"."+@ryinfofield+">=''"+@gatherDate+"''  and "+left(@formulaFieldname,4)+"."+@ryinfofield+"<''"+convert(varchar(10),dateadd(month,1,@gatherDate),121)+"'' ' where formulaid="+cast(@formulaid as varchar)
			else
				set @strsql="update gs_formula set subcondition='"+left(@formulaFieldname,4)+"."+@ryinfofield+">=''"+@gatherDate+"''  and "+left(@formulaFieldname,4)+"."+@ryinfofield+"<''"+convert(varchar(10),dateadd(year,1,@gatherDate),121)+"'' ' where formulaid="+cast(@formulaid as varchar)
	
			exec(@strsql)
		end
		if @@error<>0
			begin
			goto abandon4
			end

	fetch next from  curs_g into @formulaid,@formulaFieldname
	end
abandon4:
close Curs_g
deallocate Curs_g

set @strSQl=" declare curs_g cursor for select formulaid,mainobject,infoid,infofield,isnull(fieldtype,'2'),isnull(condition,''),isnull(subcondition,''),isnull(formulasql,''),isnull(formulafieldname,''),isnull(ishistory,'0') from gs_formula where  funcid ='"+@funcid+"' and flag='1'  and formulasql like '#汇总%'  and errornum='0'  and infoid='"+@tablename+"' order by orderno  open curs_g"
print @strSQl
exec(@strsql)
--汇总字段
fetch next from  curs_g into @formulaid,@mainobject,@infoid,@infofield,@Fieldtype,@Condition,@subCondition,@formulaSQL,@formulaFieldname,@isHistory
while(@@fetch_status=0)
	begin
		set @strSQl=" update "+@infoid+"  set "+@infofield+"=null where "+@infoid+"id="+@id
		exec(@strsql)
		execute flxp_info_formula @mainobject,@infoid,@infofield,@formulaSQL,@formulaFieldname,@Condition,@subCondition,@Fieldtype,@isHistory,''
		if @@error<>0
			begin
				goto abandon1
			end
		----
		if @isdepartment='1'
		begin
			set @strSQl=" declare curs_dw cursor for  select  za0100 from ab01 where za9997<>'0'  order by len(za0100) desc open curs_dw"
			exec(@strsql)
	
			fetch next from  curs_dw into @dwza0100
			while(@@fetch_status=0)
				begin
					set @strSQl=" update "+@tablename+" set "+@infofield+"=(select sum("+@infofield+") from "+@tablename+" where za0100 like '"+@dwza0100+"%'  and za0100<>'"+@dwza0100+"' and za0100 in (select za0100 from ab01 where za9997='0') and zc9993='1') where za0100='"+@dwza0100+"' and zc9993='1' "
print @strSQl
					exec(@strsql)
			
				fetch next from  curs_dw into @dwza0100
				end
			close Curs_dw
			deallocate Curs_dw
		end
			set	@formulanametemp=left(@formulaFieldname,4)
		----
	fetch next from  curs_g into @formulaid,@mainobject,@infoid,@infofield,@Fieldtype,@Condition,@subCondition,@formulaSQL,@formulaFieldname,@isHistory
	if @formulanametemp<>left(@formulaFieldname,4)  and @formulanametemp<>'AA01'
	begin
		exec Zwd_CurrentHistory @formulanametemp
	end
	end
--update aa01 set zc9993=substring(zc9995,1,1)
abandon1:
close Curs_g
deallocate Curs_g
if isnull(@formulanametemp,'')<>'' and @formulanametemp<>'AA01'
	  exec Zwd_CurrentHistory @formulanametemp
    --其次机构中的计算字段
set @strSQl=" declare curs_g cursor for select mainobject,infoid,infofield,isnull(fieldtype,'2'),isnull(condition,''),isnull(subcondition,''),isnull(formulasql,''),isnull(formulafieldname,''),isnull(ishistory,'0') from gs_formula where  funcid ='"+@funcid+"' and flag='1'  and not formulasql like '#汇总%' and errornum='0' order by orderno  open curs_g"
exec(@strsql)
fetch next from  curs_g into @mainobject,@infoid,@infofield,@Fieldtype,@Condition,@subCondition,@formulaSQL,@formulaFieldname,@isHistory
while(@@fetch_status=0)
	begin
		execute flxp_info_formula @mainobject,@infoid,@infofield,@formulaSQL,@formulaFieldname,@Condition,@subCondition,@Fieldtype,@isHistory,''
		if @@error<>0
			begin
			goto abandon2
			end
		fetch next from  curs_g into @mainobject,@infoid,@infofield,@Fieldtype,@Condition,@subCondition,@formulaSQL,@formulaFieldname,@isHistory
	end
abandon2:
close Curs_g
deallocate Curs_g
exec Zwd_CurrentHistory @tablename






GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO




CREATE         PROCEDURE  flxp_info_saveFormula 
 @funcId varchar(10),
 @Setid varchar(10),
 @rycondtion varchar(2000)=null
 
AS
-- @Mainobject varchar(4) ,--主对象
 --@infoid varchar(4),--表
 --@infofield varchar(6),--字段 
 --@formulaSQL varchar(1000),--公式
 --@formulaFieldname varchar(100),--字段列表,if 次数，表名
 --@Condition varchar(1000),--使用范围
 --@subCondition varchar(1000),--子条件
 --@Fieldtype varchar(1),--类型
 --@isHistory varchar(1)--历史
SET QUOTED_IDENTIFIER OFF 
declare @strsql varchar(2000)
declare  @mainobject varchar(4)
declare @infoid varchar(4)
declare @infofield varchar(6)
declare @formulaSQL varchar(1000)
declare @formulaFieldname varchar(100)
declare @Condition varchar(1000)
declare @subCondition varchar(1000)
declare @Fieldtype varchar(1)
declare @isHistory varchar(1)
declare @strwhere varchar(2000)
--flag是计算的表示
--formulaflag修该过的计算标志
set @strSQl=" declare curs_g cursor for select mainobject,infoid,infofield,isnull(fieldtype,'2'),isnull(condition,''),isnull(subcondition,''),isnull(formulasql,''),isnull(formulafieldname,''),isnull(ishistory,'0') from gs_formula where  funcid='"+ @funcid+"' and formulafieldname like '%"+@setid+".%' and flag='1' and  errornum='0' and mainobject<>'"+@setid+"' order by orderno  open curs_g"
exec(@strsql)
fetch next from  curs_g into @mainobject,@infoid,@infofield,@Fieldtype,@Condition,@subCondition,@formulaSQL,@formulaFieldname,@isHistory
while(@@fetch_status=0)
	begin
		execute flxp_info_formula @mainobject,@infoid,@infofield,@formulaSQL,@formulaFieldname,@Condition,@subCondition,@Fieldtype,@isHistory,@rycondtion
		fetch next from  curs_g into @mainobject,@infoid,@infofield,@Fieldtype,@Condition,@subCondition,@formulaSQL,@formulaFieldname,@isHistory
	end
close Curs_g
deallocate Curs_g
--set @strSQl="update gs_formula set formulaflag='1'  where userid='"+@userid+"' and funcid='"+@funcid+"' and flag='1'  and formulaflag='0'  "
--exec(@strsql)



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO



CREATE PROCEDURE flxp_info_updatezc9993  
 
AS



SET QUOTED_IDENTIFIER OFF
declare @infoid varchar(4)
declare @strsql varchar(1000)
set @strsql="declare curs_gwmc cursor for select infoid from gs_structure where substring(infoid,3,2) >='01' and substring(infoid,3,2)<='99' and state='1'  open curs_gwmc"
exec(@strsql)

--下面向表中增加行或列，由于存在着多个序列，因而增加变量row和col来记录
fetch next from  curs_gwmc into @infoid
while(@@fetch_status=0)
	begin
		
	set @strsql="update "+@infoid+" set zc9993='1' where za0100+cast("+@infoid+"id as varchar(10)) in (select za0100+cast(max("+@infoid+"id) as varchar(10)) from "+@infoid+" group by za0100  )"
print @strsql
	exec(@strsql)
	fetch next from  curs_gwmc into @infoid
	end
close Curs_gwmc
deallocate Curs_gwmc
SET QUOTED_IDENTIFIER on



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO






CREATE     PROCEDURE   flxp_rpt_Copy 
 @typenoB int,--源表
 @settablenoB int,--源表
 @tablenoB int,--源表
 @typeNoA int,--目标
 @settablenoA int,--目标
 @tablenoA int--目标

AS
SET QUOTED_IDENTIFIER OFF  
declare @strsql varchar(1000)
set @strsql='insert into r200 (typeno,settableno,tableno,name,rptfile,rptmemo,mainobject,flag) select '+cast( @typeNoA as varchar(10))+','+cast(@settablenoA as varchar(10))+','+cast(@tablenoA as varchar(10))+',name,rptfile,rptmemo,mainobject,flag from  r200 where typeno='+cast(@typenoB as varchar(10))+' and settableno='+cast(@settablenoB as varchar(10))+' and tableno='+cast(@tablenoB as varchar(10))
exec(@strsql)
set @strsql='insert into r201 (typeno,settableno,tableno,serialno,startrow,startcol,endrow,endcol,mainobject) select '+cast( @typeNoA as varchar(10))+','+cast(@settablenoA as varchar(10))+','+cast(@tablenoA as varchar(10))+',serialno,startrow,startcol,endrow,endcol,mainobject from  r201 where typeno='+cast(@typenoB as varchar(10))+' and settableno='+cast(@settablenoB as varchar(10))+' and tableno='+cast(@tablenoB as varchar(10))
exec(@strsql)
set @strsql='insert into r202 (typeno,settableno,tableno,serialno,serialname,serialtype,mainobject,icount) select '+cast( @typeNoA as varchar(10))+','+cast(@settablenoA as varchar(10))+','+cast(@tablenoA as varchar(10))+',serialno,serialname,serialtype,mainobject,icount from  r202 where typeno='+cast(@typenoB as varchar(10))+' and settableno='+cast(@settablenoB as varchar(10))+' and tableno='+cast(@tablenoB as varchar(10))
exec(@strsql)
set @strsql='insert into r203 (typeno,settableno,tableno,serialno,sequencename,baseexpr,baseitem,setsql,chineseitem,sequenceno,dealfieldname,dealstyle,dealitemch,statobject,sequencetype) select '+cast( @typeNoA as varchar(10))+','+cast(@settablenoA as varchar(10))+','+cast(@tablenoA as varchar(10))+',serialno,sequencename,baseexpr,baseitem,setsql,chineseitem,sequenceno,dealfieldname,dealstyle,dealitemch,statobject,sequencetype from  r203 where typeno='+cast(@typenoB as varchar(10))+' and settableno='+cast(@settablenoB as varchar(10))+' and tableno='+cast(@tablenoB as varchar(10))
exec(@strsql)
set @strsql='insert into r241 (typeno,settableno,tableno,conditionid,lexpr,opsign,rexpr) select '+cast( @typeNoA as varchar(10))+','+cast(@settablenoA as varchar(10))+','+cast(@tablenoA as varchar(10))+',conditionid,lexpr,opsign,rexpr from  r241 where typeno='+cast(@typenoB as varchar(10))+' and settableno='+cast(@settablenoB as varchar(10))+' and tableno='+cast(@tablenoB as varchar(10))
exec(@strsql)
--set @strsql='update r241 set   lexpr=replace(lexpr,['+cast(@tablenoB as varchar(10))+':,['++cast(@tablenoA as varchar(10))+':) where typeno='+cast(@typenoB as varchar(10))+' and settableno='+cast(@settablenoB as varchar(10))+' and tableno='+cast(@tablenoB as varchar(10))
set @strsql='insert into r251 (typeno,settableno,tableno,conditionid,lexpr,opsign,rexpr) select '+cast( @typeNoA as varchar(10))+','+cast(@settablenoA as varchar(10))+','+cast(@tablenoA as varchar(10))+',conditionid,lexpr,opsign,rexpr from  r251 where typeno='+cast(@typenoB as varchar(10))+' and settableno='+cast(@settablenoB as varchar(10))+' and tableno='+cast(@tablenoB as varchar(10))
exec(@strsql)
set @strsql='insert into r242 (typeno,settableno,tableno,conditionid,lexpr,opsign,rexpr,removecol,rexpr1,lexpr1) select '+cast( @typeNoA as varchar(10))+','+cast(@settablenoA as varchar(10))+','+cast(@tablenoA as varchar(10))+',conditionid,lexpr,opsign,rexpr,removecol,rexpr1,lexpr1 from  r242 where typeno='+cast(@typenoB as varchar(10))+' and settableno='+cast(@settablenoB as varchar(10))+' and tableno='+cast(@tablenoB as varchar(10))
exec(@strsql)
set @strsql='insert into r252 (typeno,settableno,tableno,conditionid,lexpr,opsign,rexpr,rexpr1) select '+cast( @typeNoA as varchar(10))+','+cast(@settablenoA as varchar(10))+','+cast(@tablenoA as varchar(10))+',conditionid,lexpr,opsign,rexpr,rexpr1 from  r252 where typeno='+cast(@typenoB as varchar(10))+' and settableno='+cast(@settablenoB as varchar(10))+' and tableno='+cast(@tablenoB as varchar(10))
exec(@strsql)
set @strsql='insert into r243 (typeno,settableno,tableno,conditionid,lexpr,opsign,rexpr,rexpr1,lexpr1) select '+cast( @typeNoA as varchar(10))+','+cast(@settablenoA as varchar(10))+','+cast(@tablenoA as varchar(10))+',conditionid,lexpr,opsign,rexpr,rexpr1,lexpr1 from  r243 where typeno='+cast(@typenoB as varchar(10))+' and settableno='+cast(@settablenoB as varchar(10))+' and tableno='+cast(@tablenoB as varchar(10))
exec(@strsql)
set @strsql='insert into r253 (typeno,settableno,tableno,conditionid,lexpr,opsign,rexpr,rexpr1) select '+cast( @typeNoA as varchar(10))+','+cast(@settablenoA as varchar(10))+','+cast(@tablenoA as varchar(10))+',conditionid,lexpr,opsign,rexpr,rexpr1 from  r253 where typeno='+cast(@typenoB as varchar(10))+' and settableno='+cast(@settablenoB as varchar(10))+' and tableno='+cast(@tablenoB as varchar(10))
exec(@strsql)
set @strsql='insert into r244 (typeno,settableno,tableno,conditionid,lexpr,opsign,rexpr) select '+cast( @typeNoA as varchar(10))+','+cast(@settablenoA as varchar(10))+','+cast(@tablenoA as varchar(10))+',conditionid,lexpr,opsign,rexpr from  r244 where typeno='+cast(@typenoB as varchar(10))+' and settableno='+cast(@settablenoB as varchar(10))+' and tableno='+cast(@tablenoB as varchar(10))
exec(@strsql)
set @strsql='insert into r254 (typeno,settableno,tableno,conditionid,lexpr,opsign,rexpr) select '+cast( @typeNoA as varchar(10))+','+cast(@settablenoA as varchar(10))+','+cast(@tablenoA as varchar(10))+',conditionid,lexpr,opsign,rexpr from  r254 where typeno='+cast(@typenoB as varchar(10))+' and settableno='+cast(@settablenoB as varchar(10))+' and tableno='+cast(@tablenoB as varchar(10))
exec(@strsql)
--set @strsql="update r241 set   lexpr=replace(lexpr,'["+cast(@tablenoB as varchar(10))+":','["+cast(@tablenoA as varchar(10))+":') where typeno="+cast(@typenoB as varchar(10))+' and settableno='+cast(@settablenoB as varchar(10))+' and tableno='+cast(@tablenoB as varchar(10))
--exec(@strsql)
set @strsql="update r241 set   rexpr=replace(rexpr,'["+cast(@tablenoB as varchar(10))+":','["+cast(@tablenoA as varchar(10))+":') where typeno="+cast(@typenoB as varchar(10))+' and settableno='+cast(@settablenoB as varchar(10))+' and tableno='+cast(@tablenoB as varchar(10))
exec(@strsql)
set @strsql="update r251 set   rexpr=replace(rexpr,'["+cast(@tablenoB as varchar(10))+":','["+cast(@tablenoA as varchar(10))+":') where typeno="+cast(@typenoB as varchar(10))+' and settableno='+cast(@settablenoB as varchar(10))+' and tableno='+cast(@tablenoB as varchar(10))
exec(@strsql)
set @strsql='insert into EG01 (EG01ID,ZA0101,TYPENO,SETTBL,TABLNO,ZA0100,USERID,STARTC,STARTR) select EG01ID,ZA0101,'+cast( @typeNoA as varchar(10))+','+cast(@settablenoA as varchar(10))+','+cast(@tablenoA as varchar(10))+',ZA0100,USERID,STARTC,STARTR from  EG01 where TYPENO='+cast(@typenoB as varchar(10))+' and SETTBL='+cast(@settablenoB as varchar(10))+' and TABLNO='+cast(@tablenoB as varchar(10))
exec(@strsql)
set @strsql="select * into T"+cast(@typeNoA as varchar(10))+"_"+cast(@settablenoA as varchar(10))+"_"+cast(@tablenoA as varchar(10))+"  from T"+cast(@typeNoB as varchar(10))+"_"+cast(@settablenoB as varchar(10))+"_"+cast(@tablenoB as varchar(10))
exec(@strsql)
--if(@@error<>0)
--   goto abandon
--abandon:
-- EXECUTE flxp_create_AppTable @typenoA,@settablenoa,@tablenoa






GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO





CREATE    PROCEDURE   flxp_rpt_Requery  
 @TBL varchar(1000),--表名
 @FLD varchar(2000),--字段名
 @ASS varchar(1000),--相关字段名
 @STRCondtion varchar(8000),--条件
 @strMainObject varchar(4),--主对象名
 @strOut varchar(8000) output--输出
 
AS
declare @strSQl varchar(6000)
declare @strTBL varchar(6000)
declare @strFLD varchar(6000)
declare @za0100 varchar(100)
declare @za0101 varchar(100)
--set @TBL='AB01,AA03,AB03'
--set @ASS='AA01.AB0110,AA01.AE0122'
--set @FLD='AA01.ZA0101,AA01.AA0107,AA01.AA0117,AA01.AA0121'
--set @strMainObject="AA01"
declare @length int
declare @ItemIdList varchar(5000)
declare @FirstItemIdWord varchar(1000)
declare @strtemp varchar(100)
--向关联字段中填加名称
if @ASS='' or charindex('ZA0101',upper(@ASS),1)<=0
  if @ASS=''
     set @ASS=@strMainObject+".ZA0101"
  else
     set @ASS=@ASS+','+@strMainObject+".ZA0101"


SET QUOTED_IDENTIFIER OFF  
set @strTBL=@strMainObject+" "
		--表名
		set @ItemIdList=@TBL

		SELECT @Length = DATALENGTH(@ItemIdList)
		    WHILE @Length > 0
	
		    BEGIN
   			 EXECUTE @Length = flxp_PopFirstWord @ItemIdList OUTPUT, @FirstItemIdWord OUTPUT

			if(left(@strMainObject,2)=left(@FirstItemIdWord,2))
			begin
				set @strTBL=@strTBL+" left join " +@FirstItemIdWord +" on "+@strMainObject+".za0100="+@FirstItemIdWord+".za0100 and "+@FirstItemIdWord+".zc9993='1' "
	
			end
			else if(left(@strMainObject,2)<>left(@FirstItemIdWord,2) and substring(@FirstItemIdWord,3,2)='01' )
	

			begin


				set @strSQl=" declare curs_gwmc cursor for select top 1 isnull(infofield,'ZA0100') from gs_property where left(dictid,4)='"+@FirstItemIdWord+"' and infoid='"+@strMainObject+"'   open curs_gwmc"
				exec(@strsql)
				fetch next from  curs_gwmc into @strtemp
				close Curs_gwmc
				deallocate Curs_gwmc
				set @strTBL=@strTBL+" left join "+@FirstItemIdWord+" on "+@strMainObject+"."+@strtemp+"="+@FirstItemIdWord+".za0100 "--and "+@FirstItemIdWord+".zc9993='1' "
			end
			else
			begin
				set @strSQl="declare curs_gwmc cursor for  select top 1 isnull(infofield,'ZA0100') from gs_property where left(dictid,4)='"+left(@FirstItemIdWord,2)+"01' and infoid='"+@strMainObject+"'  open curs_gwmc"
				exec(@strsql)
				fetch next from  curs_gwmc into @strtemp
				close Curs_gwmc
				deallocate Curs_gwmc

				set @strTBL=@strTBL+" left join "+@FirstItemIdWord+"  on "+@strMainObject+"."+@strtemp+"="+@FirstItemIdWord+".za0100 and "+@FirstItemIdWord+".zc9993='1' "

			end

		    end 
		--关隧字段
		set @ItemIdList=@ASS
		set @strFLD=""
		SELECT @Length = DATALENGTH(@ItemIdList)
		    WHILE @Length > 0

		    BEGIN
   			 EXECUTE @Length = flxp_PopFirstWord @ItemIdList OUTPUT, @FirstItemIdWord OUTPUT
			 select  @za0100=isnull(dictid,'') from gs_property where infofield=right(@FirstItemIdWord,6) and  infoid=left(@FirstItemIdWord,4)
  			 select @za0101=isnull(description,'未知') from  gs_property where infofield=right(@FirstItemIdWord,6) and  infoid=left(@FirstItemIdWord,4)
			 if @za0100=''
				begin
					set @strSQl=@FirstItemIdWord+" as '"+@za0101+"'"
				end
			else if len(ltrim(@za0100))=2
				begin
					set @strSQl="(select isnull(description,'')   from gs_dictitem where gs_dictitem.dictvalue="+@FirstItemIdWord+" and gs_dictitem.dictid='"+ltrim(@za0100)+"') as  '"+@za0101+"'"
				end
			else 
				begin
					set @strSQl="(select isnull(za0101,'')   from "+left(@za0100,4)+" where "+@FirstItemIdWord+"="+left(@za0100,4)+".za0100) as  '"+@za0101+"'"
				end
			if @strFLD="" 
				set @strFLD=@strSQl
			else
				set @strFLD=@strFLD+","+@strSQl		
	
		    end 

		--处理字段
		set @ItemIdList=@FLD
		SELECT @Length = DATALENGTH(@ItemIdList)
		    WHILE @Length > 0

		    BEGIN
   			 EXECUTE @Length = flxp_PopFirstWord @ItemIdList OUTPUT, @FirstItemIdWord OUTPUT
			 if right(@FirstItemIdWord,6)='ZA0101'  goto abandon
			 select  @za0100=isnull(dictid,'') from gs_property where infofield=right(@FirstItemIdWord,6) and  infoid=left(@FirstItemIdWord,4)
  			 select @za0101=isnull(description,'未知') from  gs_property where infofield=right(@FirstItemIdWord,6) and  infoid=left(@FirstItemIdWord,4)
			 if @za0100=''
				begin
					set @strSQl=@FirstItemIdWord+" as '"+@za0101+"'"
				end
			else if len(ltrim(@za0100))=2
				begin
					set @strSQl="(select isnull(description,'')  as  '"+@za0101+"' from gs_dictitem where gs_dictitem.dictvalue="+@FirstItemIdWord+" and gs_dictitem.dictid='"+ltrim(@za0100)+"') as  '"+@za0101+"'"
				end
			else 
				begin
					set @strSQl="(select isnull(za0101,'')   from "+left(@za0100,4)+" where "+@FirstItemIdWord+"="+left(@za0100,4)+".za0100) as  '"+@za0101+"'"
				end
			if @strFLD="" 
				set @strFLD=@strSQl
			else
				set @strFLD=@strFLD+","+@strSQl		
	abandon:
		    end 
--合成SQL语句
	if (@ASS<>'')
		if(@STRCondtion='')
			--set @strTBL="select "+@strFLD +" from "+@strTBL+" order by "+@ASS
			set @strTBL="select "+@strFLD +" from "+@strTBL+"  where  "+@strMainObject+".zc9993='1'  "
		else
			--set @strTBL="select "+@strFLD +" from "+@strTBL+"  where  "+@strMainObject+".za0100 in ("+@STRCondtion+")  order by "+@ASS
			set @strTBL="select "+@strFLD +" from "+@strTBL+"  where  "+@strMainObject+".za0100 in ("+@STRCondtion+") "
	else
		if(@STRCondtion='')

			set @strTBL="select "+@strFLD +" from "+@strTBL+"  where  "+@strMainObject+".zc9993='1'"
		else
			set @strTBL="select "+@strFLD +" from "+@strTBL+"  where  "+@strMainObject+".za0100 in ("+@STRCondtion+") "



		set @strOut=@strTBL




GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO











--处理SQL语句的常量、表达式、函数、组成SQL语句
create        PROCEDURE  flxp_rpt_SQLcondition
@strMainObject varchar(4),
@strTBL varchar(100),
@strFLD varchar(500),
@strCON varchar(500),
@strEXP varchar(500),
@strFUN varchar(500),
@strSQL varchar(8000),
@typeno int=null,
@settableno int=null,
@tableno int=null,
@userid varchar(100)=null,
@stroutSQL varchar(8000) out
 
  AS
	
	SET QUOTED_IDENTIFIER OFF  
	declare @tempSQL varchar(8000)
             declare @declareSQL varchar(8000)
	declare @createSQL varchar(8000)
	declare @SQL varchar(8000)
	declare @za0101 varchar(50)
	declare @value varchar(8000)
	--处理字符串长度的变量
	declare @length int
	declare @ItemIdList varchar(8000)
	declare @FirstItemIdWord varchar(5000)
	declare @starttime varchar(10)
	declare @endTime varchar(10)
	declare @rptType varchar(1)

	declare @currDate varchar(20)
	set @tempSQL=@strSQL
	set @ItemIdList=@strTBL
	declare @blnrelation varchar(1)  --1:end 2:start
	set @blnrelation='2'
---------------------处理开始时间和结束时间
	if not @typeno is null
	begin
	select  @currDate=isnull(zb0102,'') from eb01 where za0101=@userid and eb0111='30'
	if(isnull(@currDate,'')='')
		set @currDate= convert(datetime,getdate(),21)
	
	if(isnull(@endTime,'')='')
		begin 
		select @rptType=type from r100 where typeno=@typeno and settableno=@settableno
		if (@rpttype='1')--年报
			begin
				select @starttime=startdate from r100 where typeno=@typeno and settableno=@settableno
				set @starttime=replace(@starttime,'上期|',cast(year(cast(@currDate as datetime))-1 as varchar(4))+'-')
				set @starttime=replace(@starttime,'本期|',cast(year(cast(@currDate as datetime)) as varchar(4))+'-')
				select @endTime=startdate from r100 where typeno=@typeno and settableno=@settableno
				set @endTime=replace(@endTime,'上期|',cast(year(cast(@currDate as datetime)) as varchar(4))+'-')
				set @endTime=replace(@endTime,'本期|',cast(year(cast(@currDate as datetime))+1 as varchar(4))+'-')
				set @endTime=convert(varchar(10),dateadd(day,-1, @endTime),120)
			end
		if (@rpttype='3')--月报
			begin
				--convert(varchar(40),getdate(),21)
				select @starttime=startdate from r100 where typeno=@typeno and settableno=@settableno
				set @starttime=replace(@starttime,'本期|',cast(year(cast(@currDate as datetime)) as varchar(4))+'-'+right('0'+cast(month(cast(@currDate as datetime)) as varchar(4)),2)+'-')
				set @currdate=convert( varchar(10),dateadd(month,-1,cast(@currdate as datetime)),120)
				set @starttime=replace(@starttime,'上期|',cast(year(cast(@currDate as datetime)) as varchar(4))+'-'+right('0'+cast(month(cast(@currDate as datetime)) as varchar(4)),2)+'-')
				set @currdate=convert( varchar(10),dateadd(month,1,cast(@currdate as datetime)),120)
				select @endTime=startdate from r100 where typeno=@typeno and settableno=@settableno
				set @endTime=replace(@endTime,'上期|',cast(year(cast(@currDate as datetime)) as varchar(4))+'-'+right('0'+cast(month(cast(@currDate as datetime)) as varchar(4)),2)+'-')
				set @currdate=convert( varchar(10),dateadd(month,1,cast(@currdate as datetime)),120)
				set @endTime=replace(@endTime,'本期|',cast(year(cast(@currDate as datetime)) as varchar(4))+'-'+right('0'+cast(month(cast(@currDate as datetime)) as varchar(4)),2)+'-')
				set @currdate=convert( varchar(10),dateadd(month,-1,cast(@currdate as datetime)),120)
				set @endTime=convert(varchar(10),dateadd(day,-1, @endTime),120)
			end
		end
	--数字开始时间
	if(isnull(@endTime,'')='')
		begin
			select @starttime=isnull(zb0102,'') from eb01 where za0101=@userid and eb0111='28'
			select @endTime=isnull(zb0102,'') from eb01 where za0101=@userid and eb0111='29'
		end
	
	if(isnull(@endTime,'')='')
		begin
			set 	@endTime=@currDate	
			set 	@starttime=@currDate
		end	
	
	end

---------------------



	--处理常量
	if(@strCON<>'')
	begin
		set @strsql="declare curs_gwmc cursor for select za0101,ec0111 from ec01 where za0101 in ("+@strCON+") open curs_gwmc"
		exec(@strsql)
	        	fetch next from  curs_gwmc into @za0101,@value
		while(@@fetch_status=0)
			begin
				
				set @tempSQL=replace(@tempSQL,'$'+@za0101,@value)
			        	fetch next from  curs_gwmc into @za0101,@value
			end
		close Curs_gwmc
		deallocate Curs_gwmc
	end
	--处理函数
	declare @ed0114 varchar(100)

	if(@strFUN<>'')
	begin
		set @strSQL="declare curs_gwmc cursor for select za0101,ed0110 from ed01 where za0101 in ("+@strFUN+") open curs_gwmc"
		exec(@strsql)
	        	fetch next from  curs_gwmc into @za0101,@value
		while(@@fetch_status=0)
			begin
				if(@za0101='数字开始时间' or @za0101='数字截止时间')
					begin
						if @typeno is null
							set @tempSQL=replace(@tempSQL,'#'+@za0101,getdate())
						else
						begin
							if @za0101='数字开始时间'
								set @tempSQL=replace(@tempSQL,'#'+@za0101,@starttime)
							else
								set @tempSQL=replace(@tempSQL,'#'+@za0101,@endtime)
		
						end
					end
				else
					set @tempSQL=replace(@tempSQL,'#'+@za0101,@value)
			        	fetch next from  curs_gwmc into @za0101,@value
			end
		close Curs_gwmc
		deallocate Curs_gwmc
	end
	--处理表达式的前五种

	set @declareSQL=''
	if(@strEXP<>'')
	begin
		set @strSQL=" declare Curs_gwmc cursor for 	select za0101,ee0114  from ee01  where  za0101 in ("+@strEXP+") and ee0115<>'6'  open curs_gwmc"
		exec(@strsql)

	        	fetch next from  curs_gwmc into @za0101,@value
		while(@@fetch_status=0)
			begin
				
				set @declareSQL=@declareSQL +' '+@value
				--将SQL语中的^加变量替换成@加变量
				set @tempSQL=replace(@tempSQL,'^'+@za0101,'('+@value+')')
			        	fetch next from  curs_gwmc into @za0101,@value
			end
		close Curs_gwmc
		deallocate Curs_gwmc
	end
	--构造SQL语句
	--根据表名构造SQL语句
	set	@strsql=''--暂时将该字段从对象表中取关联字段
	set @createsql='from '+@strMainObject+' '
	if(@strTBL<>'')
		begin
		------------------------------------------------------------
			SELECT @Length = DATALENGTH(@strTBL)
			
			    WHILE @Length > 0
			    BEGIN
				--从表名字串中取出表名
			   	 EXECUTE @Length = flxp_PopFirstWord @ItemIdList OUTPUT, @FirstItemIdWord OUTPUT
				if(left(@FirstItemIdWord,2)<>left(@strMainObject,2))
				begin
					select top 1 @strsql=isnull(infofield,'') from gs_property where left(dictid,4)=@FirstItemIdWord and infoid= @strMainObject
					if(@strsql<>'')
						if(right(@FirstItemIdWord,2)='01')
							if @blnrelation='2'
							begin
							set @createsql=@createsql+' left join '+@FirstItemIdWord+' on '+@strMainObject+'.'+@strsql+'='+@FirstItemIdWord+'.za0100'
							end
						else
							begin
								if @blnrelation='2'
								begin
								set @createsql=@createsql+' left join '+left(@FirstItemIdWord,2)+'01 on '+@strMainObject+'.'+@strsql+'='+left(@FirstItemIdWord,2)+'01.za0100'
								end
								set @createsql=@createsql+' left join '+@FirstItemIdWord+' on '+left(@FirstItemIdWord,2)+'01.za0100='+@FirstItemIdWord+'.za0100 and '+@FirstItemIdWord+".zc9993='1'"
							end
					else
						set @createsql=@createsql+' left join '+@FirstItemIdWord+' on '+@strMainObject+'.za0100='+@FirstItemIdWord+'.za0100 and '+@FirstItemIdWord+".zc9993='1'"
						
				end
					else
				begin
					--if (@strsql="")
						set @createsql=@createsql+' left join '+@FirstItemIdWord+' on '+@strMainObject+".za0100="+@FirstItemIdWord+'.za0100 and ' +@FirstItemIdWord++".zc9993='1'"
					--else
					--	set @createsql=@createsql+' left join '+@FirstItemIdWord+' on '+@strMainObject+"."+@strsql+'='+@FirstItemIdWord+'.za0100 and ' +@FirstItemIdWord++".zc9993='1'"

				end
			END
	
		end
	--根据表达式构造SQL语句
	if(@strEXP<>'')
	begin
		set @strSQL=" declare Curs_gwmc cursor for 	select za0101,ee0114  from ee01  where  za0101 in ("+@strEXP+") and ee0115='6'  open curs_gwmc"
		exec(@strsql)
	        	fetch next from  curs_gwmc into @za0101,@value
		while(@@fetch_status=0)
			begin
				
				set @createsql=@createsql+' left join ( '+@value+') as '+@za0101+ ' on '+@strMainObject+'.za0100='+@za0101+'.za0100 '
				set @tempSQL=replace(@tempSQL,'^'+@za0101,'['+@za0101+']')
			        	fetch next from  curs_gwmc into @za0101,@value
			end
		close Curs_gwmc
		deallocate Curs_gwmc
	end
	--组合最后的SQL
	set 	@createsql='select '+@strMainObject+'.za0100 '+@createsql+' where ('+@tempSQL+') and  '+@strMainObject+".zc9993='1'"
 	set @stroutSQL=  @createsql
	set @stroutSQL=replace(@stroutSQL,"[","")
	set @stroutSQL=replace(@stroutSQL,"]","")


	SET QUOTED_IDENTIFIER on









GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO




CREATE  PROCEDURE   flxp_rpt_delete
 @typeno int,
 @settableno int,
 @tableno int,
 @ZB0110 varchar(20),
 @starttime varchar(20)
 
AS
SET QUOTED_IDENTIFIER OFF  
declare @strsql varchar(1000)
declare @tablename varchar(20)
if isnull(@zb0110,'') =''
begin
	set @tableName='T'+cast(@typeNo as varchar(10))+'_'+cast(@settableno as varchar(10))+'_'+cast(@tableno as varchar(10))
	delete from r220  where  typeno=@typeno and settableno=@settableno and tableno=@tableno 
	delete from r230  where  typeno=@typeno and settableno=@settableno and tableno=@tableno 
	set @strsql="delete from [dbo]."+@tableName
end
else
begin
	set @tableName='T'+cast(@typeNo as varchar(10))+'_'+cast(@settableno as varchar(10))+'_'+cast(@tableno as varchar(10))
	delete from r220  where  typeno=@typeno and settableno=@settableno and tableno=@tableno and zb0110=@ZB0110 and starttime =@starttime
	delete from r230  where  typeno=@typeno and settableno=@settableno and tableno=@tableno and zb0110=@ZB0110 and starttime =@starttime
	set @strsql="delete from [dbo]."+@tableName+" where zb0110='"+@ZB0110+"' and starttime='"+@starttime+"'"
end

exec(@strsql)



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO






CREATE    PROCEDURE  flxp_rpt_gather   
 @ZB0110 varchar(100),
 @typeno int,
 @settableno int,
 @tableno int
 
AS
--declare  @ZB0110 varchar(100)
--declare  @typeno int
--declare  @settableno int
--declare  @tableno int


--select * from t1_1_8 order by zb0110,rowid
--select * from wl
--update wl set zb0110='2'

--insert into t1_1_8 select * from wl
--AS
SET QUOTED_IDENTIFIER OFF 
--set @zb0110="'1','2'"
--set @typeno=1
--set @settableno=1
--set @tableno=8
--dealstyle-处理方式0:计数，1:求和2:最大值3:最小值4:平均值5:中位值6:平均人数
declare @strsql varchar(1000)
declare  @rowSequencetype  varchar(1)
declare  @colSequencetype  varchar(1)
declare @tablename varchar(40)
declare @statTable varchar(20)
declare @row int
declare @col int
declare @style varchar(20)
set @statTable="T"+cast(@typeno as varchar(10))+"_"+cast(@settableno as varchar(10))+"_"+cast(@tableno as varchar(10))
set @tablename="["+convert(varchar(40),getdate(),21)+"]"
print @tablename
begin tran
set @strsql="select * into "+@tablename+" from "+@statTable+" where zb0110 is null and starttime is null"
exec(@strsql)
set @strsql=" update "+@tablename+" set zb0110='0' ,zc9993='1',starttime=convert(varchar(10),getdate(),21)"
exec(@strsql)
set @strSQL="declare curs_gwmc cursor for select r203.dealstyle from r203 left join r202 on r202.typeno=r203.typeno and r202.settableno=r203.settableno and r202.tableno=r203.tableno  and r202.serialno=r203.serialno  where r202.typeno="+cast(@typeno as varchar(10))+" and r202.settableno="+cast(@settableno as varchar(10))+" and r202.tableno="+cast(@tableno as varchar(10))+" and r202.serialtype='1'  order by r203.sequenceno  open curs_gwmc"
print @strSQL
exec(@strsql)
set @row=1
fetch next from  curs_gwmc into @rowSequencetype
if @@CURSOR_ROWS>0
begin
	while(@@fetch_status=0)
		begin
				set @col=1
				set @strSQL="declare curs_gw cursor for select r203.dealstyle from r203 left join r202 on r202.typeno=r203.typeno and r202.settableno=r203.settableno and r202.tableno=r203.tableno  and r202.serialno=r203.serialno  where r202.typeno="+cast(@typeno as varchar(10))+" and r202.settableno="+cast(@settableno as varchar(10))+" and r202.tableno="+cast(@tableno as varchar(10))+" and r202.serialtype='2' order by r203.sequenceno   open curs_gw"
				exec(@strsql)
					fetch next from  curs_gw into @colSequencetype
				IF (@@CURSOR_ROWS>0)
				BEGIN
					while(@@fetch_status=0)
						begin
							--0:计数，1:求和2:最大值3:最小值4:平均值5:中位值6:平均人数
							if(@rowSequencetype>'0')
								set @style=@rowSequencetype
							else if(@colSequencetype>'0')
								set @style=@colSequencetype
							else
								set @style='0'
							if(@style='6')
								set @style="sum"
							else if(@style='5')
								set @style="avg"
							else if(@style='4')
								set @style="avg"
							else if(@style='3')
								set @style="min"
							else if(@style='2')
								set @style="max"
							else if(@style='1')
								set @style="sum"
							else
								set @style="sum"
							--update xx set c1=c1.c1 from (select rowid, sum(c1) as c1 from t1_1_8  where zb0110='0' group by rowid)as c1 where  c1.rowid=xx.rowid
							set @strsql="update "+@tablename+" set C"+cast(@col as varchar(10))+"=lyang.lyang from(select rowid,"+@style+"(c"+cast(@col as varchar(10))+") as lyang from "+@statTable+" where zb0110 in ("+@zb0110+") group by rowid) as lyang where lyang.rowid="+@tablename+".rowid and zb0110='0' and "+@tablename+".rowid="+cast(@row as varchar(10))
							exec(@strsql)
							fetch next from  curs_gw into @colSequencetype
							set @col=@col+1
						end
				END
				ELSE
				begin
					if(@rowSequencetype>'0')
						set @style=@rowSequencetype
					else
						set @style='0'
					if(@style='6')
						set @style="sum"
					else if(@style='5')
						set @style="avg"
					else if(@style='4')
						set @style="avg"
					else if(@style='3')
						set @style="min"
					else if(@style='2')
						set @style="max"
					else if(@style='1')
						set @style="sum"
					else
						set @style="sum"
	
					set @strsql="update "+@tablename+" set C1=lyang.lyang from(select rowid,"+@style+"(c1) as lyang from "+@statTable+" where zb0110 in ("+@zb0110+") group by rowid) as lyang where lyang.rowid="+@tablename+".rowid and zb0110='0' and "+@tablename+".rowid="+cast(@row as varchar(10))
print @strsql
					exec(@strsql)
					
				end
				close Curs_gw
				deallocate Curs_gw	
			fetch next from  curs_gwmc into @rowSequencetype
			set @row=@row+1
		end
end
else
begin
-----------------------
				set @col=1
				set @row=1
				set @strSQL="declare curs_gw cursor for select r203.dealstyle from r203 left join r202 on r202.typeno=r203.typeno and r202.settableno=r203.settableno and r202.tableno=r203.tableno  and r202.serialno=r203.serialno  where r202.typeno="+cast(@typeno as varchar(10))+" and r202.settableno="+cast(@settableno as varchar(10))+" and r202.tableno="+cast(@tableno as varchar(10))+" and r202.serialtype='2' order by r203.sequenceno   open curs_gw"
				exec(@strsql)
					fetch next from  curs_gw into @colSequencetype
				IF (@@CURSOR_ROWS>0)
				BEGIN
					while(@@fetch_status=0)
						begin
							--0:计数，1:求和2:最大值3:最小值4:平均值5:中位值6:平均人数
							if(@colSequencetype>'0')
								set @style=@colSequencetype
							else
								set @style='0'
							if(@style='6')
								set @style="sum"
							else if(@style='5')
								set @style="avg"
							else if(@style='4')
								set @style="avg"
							else if(@style='3')
								set @style="min"
							else if(@style='2')
								set @style="max"
							else if(@style='1')
								set @style="sum"
							else
								set @style="sum"
							--update xx set c1=c1.c1 from (select rowid, sum(c1) as c1 from t1_1_8  where zb0110='0' group by rowid)as c1 where  c1.rowid=xx.rowid
							set @strsql="update "+@tablename+" set C"+cast(@col as varchar(10))+"=lyang.lyang from(select rowid,"+@style+"(c"+cast(@col as varchar(10))+") as lyang from "+@statTable+" where zb0110 in ("+@zb0110+") group by rowid) as lyang where lyang.rowid="+@tablename+".rowid and zb0110='0' and "+@tablename+".rowid="+cast(@row as varchar(10))
							exec(@strsql)
							fetch next from  curs_gw into @colSequencetype
							set @col=@col+1
						end
				END
				close Curs_gw
				deallocate Curs_gw	



-----------------------
end
close Curs_gwmc
deallocate Curs_gwmc
set @strsql="delete from "+@statTable+" where zb0110='0' and  (zc9993='1'  or starttime=convert(varchar(10),getdate(),21)) "
exec(@strsql)
set @strsql="insert into "+@statTable +" select * from " +@tablename
exec(@strsql)
set @strsql="delete from r220  where   zb0110='0' and  (zc9993='1'  or starttime=convert(varchar(10),getdate(),21)) and  starttime='"+convert(varchar(10),getdate(),21)+"'  and typeno="+ cast(@typeno as varchar(10))+" and settableno="+cast(@settableno as varchar(10))+" and tableno="+cast(@tableno as varchar(10))
exec(@strsql)
set @strsql="insert into r220 (typeno,settableno,tableno,zb0110,starttime,startdate)  values ("+cast(@typeno as varchar(10))+","+cast(@settableno as varchar(10))+","+cast(@tableno as varchar(10))+",'0','"+convert(varchar(10),getdate(),21)+"','"+convert(varchar(10),getdate(),21) +"')"
exec(@strsql)
set @strsql="drop table "+@tablename
exec(@strsql)
commit tran
declare @svalue varchar(100)
set @strSQL="declare curs_gwwl cursor for select startrow,startcol from r201 where typeno="+cast(@typeno as varchar(10))+" and settableno="+cast(@settableno as varchar(10))+" and tableno="+cast(@tableno as varchar(10))+" and serialno>=3   open curs_gwwl"
exec(@strsql)
fetch next from  curs_gwwl into @row,@col
while(@@fetch_status=0)
	begin
		set @svalue=''
		set @strSQL=" declare curs_gwly  cursor for select cast(sum(cast(svalue as INT)) as varchar)   from R230 where typeno="+cast(@typeno as varchar(10))+" and settableno="+cast(@settableno as varchar(10))+" and tableno="+cast(@tableno as varchar(10))+" and row="+cast(@row as varchar) +" and col="+cast(@col as varchar)+" and zb0110 in ("+@zb0110+")  open curs_gwly"
		exec(@strsql)		
		fetch next from  curs_gwLY into @svalue
		close curs_gwLY
		deallocate curs_gwLY
		if cast(isnull(@svalue,'0') as INT)>0
		begin
			set @strSQL=" delete from  r230   where typeno="+cast(@typeno as varchar(10))+" and settableno="+cast(@settableno as varchar(10))+" and tableno="+cast(@tableno as varchar(10))+" and row="+cast(@row as varchar) +" and col="+cast(@col as varchar)+" and zb0110='0' "
			exec(@strsql)		
			set @strSQL=" insert into   r230 (typeno,settableno,tableno,zb0110,row,col,svalue,starttime ,zc9993) values("+cast(@typeno as varchar)+","+cast(@settableno as varchar)+","+cast(@tableno as varchar)+",'0',"+cast(@row as varchar)+","+cast(@col as varchar)+","+ @svalue+","+convert(varchar(10),getdate(),21)+",'1')"
			exec(@strsql)		
		end

	fetch next from  curs_gwwl into @row,@col		
	end
close curs_gwwl
deallocate curs_gwwl
SET QUOTED_IDENTIFIER ON



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO





CREATE  PROCEDURE flxp_rpt_rptdealQuery 
    @strwhereSQL varchar(8000) output
 
AS
declare @za0101 varchar(1000)
declare @value varchar(1000)
--declare @ed0114 varchar(100)

		declare @strsql varchar(1000)
SET QUOTED_IDENTIFIER OFF 
		set @strSQL="declare curs_gwmc cursor for select za0101,ed0110 from ed01 where za0101<>'数字开始时间' and  za0101<>'数字截止时间'  and ed0111 in ('0','1','2')  open curs_gwmc"
		exec(@strsql)
	        	fetch next from  curs_gwmc into @za0101,@value
		while(@@fetch_status=0)
			begin
				set @strwhereSQL=replace(@strwhereSQL,"#"+@za0101,@value)

				fetch next from  curs_gwmc into @za0101,@value
			end
		close Curs_gwmc
		deallocate Curs_gwmc
		set @strwhereSQL=replace(@strwhereSQL,"[","")
		set @strwhereSQL=replace(@strwhereSQL,"]","")
SET QUOTED_IDENTIFIER On



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO



--报表统计部分
CREATE PROCEDURE flxp_rpt_sta_back
--主对象
@strMainObject varchar(4),
--单位编码
@ZB0110 varchar(20),
--类别
@typeno int,
--套表
@settableNo int, 
--表号 
@tableno int,
--表名列表
@strTBL varchar(100),
--字段名列表 
@strFLD varchar(500),
--常量
@strCON varchar(500),
--表达式
@strEXP varchar(500),
--函数
@strFUN varchar(500),
--数字开始时间
@starttime varchar(10),
--数字结束时间
@endTime varchar(10),
--全表条件
@WholeCondition varchar(2000),--全表条件应该是与单位或部门合并后的条件
--全表条件定义项,如果全表条件用到前五种表达式，则用到该变量
--@WholeConditionDEF varchar(2000),
--关联字段
@objectAssicate varchar(2000),
@userid varchar(20)
 --@Userid varchar(50)=null
 
 AS
--1、将SETSQL的值赋给statSQL
--2、将STATSQL进行替换
--3、生成临时表
--4、进行统计
--具体的处理过程处下-
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
declare @tempSQL varchar(5000)
declare @declareSQL varchar(1000)
--declare @createSQL varchar(1000)
declare @strSQL varchar(2000)
declare @za0101 varchar(50)
declare @value varchar(1000)
--处理字符串长度的变量
declare @length int
declare @ItemIdList varchar(5000)
declare @FirstItemIdWord varchar(1000)
declare @tableName varchar(20)
declare @FieldName varchar(6)
declare @row int
declare @col int
declare @currDate varchar(20)
declare @rptType varchar(1)
SET QUOTED_IDENTIFIER OFF  
--计算数字开始时间和数字截止时间
--数字开始时间
--@starttime varchar(20),
--数字结束时间
--@endTime varchar(20),
set @tempSQL=""
set @declareSQL=''
--set @strMainObject='AA01'
--set @ZB0110='1'
--set @typeno=2
--set @settableNo=1
--set @tableno=1
--set @strTBL='AA22,AA37'
--set @strFLD='AA01.AA0114,AA01.AA0107,AA37.AE3731,AA22.AA2205'
--set @strCON=''
--set @strFUN=''
--set @strEXP=''
--set @starttime='1999-01-01'
--set @endtime='2002-01-01'
--set @WholeCondition=''
--set @WholeConditionDEF=''
--set @objectAssicate=''
--给单位编码岍初值
if isnull(@zb0110,'')=''
	set @zb0110='0'
select @row=flag from r200 where   typeno=@typeno and settableno=@settableno and tableno=@tableno
if(@row=0)
	goto abandon1
--用户
if(@userid='')
	set @userid='sa'
--当前时间
select  @currDate=isnull(zb0102,'') from eb01 where za0101=@userid and eb0111='30'
if(isnull(@currDate,'')='')
	set @currDate= convert(datetime,getdate(),21)

if(isnull(@endTime,'')='')
	begin
	select @rptType=type from r100 where typeno=@typeno and settableno=@settableno
	if (@rpttype='1')--年报
		begin
			select @starttime=startdate from r100 where typeno=@typeno and settableno=@settableno
			set @starttime=replace(@starttime,'上期|',cast(year(cast(@currDate as datetime))-1 as varchar(4))+'-')
			set @starttime=replace(@starttime,'本期|',cast(year(cast(@currDate as datetime)) as varchar(4))+'-')
			select @endTime=startdate from r100 where typeno=@typeno and settableno=@settableno
			set @endTime=replace(@endTime,'上期|',cast(year(cast(@currDate as datetime)) as varchar(4))+'-')
			set @endTime=replace(@endTime,'本期|',cast(year(cast(@currDate as datetime))+1 as varchar(4))+'-')
		end
	if (@rpttype='3')--月报
		begin
			select @starttime=startdate from r100 where typeno=@typeno and settableno=@settableno
			set @starttime=replace(@starttime,'上期|',cast(year(cast(@currDate as datetime)) as varchar(4))+'-'+right('0'+cast(month(cast(@currDate as datetime))-1 as varchar(4)),2)+'-')
			set @starttime=replace(@starttime,'本期|',cast(year(cast(@currDate as datetime)) as varchar(4))+'-'+right('0'+cast(month(cast(@currDate as datetime)) as varchar(4)),2)+'-')
			select @endTime=startdate from r100 where typeno=@typeno and settableno=@settableno
			set @endTime=replace(@endTime,'上期|',cast(year(cast(@currDate as datetime)) as varchar(4))+'-'+right('0'+cast(month(cast(@currDate as datetime)) as varchar(4)),2)+'-')
			set @endTime=replace(@endTime,'本期|',cast(year(cast(@currDate as datetime)) as varchar(4))+'-'+right('0'+cast(month(cast(@currDate as datetime))+1 as varchar(4)),2)+'-')
		end
	end
--数字开始时间
if(isnull(@endTime,'')='')
	begin
		select @starttime=isnull(zb0102,'') from eb01 where za0101=@userid and eb0111='28'
		select @endTime=isnull(zb0102,'') from eb01 where za0101=@userid and eb0111='29'
	end
if(isnull(@starttime,'')='')
	set @starttime=convert(varchar(20),getdate(),21)

if(isnull(@endTime,'')='')
	set @endTime=convert(varchar(20),getdate(),21)
--表示该表已经归档
if (@rpttype='1')--年报
begin
	select @row=count(*) from r220 where  typeno=@typeno and settableno=@settableno and tableno=@tableno and zb0110=@ZB0110 and left(starttime,4)=left(@endTime,4) and  zc9993='0'
	if (@row>0)
		goto abandon1
end
if (@rpttype='3')--月报
begin
	select @row=count(*) from r220 where  typeno=@typeno and settableno=@settableno and tableno=@tableno and zb0110=@ZB0110 and left(starttime,7)= left(@endTime,7)  and  zc9993='0'
	if (@row>0)
		goto abandon1
end


if(isnull(@endTime,'')='')
set 	@endTime=@currDate	
set 	@starttime=@currDate	
set @ItemIdList=''
--1、将SETSQL的值赋给statSQL
begin tran
update r203 set statsql=setsql where typeno=@typeno and settableno=@settableno and tableno=@tableno
--2、将STATSQL进行替换
--2.1 处理常量
	if(@strCON<>'')
	begin
		set @strsql="declare curs_gwmc cursor for select za0101,ec0111 from ec01 where za0101 in ("+@strCON+") open curs_gwmc"
		exec(@strsql)
	        	fetch next from  curs_gwmc into @za0101,@value
		while(@@fetch_status=0)
			begin
				
				update r203 set statSQL=replace(statSQL,'$'+@za0101,@value)  where  typeno=@typeno and settableno=@settableno and tableno=@tableno
			        	fetch next from  curs_gwmc into @za0101,@value
			end
		close Curs_gwmc
		deallocate Curs_gwmc
	end
	--2.2处理函数
	declare @ed0114 varchar(100)
	if(@strFUN<>'')
	begin
		set @strSQL="declare curs_gwmc cursor for select za0101,ed0110 from ed01 where za0101 in ("+@strFUN+") open curs_gwmc"
		exec(@strsql)
	        	fetch next from  curs_gwmc into @za0101,@value
		while(@@fetch_status=0)
			begin
				if(@za0101='数字开始时间')
					update r203 set statSQL=replace(statSQL,'#'+@za0101,"'"+@starttime+"'" ) where  typeno=@typeno and settableno=@settableno and tableno=@tableno
				else if(@za0101='数字截止时间')
						update r203 set statSQL=replace(statSQL,'#'+@za0101,"'"+@endtime+"'" )  where typeno=@typeno and settableno=@settableno and tableno=@tableno
				else
--						if(@ed0114='')
							update r203 set statSQL=replace(statSQL,'#'+@za0101,@value)  where typeno=@typeno and settableno=@settableno and tableno=@tableno
--						else
--							begin
--								update r203 set statSQL=replace(statSQL,'#'+@za0101,'#'+@za0101+@ed0114) where typeno=@typeno and settableno=@settableno and tableno=@tableno
---							update r203 set statSQL=replace(statSQL,'#'+@za0101,@value) where typeno=@typeno and settableno=@settableno and tableno=@tableno
--							end


			        	fetch next from  curs_gwmc into @za0101,@value
			end
		close Curs_gwmc
		deallocate Curs_gwmc
	end

	--2.3处理表达式的前五种,缺少对于全表条件的处理
	set @declareSQL=''
	if(@strEXP<>'')
	begin
		set @strSQL=" declare Curs_gwmc cursor for 	select za0101,ee0114  from ee01  where  za0101 in ("+@strEXP+") and ee0115<>'6'  open curs_gwmc"
		exec(@strsql)

	        	fetch next from  curs_gwmc into @za0101,@value
		while(@@fetch_status=0)
			begin
				update r203 set statSQL=replace(statSQL,'^'+@za0101,"("+@value+")")  where  typeno=@typeno and settableno=@settableno and tableno=@tableno	
			        	fetch next from  curs_gwmc into @za0101,@value
			end
		close Curs_gwmc
		deallocate Curs_gwmc
	end
	--###########################################
	update r203 set statsql=replace(statsql,'^','') where typeno=@typeno and settableno=@settableno and tableno=@tableno
	set @tempSQL= @tempSQL+"   "
	set @strsql="select  "
	--3、生成临时表
	
	--3.1处理关联表
	set @ItemIdList=@objectAssicate
	SELECT @Length = DATALENGTH(@ItemIdList)
	    WHILE @Length > 0
	    BEGIN
		--从表名字串中取出表名
	   	 EXECUTE @Length = flxp_PopFirstWord @ItemIdList OUTPUT, @FirstItemIdWord OUTPUT
		set @strSQL=@strSQL+@FirstItemIdWord+" as ["+@FirstItemIdWord+"],"
	    end 
	
	--3.2处理字段
	set @ItemIdList=@strFLD
	SELECT @Length = DATALENGTH(@ItemIdList)
	    WHILE @Length > 0
	    BEGIN
		--从表名字串中取出表名
	   	 EXECUTE @Length = flxp_PopFirstWord @ItemIdList OUTPUT, @FirstItemIdWord OUTPUT

		set @strSQL=@strSQL+@FirstItemIdWord+" as ["+@FirstItemIdWord+"],"
	    end 
	    set @strsql=left(@strsql,len(@strsql)-1)
	--生成临时表结构

		if @strTBL=""
			set @strsql=@strsql+","+@strMainObject+".ZA0100 as za0100,"+@strMainObject+".zb9991 as zb9991,"+@strMainObject+".zb9992 as zb9992  into ##wlstat from "+@strMainObject+" where 1=2"

		else
			set @strsql=@strsql+","+@strMainObject+".ZA0100 as za0100,"+@strMainObject+".zb9991 as zb9991,"+@strMainObject+".zb9992 as zb9992  into ##wlstat from "+@strMainObject+","+@strTBL+" where 1=2"

	exec(@strsql)
	--处理表达式，将表达式做为表的一个字段
	if(@strEXP<>'')
	begin
		set @strSQL=" declare Curs_gwmc cursor for 	select za0101,ee0114  from ee01  where  za0101 in ("+@strEXP+") and ee0115='6'  open curs_gwmc"
		exec(@strsql)

	        	fetch next from  curs_gwmc into @za0101,@value
		while(@@fetch_status=0)

			begin
				
				set @strSQL="alter table ##wlstat add "+@za0101+"  numeric(15,2)"
				exec(@strsql)
				--将SQL语中的^加变量替换成@加变量
				fetch next from  curs_gwmc into @za0101,@value
			end
		close Curs_gwmc
		deallocate Curs_gwmc
	end
	--3.3根据全表条件向临时表中增加记录
	--select top 1 @strsql=isnull(infofield,'') from gs_property where left(dictid,4)=@FirstItemIdWord
	if(@WholeCondition='') 
		set @strsql=" insert into ##wlstat (za0100,zb9991,zb9992)   select za0100,zb9991,zb9992 from "+@strMainObject
	else
		if(@zb0110='0')
			set @strsql=" insert into ##wlstat (za0100,zb9991,zb9992)   select za0100,zb9991,zb9992 from "+@strMainObject+" where za0100 in ("+@WholeCondition+")"
		else
			if(upper(@strMainObject)<>'AB01')
				set @strsql=" insert into ##wlstat (za0100,zb9991,zb9992)   select za0100,zb9991,zb9992 from "+@strMainObject+" where za0100 in ("+@WholeCondition+") and "+@strMainObject+".Ab0110  like '"+@zb0110+"%'"
			else
				set @strsql=" insert into ##wlstat (za0100,zb9991,zb9992)   select za0100,zb9991,zb9992 from "+@strMainObject+" where za0100 in ("+@WholeCondition+") and "+@strMainObject+".za0100  = '"+@zb0110+"'"


	exec(@strsql)
	--让row暂做为记录个数
	select @row=count(*) from ##wlstat
		if @row=0 
		BEGIN
			--增加数据索引表
			 set @tableName='T'+cast(@typeNo as varchar(10))+'_'+cast(@settableno as varchar(10))+'_'+cast(@tableno as varchar(10))
			set @strsql="delete from r220  where   zb0110='"+@zb0110+"' and  starttime='"+@endTime+"'  and typeno="+ cast(@typeno as varchar(10))+" and settableno="+cast(@settableno as varchar(10))+" and tableno="+cast(@tableno as varchar(10))
			exec(@strsql)
			set @strsql="insert into r220 (typeno,settableno,tableno,zb0110,starttime,startdate)  values ("+cast(@typeno as varchar(10))+","+cast(@settableno as varchar(10))+","+cast(@tableno as varchar(10))+",'"+@zb0110+"','"+@endtime+"','"+@starttime +"')"
			exec(@strsql)
			--41复制数据表的数据
			set @strsql="delete from  "+@tableName+" where   zb0110='"+@zb0110+"' and  starttime='"+@endTime+"' "-- and typeno="+ cast(@typeno as varchar(10))+" and settableno="+cast(@settableno as varchar(10))+" and tableno="+cast(@tableno as varchar(10))
			exec(@strsql)
			set @strsql="select * into ##wltemp from "+@tableName+" where  ZB0110 is null 	update ##wltemp set zb0110='"+@zb0110+"',starttime='"+@endTime+"' ,zc9993='1'"
			exec(@strsql)
			set @strsql="update " +@tableName+" set  zc9993='0' where zb0110='"+@zb0110+"'   insert into "+@tableName+" select * from 	 ##wltemp  drop table ##wltemp"
			exec(@strsql)
			goto abandon
		END

		--3.4向临时表中增加每一列的值
---------------------------------------------------------------------
		--考虑表达式的处理

			if(@strEXP<>'')
			begin
				set @strSQL=" declare Curs_gwmc cursor for 	select za0101,ee0114  from ee01  where  za0101 in ("+@strEXP+") and ee0115='6'  open curs_gwmc"
				exec(@strsql)
		
			        	fetch next from  curs_gwmc into @za0101,@value
				while(@@fetch_status=0)
					begin
						
						--set @value="update ##wlstat set ["+@za0101+"]="+@za0101+"."+@za0101+"  from ("+@value+") as " + @za0101+" where "+@za0101+".za0100=##wlstat.za0100"
						--exec(@value)
						set @strSQL="update ##wlstat set "+@za0101+"="+@za0101+"."+@za0101+" from ("+@value+") as "+@za0101+" where ##wlstat.za0100="+@za0101+".za0100"
						exec(@strsql)

						fetch next from  curs_gwmc into @za0101,@value
					end
				close Curs_gwmc
				deallocate Curs_gwmc
			end


---------------------------------------------------关联主对象中的数据赋值
		set @ItemIdList=@objectAssicate
		SELECT @Length = DATALENGTH(@ItemIdList)
		    WHILE @Length > 0
		    BEGIN
			--从表名字串中取出表名
	
		   	 EXECUTE @Length = flxp_PopFirstWord @ItemIdList OUTPUT, @FirstItemIdWord OUTPUT
			set @strsql="update ##wlstat set ["+@FirstItemIdWord+"]="+@FirstItemIdWord+" from "+left(@FirstItemIdWord,4)+" where ##wlstat.za0100="+left(@FirstItemIdWord,4)+".za0100"
			exec(@strsql)
	
		    end 

--------------------------------------------------------------

	set @ItemIdList=@strFLD
	set @tablename=""
	set @FieldName=""

	SELECT @Length = DATALENGTH(@ItemIdList)
	    WHILE @Length > 0
	    BEGIN


		--从表名字串中取出表名
	   	 EXECUTE @Length = flxp_PopFirstWord @ItemIdList OUTPUT, @FirstItemIdWord OUTPUT
		set @tablename=left(@FirstItemIdWord,4)
		set @FieldName=substring(@FirstItemIdWord,6,6)

		--是主对象
		if(@strMainObject=left(@FirstItemIdWord,4))
		begin
			set @value="update ##wlstat set ["+@FirstItemIdWord+"]="+@FirstItemIdWord+" from "+left(@FirstItemIdWord,4)+" where ##wlstat.za0100="+left(@FirstItemIdWord,4)+".za0100"
			exec(@value)
		end
		--主对象的子集
		else if(left(@strMainObject,2)=left(@FirstItemIdWord,2))
		begin
			set @value="update ##wlstat set ["+@FirstItemIdWord+"]="+@FirstItemIdWord+" from "+left(@FirstItemIdWord,4)+" where ##wlstat.za0100="+left(@FirstItemIdWord,4)+".za0100 and "+left(@FirstItemIdWord,4)+".zc9993='1'"
			exec(@value)
		end
		--关联对象的主集
		else if(left(@strMainObject,2)<>left(@FirstItemIdWord,2) and substring(@FirstItemIdWord,3,2)='01' )


		begin
			select top 1 @za0101=isnull(infofield,'') from gs_property where left(dictid,4)=@tablename
			set @value="update ##wlstat set ["+@FirstItemIdWord+"]=kk."+@FieldName+" from (select "+@strMainObject+".za0100," +@FirstItemIdWord+" from "+@strMainObject+" left join "+@tablename+" on "+@strMainObject+"."+@za0101+"="+@tablename+".za0100) as kk where kk.za0100=##wlstat.za0100"
			exec(@value)
		end
		--关联对象的子集
		else
		begin
			select top 1 @za0101=isnull(infofield,'') from gs_property where left(dictid,4)=left(@tablename,2)+'01'
			set @value="update ##wlstat set ["+@FirstItemIdWord+"]=kk."+@FieldName+" from (select "+@strMainObject+".za0100," +@FirstItemIdWord+" from "+@strMainObject+" left join "+left(@tablename,2)+'01'+" on "+@strMainObject+"."+@za0101+"="+left(@tablename,2)+'01'+".za0100 left join "+@tableName+"  on  " +left(@tablename,2)+'01'+".za0100= "+@tablename+".za0100 and "  +@tablename +".zc9993='1' ) as kk where kk.za0100=##wlstat.za0100"
			exec(@value)
		end
	    end 
--4报表统计
	--增加数据索引表
	set @strsql="delete from r220  where   zb0110='"+@zb0110+"' and  starttime='"+@endTime+"'  and typeno="+ cast(@typeno as varchar(10))+" and settableno="+cast(@settableno as varchar(10))+" and tableno="+cast(@tableno as varchar(10))
	exec(@strsql)
	set @strsql="update r220  set  zc9993='0' where zb0110='"+@zb0110+"'   and typeno="+ cast(@typeno as varchar(10))+" and settableno="+cast(@settableno as varchar(10))+" and tableno="+cast(@tableno as varchar(10))
	exec(@strsql)
	set @strsql="insert into r220 (typeno,settableno,tableno,zb0110,starttime,startdate)  values ("+cast(@typeno as varchar(10))+","+cast(@settableno as varchar(10))+","+cast(@tableno as varchar(10))+",'"+@zb0110+"','"+@endtime+"','"+@starttime +"')"
	exec(@strsql)

	 set @tableName='T'+cast(@typeNo as varchar(10))+'_'+cast(@settableno as varchar(10))+'_'+cast(@tableno as varchar(10))
	if  not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].['+@tableName+']') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
		goto dealunit
	--41复制数据表的数据
	set @strsql="delete from  "+@tableName+" where   zb0110='"+@zb0110+"' and  starttime='"+@endTime+"' "-- and typeno="+ cast(@typeno as varchar(10))+" and settableno="+cast(@settableno as varchar(10))+" and tableno="+cast(@tableno as varchar(10))
	exec(@strsql)
	set @strsql="select * into ##wltemp from "+@tableName+" where  ZB0110 is null 	update ##wltemp set zb0110='"+@zb0110+"',starttime='"+@endTime+"' ,zc9993='1'"
	exec(@strsql)
	set @strsql="update " +@tableName+" set  zc9993='0' where zb0110='"+@zb0110+"'   insert into "+@tableName+" select * from 	 ##wltemp  drop table ##wltemp"
	exec(@strsql)
	--数据表生成完毕
	--数据表生成完毕
	--4.2
	--@length暂用来表示序列
	declare @RowSQl varchar(2000)
	declare @ColSQl varchar(2000)
	declare @ROWdealstyle varchar(1)
	declare @ROWstatObject varchar(20)
	declare @ROWSequencetype varchar(1)
	declare @COLdealstyle varchar(1)
	declare @COLstatObject varchar(20)
	declare @COLSequencetype varchar(1)
	declare @RowdealFieldname varchar(100)
	declare @ColdealFieldname varchar(100)
	--计算行条件统计的结果
	declare @statValue int
	set @row=1
	set @col=1
	declare curs_gwmc cursor for select serialNo from r202 where   icount<>0   and   serialtype='1' and  typeno=@typeno and settableno=@settableno and tableno=@tableno open curs_gwmc
        	fetch next from  curs_gwmc into @length
	--处理只有列的序列

	if( @@fetch_status<>0)
		begin
			declare curs_OnlyCol cursor for select statSQL,dealstyle,isnull(statObject,'za0100'),sequenceType,dealfieldname  from r203  where typeno=@typeno and settableno=@settableno and tableno=@tableno  and cast(typeno as varchar(10))+cast(settableno as varchar(10))+cast(tableno as varchar(10))+cast(serialno as varchar(10)) in (select cast(typeno as varchar(10))+cast(settableno as varchar(10))+cast(tableno as varchar(10))+cast(serialno as varchar(10)) from r202 where serialtype='2') order by r203.serialno,sequenceno open curs_OnlyCol
        			fetch next from  curs_OnlyCol into @ColSQl,@coldealstyle,@colstatObject,@colSequencetype,@coldealFieldname
			while(@@fetch_status=0)
			begin
			if(@colSequencetype<>'4') 
				begin
--					处理方式0:计数，1:求和2:最大值3:最小值4:平均值5:中位值6:平均人数
					if(@colSequencetype='2') set @colSQl=' 1=1 '
					if(@colSequencetype='1' or @colSequencetype='2')
						begin
						if (@coldealstyle='6')
							begin
								set @strsql=" declare @startdata int  declare @enddata int "
								set @strsql=@strsql+" set  @startdata=(select count(*) from ##wlstat  where "+rtrim(@ColSQl)+" and zb9991<='" + @starttime+"' and zb9992>='"+@starttime+"') " 
								set @strsql=@strsql+" set  @enddata=(select count(*) from ##wlstat  where "+rtrim(@ColSQl)+" and zb9991<='" + @endtime+"' and zb9992>='"+@endtime+"') " 
								set @strsql=@strsql+" update "+@tableName+" set C"+cast(@col as varchar(3))+"=(@startdata+@enddata)/2  where  zb0110='"+@zb0110+"' and zc9993='1'and rowid=1" 
							end


						else if (@coldealstyle='5')

							set @strsql=" update "+@tableName+" set C"+cast(@col as varchar(3))+"=(select (max("+@coldealFieldname+") +min("+@coldealFieldname+"))/2 from ##wlstat  where "+rtrim(@ColSQl)+") where  zb0110='"+@zb0110+"' and zc9993='1'and rowid=1" 
						else if(@coldealstyle='4')
	
							set @strsql=" update "+@tableName+" set C"+cast(@col as varchar(3))+"=(select avg("+@coldealFieldname+") from ##wlstat  where "+rtrim(@ColSQl)+") where zb0110='"+@zb0110+"' and zc9993='1'and  rowid=1"
						else if(@coldealstyle='3')
							set @strsql=" update "+@tableName+" set C"+cast(@col as varchar(3))+"=(select min("+@coldealFieldname+") from ##wlstat  where "+rtrim(@ColSQl)+") where zb0110='"+@zb0110+"' and zc9993='1'and  rowid=1" 
						else if(@coldealstyle='2')
							set @strsql=" update "+@tableName+" set C"+cast(@col as varchar(3))+"=(select max("+@coldealFieldname+") from ##wlstat  where "+rtrim(@ColSQl)+") where zb0110='"+@zb0110+"' and zc9993='1'and  rowid=1" 
						else if(@coldealstyle='1')
							set @strsql=" update "+@tableName+" set C"+cast(@col as varchar(3))+"=(select sum("+@coldealFieldname+") from ##wlstat  where "+rtrim(@ColSQl)+") where zb0110='"+@zb0110+"' and zc9993='1'and  rowid=1"
						else 
							begin
							if(@colstatObject="")
								set @colstatObject="za0100"
							
							set @strsql=" update "+@tableName+" set C"+cast(@col as varchar(3))+"=(select count( distinct "+@colstatObject+") from ##wlstat  where "+rtrim(@ColSQl)+") where zb0110='"+@zb0110+"' and zc9993='1'and  rowid=1" 
							end

	
					
						exec(@strsql)
						end
				end 
        				fetch next from  curs_OnlyCol into @ColSQl,@coldealstyle,@colstatObject,@colSequencetype,@coldealFieldname
		
				set @col=@col+1
			end
			close curs_OnlyCol
			deallocate curs_OnlyCol

		end		
	else--处理有行/列的序列
	while(@@fetch_status=0)
		begin
		--update r203 set statSQL=replace(statSQL,'$'+@za0101,@value)  where  typeno=@typeno and settableno=@settableno and tableno=@tableno
			declare curs_row cursor for select rtrim(statSQL),dealstyle,isnull(statObject,'za0100'),sequenceType,dealfieldname from r203 where    typeno=@typeno and settableno=@settableno and tableno=@tableno and serialno=@length open curs_row
        			fetch next from  curs_row into @RowSQl,@rowdealstyle,@rowstatObject,@rowSequencetype,@RowdealFieldname
			while(@@fetch_status=0)
			begin	
				set @col=1
				if(isnull(@RowSQl,'')='')
				set @RowSQl='1=1'
				set @strsql="declare curs_Onlyrow cursor for   select count(*)  from ##wlstat  where "+@RowSQl+" open curs_Onlyrow"
				exec(@strsql)
        				fetch next from  curs_Onlyrow into @statValue
				close curs_Onlyrow

				deallocate curs_Onlyrow
				--set  @statValue = select count(*)  from ##wlstat  where @RowSQl
				--set @strsql='select @statValue=count(*)  from ##wlstat  where ' +@RowSQl
				--exec(@strsql)
				if(@rowSequencetype<>'4')
				begin
				if(@rowSequencetype='2') set @RowSQl=' 1=1 '
				if(@statvalue>0)
				begin
					declare curs_col cursor for select rtrim(statSQL),dealstyle,isnull(statObject,'za0100'),sequenceType,dealfieldname  from r203  where cast(typeno as varchar(10))+cast(settableno as varchar(10))+cast(tableno as varchar(10))+cast(serialno as varchar(10)) in (select cast(typeno as varchar(10))+cast(settableno as varchar(10))+cast(tableno as varchar(10))+cast(serialno as varchar(10)) from r202 where typeno=@typeno and settableno=@settableno and tableno=@tableno  and serialtype='2')   order by r203.serialno,r203.sequenceno open curs_col
		        			fetch next from  curs_col into @ColSQl,@coldealstyle,@colstatObject,@colSequencetype,@coldealFieldname

					if(@@fetch_status<>0)--处理没有列的行序列
--------------------------------------------------------------------------------------------------------------
					begin
						if(@rowSequencetype='1' or @rowSequencetype='2')
						if (@coldealstyle='6')
							begin
								set @strsql=" declare @startdata int  declare @enddata int "
								set @strsql=@strsql+" set  @startdata=(select count(*) from ##wlstat  where "+rtrim(@RowSQl)+" and zb9991<='" + @starttime+"' and zb9992>='"+@starttime+"') " 
								set @strsql=@strsql+" set  @enddata=(select count(*) from ##wlstat  where "+rtrim(@RowSQl)+" and zb9991<='" + @endtime+"' and zb9992>='"+@endtime+"') " 
								set @strsql=@strsql+" update "+@tableName+" set C1=(@startdata+@enddata)/2  where  zb0110='"+@zb0110+"' and zc9993='1'  and  rowid="+ cast(@row as varchar(3))
							end

						else if (@coldealstyle='5')

							set @strsql=" update "+@tableName+" set C1=(select (max("+@RowdealFieldname+") +min("+@RowdealFieldname+"))/2 from ##wlstat  where "+rtrim(@RowSQl)+") where  zb0110='"+@zb0110+"' and zc9993='1'  and  rowid="+ cast(@row as varchar(3))
							else if(@rowdealstyle='4')--平均人数暂不做
								set @strsql="update "+@tableName+" set C1=(select avg("+@RowdealFieldname+") from ##wlstat  where "+@RowSQl+") where zb0110='"+@zb0110+"' and zc9993='1' and  rowid="+ cast(@row as varchar(3))
							else if(@rowdealstyle='3')
								set @strsql="update "+@tableName+" set C1=(select min("+@RowdealFieldname+") from ##wlstat  where "+@RowSQl+") where zb0110='"+@zb0110+"' and zc9993='1' and  rowid=" +cast(@row as varchar(3))
							else if(@rowdealstyle='2')
								set @strsql="update "+@tableName+" set C1=(select max("+@RowdealFieldname+") from ##wlstat  where "+@RowSQl+") where zb0110='"+@zb0110+"' and zc9993='1' and  rowid=" +cast(@row as varchar(3))
							else if(@rowdealstyle='1')
								set @strsql="update "+@tableName+" set C1=(select sum("+@RowdealFieldname+") from ##wlstat  where "+@RowSQl+") where zb0110='"+@zb0110+"' and zc9993='1' and  rowid="+ cast(@row as varchar(3))
							else 
								begin
								if(@rowstatObject="")
									set @rowstatObject="za0100"
								
								set @strsql="update "+@tableName+" set C1=(select count( distinct "+@rowstatObject+") from ##wlstat  where "+@RowSQl+") where zb0110='"+@zb0110+"' and zc9993='1'  and   rowid=" +cast(@row as varchar(3))
								end

							exec(@strsql)
					end
					else--处理有行列的序列
						begin


							if(@colSequencetype='2') set @colSQl=' 1=1 '
							while(@@fetch_status=0)
							begin
								
	-------------------------------------------------------------------------------处理行列条件的单元数据
								if @colSequencetype<>'4'
								begin
									if(@colSequencetype='1' or  @colSequencetype='2' )
										if (@coldealstyle='6')
											begin
												set @strsql=" declare @startdata int  declare @enddata int "
												set @strsql=@strsql+" set  @startdata=(select count(*) from ##wlstat  where ("+@colSQl+") and ("+@RowSQl+") and zb9991<='" + @starttime+"' and zb9992>='"+@starttime+"') " 

												set @strsql=@strsql+" set  @enddata=(select count(*) from ##wlstat  where ("+@colSQl+") and ("+@RowSQl+") and zb9991<='" + @endtime+"' and zb9992>='"+@endtime+"') " 
												set @strsql=@strsql+" update "+@tableName+" set C"+cast(@col as varchar(3))+"=(@startdata+@enddata)/2  where  zb0110='"+@zb0110+"' and zc9993='1'  and  rowid="+ cast(@row as varchar(3))
											end
										else if (@coldealstyle='5')
											set @strsql=" update "+@tableName+" set C1=(select (max("+@coldealFieldname+") +min("+@coldealFieldname+"))/2 from ##wlstat  where ("+@colSQl+") and ("+@RowSQl+")) where  zb0110='"+@zb0110+"' and zc9993='1'  and  rowid="+ cast(@row as varchar(3))
										else if(@coldealstyle='4')
											set @strsql="update "+@tableName+" set C"+cast(@col as varchar(3))+"=(select avg("+@coldealFieldname+") from ##wlstat  where ("+@colSQl+") and ("+@RowSQl+")) where zb0110='"+@zb0110+"' and zc9993='1'and  rowid=" +cast(@row as varchar(3))
										else if(@coldealstyle='3')
											set @strsql="update "+@tableName+" set C"+cast(@col as varchar(3))+"=(select min("+@coldealFieldname+") from ##wlstat  where ("+@colSQl+") and ("+@RowSQl+")) where zb0110='"+@zb0110+"' and zc9993='1'and  rowid=" +cast(@row as varchar(3))
										else if(@coldealstyle='2')
											set @strsql="update "+@tableName+" set C"+cast(@col as varchar(3))+"=(select max("+@coldealFieldname+") from ##wlstat  where ("+@colSQl+") and ("+@RowSQl+")) where zb0110='"+@zb0110+"' and zc9993='1'and  rowid=" +cast(@row as varchar(3))
										else if(@coldealstyle='1')
											set @strsql="update "+@tableName+" set C"+cast(@col as varchar(3))+"=(select sum("+@coldealFieldname+") from ##wlstat  where ("+@colSQl+") and ("+@RowSQl+")) where zb0110='"+@zb0110+"' and zc9993='1'and  rowid=" +cast(@row as varchar(3))
										else 
											begin
											if(@colstatObject='' )
												if(@rowstatObject<>'')
													set @colstatObject=@rowstatObject
												else
													set @colstatObject="za0100"
											
											set @strsql="update "+@tableName+" set C"+cast(@col as varchar(3))+"=(select count( distinct "+@colstatObject+") from ##wlstat  where ("+rtrim(@colSQl)+") and  ("+rtrim(@RowSQl)+")) where zb0110='"+@zb0110+"' and zc9993='1'and  rowid=" +cast(@row as varchar(3))
											end

									--else goto abandon1
	 								exec(@strsql)
								end

	---------------------------------------------------------------------------------
								fetch next from  curs_col into @ColSQl,@coldealstyle,@colstatObject,@colSequencetype,@coldealFieldname
								set @col=@col+1
							end

						end
						
					close Curs_col
					deallocate Curs_col
	

----------------------------------------------------------------------------------------------------------------
				end
				end
				set @row=@row+1
				fetch next from  curs_row into @RowSQl,@rowdealstyle,@rowstatObject,@rowSequencetype,@RowdealFieldname
			end
			close Curs_row
			deallocate Curs_row

		        	fetch next from  curs_gwmc into @length
		end
	close Curs_gwmc
	deallocate Curs_gwmc
	dealunit:
	--处理单元条件，即补充资料的数据
	--set @strsql=" delete from r230  where   zb0110='"+@zb0110+"'  and typeno="+ cast(@typeno as varchar(10))+" and settableno="+cast(@settableno as varchar(10))+" and tableno="+cast(@tableno as varchar(10))
	--exec(@strsql)
	--处理单元数据
	set @strsql="update r230  set  zc9993='0' where zb0110='"+@zb0110+"'   and typeno="+ cast(@typeno as varchar(10))+" and settableno="+cast(@settableno as varchar(10))+" and tableno="+cast(@tableno as varchar(10))
	exec(@strsql)
	set    @strsql="delete from r230  where   zb0110='"+@zb0110+"' and  starttime='"+@endTime+"'  and typeno="+ cast(@typeno as varchar(10))+" and settableno="+cast(@settableno as varchar(10))+" and tableno="+cast(@tableno as varchar(10))
	exec(@strsql)

	----------------------------------------------------------------------------
	declare curs_unit cursor for select  startrow,startcol, rtrim(isnull(statSQL,'1=2')),isnull(dealstyle,'0'),isnull(statObject,'za0100'),isnull(sequenceType,'1'),dealfieldname from r201 left join  r202 on r201.typeno=r202.typeno and r201.settableno=r202.settableno and r201.tableno=r202.tableno  and r201.serialno=r202.serialno left join  r203 on  r201.typeno=r203.typeno and r201.settableno=r203.settableno and r201.tableno=r203.tableno  and r201.serialno=r203.serialno where r203.typeno=@typeno and r203.settableno=@settableno and r203.tableno=@tableno  and r202.serialtype='3'   order by r203.serialno,r203.sequenceno open curs_unit
	fetch next from  curs_unit into @row,@col,@colSQl,@coldealstyle,@colstatObject,@colSequencetype,@coldealFieldname
	if @colstatObject=""
		set @colstatObject='za0100'
	while(@@fetch_status=0)
--------------------------------------------------------------------------------------------------------------
	begin
	
		if(@colSequencetype='1' or @colSequencetype='2')
		--6-1程序处理均有错误
		if (@coldealstyle='6')
			begin
				set @strsql=" declare @startdata int  declare @enddata int "
				set @strsql=@strsql+" set  @startdata=(select count(*) from ##wlstat  where "+rtrim(@RowSQl)+" and zb9991<='" + @starttime+"' and zb9992>='"+@starttime+"') " 
				set @strsql=@strsql+" set  @enddata=(select count(*) from ##wlstat  where "+rtrim(@RowSQl)+" and zb9991<='" + @endtime+"' and zb9992>='"+@endtime+"') " 
				set @strsql=@strsql+"  insert into r230 (typeno,setableno,tableno,zb0110,starttime,row,col,value) values ("+@typeno+","+@settableno+","+@tableno+",'"+@zb0110+"','"+@endtime+"',"+@row+","+@col+",(@startdata+@enddata)/2)"
			end

		else if (@coldealstyle='5')
			--enddata表示一个变量，即计算出来的结果
			begin
				set @strsql=+" set  @enddata=(select (max("+@coldealFieldname+") +min("+@coldealFieldname+"))/2 from ##wlstat  where "+rtrim(@colSQl)
				--set @strsql=@strsql+"  insert into r230 (typeno,setableno,tableno,zb0110,row,col,value) values ("+@typeno+","+@settableno+","+@tableno+",'"+@zb0110+"',"+@row+","+@col+",@enddata)"
				set @strsql=@strsql+"  insert into r230 (typeno,setableno,tableno,zb0110,starttime,row,col,value) values ("+@typeno+","+@settableno+","+@tableno+",'"+@zb0110+"','"+@endtime+"',"+@row+","+@col+",@enddata)"

			end
		else if(@rowdealstyle='4')--平均人数暂不做
			begin
				set @strsql=+" set  @enddata=(select avg("+@coldealFieldname+")  from ##wlstat  where "+rtrim(@colSQl)
				set @strsql=@strsql+"  insert into r230 (typeno,setableno,tableno,zb0110,starttime,row,col,value) values ("+@typeno+","+@settableno+","+@tableno+",'"+@zb0110+"','"+@endtime+"',"+@row+","+@col+",@enddata)"
			end

		else if(@rowdealstyle='3')
			begin
				set @strsql=+" set  @enddata=(select min("+@coldealFieldname+")  from ##wlstat  where "+rtrim(@colSQl)
				set @strsql=@strsql+"  insert into r230 (typeno,setableno,tableno,zb0110,starttime,row,col,value) values ("+@typeno+","+@settableno+","+@tableno+",'"+@zb0110+"','"+@endtime+"',"+@row+","+@col+",@enddata)"

				--set @strsql=@strsql+"  insert into r230 (typeno,setableno,tableno,zb0110,row,col,value) values ("+@typeno+","+@settableno+","+@tableno+",'"+@zb0110+"',"+@row+","+@col+",@enddata)"
			end
		else if(@rowdealstyle='2')
			begin
				set @strsql=+" set  @enddata=(select max("+@coldealFieldname+")  from ##wlstat  where "+rtrim(@colSQl)
				--set @strsql=@strsql+"  insert into r230 (typeno,setableno,tableno,zb0110,row,col,value) values ("+@typeno+","+@settableno+","+@tableno+",'"+@zb0110+"',"+@row+","+@col+",@enddata)"
				set @strsql=@strsql+"  insert into r230 (typeno,setableno,tableno,zb0110,starttime,row,col,value) values ("+@typeno+","+@settableno+","+@tableno+",'"+@zb0110+"','"+@endtime+"',"+@row+","+@col+",@enddata)"
			end
		else if(@rowdealstyle='1')
			begin
				set @strsql=+" declare  @enddata int   set  @enddata=(select sum("+@coldealFieldname+")  from ##wlstat  where "+rtrim(@colSQl)
				--set @strsql=@strsql+"  insert into r230 (typeno,setableno,tableno,zb0110,row,col,value) values ("+@typeno+","+@settableno+","+@tableno+",'"+@zb0110+"',"+@row+","+@col+",@enddata)"
				set @strsql=@strsql+"  insert into r230 (typeno,setableno,tableno,zb0110,starttime,row,col,svalue) values ("+@typeno+","+@settableno+","+@tableno+",'"+@zb0110+"','"+@endtime+"',"+@row+","+@col+",@enddata)"
			end
		else 
			begin
				set @strsql=" declare  @enddata int  set  @enddata=(select  count( distinct "+@colstatObject+") from ##wlstat  where "+rtrim(@colSQl)+")"
				set @strsql=@strsql+"  insert into r230 (typeno,settableno,tableno,zb0110,starttime,row,col,svalue) values ("+cast(@typeno as varchar(10))+","+cast(@settableno as varchar(10))+","+cast(@tableno as varchar(10))+",'"+@zb0110+"','"+@endtime+"',"+cast(@row as varchar(10))+","+cast(@col as varchar(10))+",@enddata )"
				--set @strsql=@strsql+"  insert into r230 (typeno,settableno,tableno,zb0110,starttime,row,col,value) values ("+@typeno+","+@settableno+","+@tableno+",'"+@zb0110+"','"+@endtime+"',"+@row+","+@col+",@enddata)"
			end
			exec(@strsql)
			fetch next from  curs_unit into @row,@col,@colSQl,@coldealstyle,@colstatObject,@colSequencetype,@coldealFieldname
			if @colstatObject=""
				set @colstatObject='za0100'
		end
	close curs_unit
	deallocate curs_unit
	--变量处理
	--@Userid
	insert into r230 (typeno,settableno,tableno,zb0110,starttime,row,col,svalue) select typeno,settbl,tablno,@ZB0110,@endtime,startr,startc,case when eb0111='028' then  @starttime when eb0111='029' then @endtime else zb0102  end from eb01 left join eg01 on eb01.eb0111=eg01.za0100 and eb01.za0101=eg01.userid where eg01.settbl=@settableNo and typeno=@typeno and tablno=@tableno and userid=@userid 
	----------------------------------------------------------------------------
	abandon:
	drop table ##wlstat
	SET QUOTED_IDENTIFIER on
	commit tran
	abandon1:


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO







--报表统计部分
CREATE         PROCEDURE flxp_rpt_stat
--主对象
@strMainObject varchar(4),
--单位编码
@ZB0110 varchar(20),
--类别
@typeno int,
--套表
@settableNo int, 
--表号 
@tableno int,
--表名列表
@strTBL varchar(100),
--字段名列表 
@strFLD varchar(500),
--常量
@strCON varchar(500),
--表达式
@strEXP varchar(500),
--函数
@strFUN varchar(500),
--数字开始时间
@starttime varchar(10),
--数字结束时间
@endTime varchar(10),
--全表条件
@WholeCondition varchar(2000),--全表条件应该是与单位或部门合并后的条件
--全表条件定义项,如果全表条件用到前五种表达式，则用到该变量
--@WholeConditionDEF varchar(2000),
--关联字段
@objectAssicate varchar(2000),
@userid varchar(20),
@outSQL varchar(5000)  =null output
 --@Userid varchar(50)=null
 
 AS
--1、将SETSQL的值赋给statSQL
--2、将STATSQL进行替换
--3、生成临时表
--4、进行统计
--具体的处理过程处下-
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
declare @tempSQL varchar(8000)
declare @declareSQL varchar(1000)
--declare @createSQL varchar(1000)
declare @strSQL varchar(8000)
declare @za0101 varchar(50)
declare @value varchar(1000)
--处理字符串长度的变量
declare @length int
declare @ItemIdList varchar(5000)
declare @FirstItemIdWord varchar(1000)
declare @tableName varchar(20)
declare @FieldName varchar(6)
declare @row int
declare @col int
declare @currDate varchar(20)
declare @rptType varchar(1)
declare @jstable varchar(40)
declare @otherMainobject varchar(4)
SET QUOTED_IDENTIFIER OFF  
set @jstable="[##"+convert(varchar(40),getdate(),21)+"]"
--计算数字开始时间和数字截止时间
--数字开始时间
--@starttime varchar(20),
--数字结束时间
--@endTime varchar(20),
set @tempSQL=""
set @declareSQL=''
--set @strMainObject='AA01'
--set @ZB0110='1'
--set @typeno=2
--set @settableNo=1
--set @tableno=1
--set @strTBL='AA22,AA37'
--set @strFLD='AA01.AA0114,AA01.AA0107,AA37.AE3731,AA22.AA2205'
--set @strCON=''
--set @strFUN=''
--set @strEXP=''
--set @starttime='1999-01-01'
--set @endtime='2002-01-01'
--set @WholeCondition=''
--set @WholeConditionDEF=''
--set @objectAssicate=''
--给单位编码岍初值
if  isnull(@zb0110,'')='' or isnull(@zb0110,'')='-1'
	set @zb0110='0'


--select @row=flag from r200 where   typeno=@typeno and settableno=@settableno and tableno=@tableno
--if(@row=0)
--	goto abandon1
--用户
if (charindex( upper(@strMainObject+".ZA0100"),upper(@strFLD))>0)
	begin
		set @ItemIdList=@strFLD
		set @strFLD=''
		SELECT @Length = DATALENGTH(@ItemIdList)
		    WHILE @Length > 0
		    BEGIN
			--从表名字串中取出表名
		   	 EXECUTE @Length = flxp_PopFirstWord @ItemIdList OUTPUT, @FirstItemIdWord OUTPUT
			if upper(@FirstItemIdWord)<>upper(@strMainObject+".ZA0100")
				if ( @strFLD='')
					set @strfld=@FirstItemIdWord
				else
					set @strfld=@strfld+","+@FirstItemIdWord
		
		    end 
	end
--if upper(@strMainObject)<>'AB01'
--	begin
--		select @length=isnull(count(*),0) from r203 where typeno=@typeno and settableno=@settableno and isnull(mainobject,'')='AB01' 
--		if ( @strFLD='')
--			set @strfld="AB01.ZA0100"
--		else
--			set @strfld=@strfld+",AB01.ZA0100"
--	end
if(isnull(@userid,'')='')
	set @userid='sa'
--当前时间

select  @currDate=isnull(zb0102,'') from eb01 where za0101=@userid and eb0111='30'
if(isnull(@currDate,'')='')
	set @currDate= convert(datetime,getdate(),21)

if(isnull(@endTime,'')='')
	begin 
	select @rptType=type from r100 where typeno=@typeno and settableno=@settableno
	if (@rpttype='1')--年报
		begin
			select @starttime=startdate from r100 where typeno=@typeno and settableno=@settableno
			set @starttime=replace(@starttime,'上期|',cast(year(cast(@currDate as datetime))-1 as varchar(4))+'-')
			set @starttime=replace(@starttime,'本期|',cast(year(cast(@currDate as datetime)) as varchar(4))+'-')
			select @endTime=startdate from r100 where typeno=@typeno and settableno=@settableno
			set @endTime=replace(@endTime,'上期|',cast(year(cast(@currDate as datetime)) as varchar(4))+'-')
			set @endTime=replace(@endTime,'本期|',cast(year(cast(@currDate as datetime))+1 as varchar(4))+'-')
			set @endTime=convert(varchar(10),dateadd(day,-1, @endTime),120)
		end
	if (@rpttype='3')--月报
		begin
			--convert(varchar(40),getdate(),21)
			select @starttime=startdate from r100 where typeno=@typeno and settableno=@settableno
			set @starttime=replace(@starttime,'本期|',cast(year(cast(@currDate as datetime)) as varchar(4))+'-'+right('0'+cast(month(cast(@currDate as datetime)) as varchar(4)),2)+'-')
			set @currdate=convert( varchar(10),dateadd(month,-1,cast(@currdate as datetime)),120)
			set @starttime=replace(@starttime,'上期|',cast(year(cast(@currDate as datetime)) as varchar(4))+'-'+right('0'+cast(month(cast(@currDate as datetime)) as varchar(4)),2)+'-')
			set @currdate=convert( varchar(10),dateadd(month,1,cast(@currdate as datetime)),120)
			select @endTime=startdate from r100 where typeno=@typeno and settableno=@settableno
			set @endTime=replace(@endTime,'上期|',cast(year(cast(@currDate as datetime)) as varchar(4))+'-'+right('0'+cast(month(cast(@currDate as datetime)) as varchar(4)),2)+'-')
			set @currdate=convert( varchar(10),dateadd(month,1,cast(@currdate as datetime)),120)
			set @endTime=replace(@endTime,'本期|',cast(year(cast(@currDate as datetime)) as varchar(4))+'-'+right('0'+cast(month(cast(@currDate as datetime)) as varchar(4)),2)+'-')
			set @currdate=convert( varchar(10),dateadd(month,-1,cast(@currdate as datetime)),120)
			set @endTime=convert(varchar(10),dateadd(day,-1, @endTime),120)
		end
	end
--数字开始时间
if(isnull(@endTime,'')='')
	begin
		select @starttime=isnull(zb0102,'') from eb01 where za0101=@userid and eb0111='028'
		select @endTime=isnull(zb0102,'') from eb01 where za0101=@userid and eb0111='029'
	end

if(isnull(@endTime,'')='')
	begin
		set 	@endTime=@currDate	
		set 	@starttime=@currDate
	end	
--if(isnull(@starttime,'')='')
--	set @starttime=convert(varchar(20),getdate(),21)

--if(isnull(@endTime,'')='')
--	set @endTime=convert(varchar(20),getdate(),21)
--表示该表已经归档
if (@rpttype='1')--年报
begin
	select @row=count(*) from r220 where  typeno=@typeno and settableno=@settableno and tableno=@tableno and zb0110=@ZB0110 and left(starttime,4)=left(@endTime,4) and  zc9993='0'
	if (@row>0)
		goto abandon1
end
if (@rpttype='3')--月报
begin
	select @row=count(*) from r220 where  typeno=@typeno and settableno=@settableno and tableno=@tableno and zb0110=@ZB0110 and left(starttime,7)= left(@endTime,7)  and  zc9993='0'
	if (@row>0)
		goto abandon1
end



set @ItemIdList=''
--1、将SETSQL的值赋给statSQL

--begin tran

update r203 set statsql=setsql where typeno=@typeno and settableno=@settableno and tableno=@tableno
--2、将STATSQL进行替换
--2.1 处理常量
	if(@strCON<>'')
	begin
		set @strsql="declare curs_gwmc cursor for select za0101,ec0111 from ec01 where za0101 in ("+@strCON+") open curs_gwmc"
		exec(@strsql)
	        	fetch next from  curs_gwmc into @za0101,@value
		while(@@fetch_status=0)
			begin
				
				update r203 set statSQL=replace(statSQL,'$'+@za0101,@value)  where  typeno=@typeno and settableno=@settableno and tableno=@tableno
			        	fetch next from  curs_gwmc into @za0101,@value
			end
		close Curs_gwmc
		deallocate Curs_gwmc
	end
	--2.2处理函数
	declare @ed0114 varchar(100)
	if(@strFUN<>'')
	begin
		set @strSQL="declare curs_gwmc cursor for select za0101,ed0110 from ed01 where za0101 in ("+@strFUN+") open curs_gwmc"
		exec(@strsql)
	        	fetch next from  curs_gwmc into @za0101,@value
		while(@@fetch_status=0)
			begin
				if(@za0101='数字开始时间')
					update r203 set statSQL=replace(statSQL,'#'+@za0101,@starttime ) where  typeno=@typeno and settableno=@settableno and tableno=@tableno
				else if(@za0101='数字截止时间')
						update r203 set statSQL=replace(statSQL,'#'+@za0101,@endtime )  where typeno=@typeno and settableno=@settableno and tableno=@tableno
				else
--						if(@ed0114='')
							update r203 set statSQL=replace(statSQL,'#'+@za0101,@value)  where typeno=@typeno and settableno=@settableno and tableno=@tableno
--						else
--							begin
--								update r203 set statSQL=replace(statSQL,'#'+@za0101,'#'+@za0101+@ed0114) where typeno=@typeno and settableno=@settableno and tableno=@tableno
---							update r203 set statSQL=replace(statSQL,'#'+@za0101,@value) where typeno=@typeno and settableno=@settableno and tableno=@tableno
--							end


			        	fetch next from  curs_gwmc into @za0101,@value
			end
		close Curs_gwmc
		deallocate Curs_gwmc
	end

	--2.3处理表达式的前五种,缺少对于全表条件的处理
	set @declareSQL=''
	if(@strEXP<>'')
	begin
		set @strSQL=" declare Curs_gwmc cursor for 	select za0101,ee0114  from ee01  where  za0101 in ("+@strEXP+") and ee0115<>'6'  open curs_gwmc"
		exec(@strsql)
	        	fetch next from  curs_gwmc into @za0101,@value
		while(@@fetch_status=0)
			begin
				update r203 set statSQL=replace(statSQL,'^'+@za0101,"("+@value+")")  where  typeno=@typeno and settableno=@settableno and tableno=@tableno	
			        	fetch next from  curs_gwmc into @za0101,@value
			end
		close Curs_gwmc
		deallocate Curs_gwmc
	end
	--###########################################
	update r203 set statsql=replace(statsql,'^','') where typeno=@typeno and settableno=@settableno and tableno=@tableno
	set @tempSQL= @tempSQL+"   "
	set @strsql="select  "
	--3、生成临时表
	
	--3.1处理关联表
	set @ItemIdList=@objectAssicate
	SELECT @Length = DATALENGTH(@ItemIdList)
	    WHILE @Length > 0
	    BEGIN
		--从表名字串中取出表名
	   	 EXECUTE @Length = flxp_PopFirstWord @ItemIdList OUTPUT, @FirstItemIdWord OUTPUT
		set @strSQL=@strSQL+@FirstItemIdWord+" as ["+@FirstItemIdWord+"],"
	    end 
	
	--3.2处理字段
	set @ItemIdList=@strFLD
	SELECT @Length = DATALENGTH(@ItemIdList)
	    WHILE @Length > 0
	    BEGIN
		--从表名字串中取出表名
	   	 EXECUTE @Length = flxp_PopFirstWord @ItemIdList OUTPUT, @FirstItemIdWord OUTPUT

		set @strSQL=@strSQL+@FirstItemIdWord+" as ["+@FirstItemIdWord+"],"
	    end 
	    if(right(@strsql,1)=',')
	    set @strsql=left(@strsql,len(@strsql)-1)
	--生成临时表结构
		if @strTBL=""
			if(rtrim(@strsql)='select')
				set @strsql=@strsql+@strMainObject+".ZA0100 as za0100,"+@strMainObject+".zb9991 as zb9991,"+@strMainObject+".zb9992 as zb9992  into "+@jstable+" from "+@strMainObject+" where 1=2"
			else
				set @strsql=@strsql+","+@strMainObject+".ZA0100 as za0100,"+@strMainObject+".zb9991 as zb9991,"+@strMainObject+".zb9992 as zb9992  into "+@jstable+" from "+@strMainObject+" where 1=2"

		else
			if(rtrim(@strsql)='select')
				set @strsql=@strsql+@strMainObject+".ZA0100 as za0100,"+@strMainObject+".zb9991 as zb9991,"+@strMainObject+".zb9992 as zb9992  into "+@jstable+" from "+@strMainObject+","+@strTBL+" where 1=2"
			else
				set @strsql=@strsql+","+@strMainObject+".ZA0100 as za0100,"+@strMainObject+".zb9991 as zb9991,"+@strMainObject+".zb9992 as zb9992  into "+@jstable+" from "+@strMainObject+","+@strTBL+" where 1=2"

	exec(@strsql)
	--处理表达式，将表达式做为表的一个字段
	if(@strEXP<>'')
	begin
		set @strSQL=" declare Curs_gwmc cursor for 	select za0101,ee0114  from ee01  where  za0101 in ("+@strEXP+") and ee0115='6'  open curs_gwmc"
		exec(@strsql)

	        	fetch next from  curs_gwmc into @za0101,@value
		while(@@fetch_status=0)

			begin
				
				set @strSQL="alter table "+@jstable+" add ["+@za0101+"]  numeric(15,2)"
				exec(@strsql)
				--将SQL语中的^加变量替换成@加变量
				fetch next from  curs_gwmc into @za0101,@value
			end
		close Curs_gwmc
		deallocate Curs_gwmc
	end
	--3.3根据全表条件向临时表中增加记录
	--select top 1 @strsql=isnull(infofield,'') from gs_property where left(dictid,4)=@FirstItemIdWord
	if(@WholeCondition='') 
		if(@zb0110='0' or @zb0110='-1')
			set @strsql=" insert into "+@jstable+" (za0100,zb9991,zb9992)   select za0100,zb9991,zb9992 from "+@strMainObject+" where zc9993='1'"
		else
			if(upper(@strMainObject)<>'AB01')
				set @strsql=" insert into "+@jstable+" (za0100,zb9991,zb9992)   select za0100,zb9991,zb9992 from "+@strMainObject+" where  "+@strMainObject+".Ab0110  like '"+@zb0110+"%'   and zc9993='1'"
			else
				set @strsql=" insert into "+@jstable+" (za0100,zb9991,zb9992)   select za0100,zb9991,zb9992 from "+@strMainObject+" where  "+@strMainObject+".za0100  = '"+@zb0110+ "'  and  zc9993='1' "
	else
		if(@zb0110='0' or @zb0110='-1')
			set @strsql=" insert into "+@jstable+" (za0100,zb9991,zb9992)   select za0100,zb9991,zb9992 from "+@strMainObject+" where za0100 in ("+@WholeCondition+") and zc9993='1'"
		else
			if(upper(@strMainObject)<>'AB01')
				set @strsql=" insert into "+@jstable+" (za0100,zb9991,zb9992)   select za0100,zb9991,zb9992 from "+@strMainObject+" where za0100 in ("+@WholeCondition+") and "+@strMainObject+".Ab0110  like '"+@zb0110+"%'  and zc9993='1'"
			else
				set @strsql=" insert into "+@jstable+" (za0100,zb9991,zb9992)   select za0100,zb9991,zb9992 from "+@strMainObject+" where za0100 in ("+@WholeCondition+") and "+@strMainObject+".za0100  = '"+@zb0110+"' and zc9993='1'"


	exec(@strsql)


	--让row暂做为记录个数
	set @strSQL=" declare Curs_gwmc cursor for select count(*) from "+@jstable+"  open curs_gwmc"
	exec(@strsql)
       	fetch next from  curs_gwmc into @row
	close Curs_gwmc
	deallocate Curs_gwmc
		if @row=0 
		BEGIN
			--增加数据索引表
			 set @tableName='T'+cast(@typeNo as varchar(10))+'_'+cast(@settableno as varchar(10))+'_'+cast(@tableno as varchar(10))
			set @strsql="delete from r220  where   zb0110='"+@zb0110+"' and  starttime='"+@endTime+"'  and typeno="+ cast(@typeno as varchar(10))+" and settableno="+cast(@settableno as varchar(10))+" and tableno="+cast(@tableno as varchar(10))
			exec(@strsql)
			set @strsql="insert into r220 (typeno,settableno,tableno,zb0110,starttime,startdate)  values ("+cast(@typeno as varchar(10))+","+cast(@settableno as varchar(10))+","+cast(@tableno as varchar(10))+",'"+@zb0110+"','"+@endtime+"','"+@starttime +"')"
			exec(@strsql)
			--41复制数据表的数据
			set @strsql="delete from  "+@tableName+" where   zb0110='"+@zb0110+"' and  starttime='"+@endTime+"' "-- and typeno="+ cast(@typeno as varchar(10))+" and settableno="+cast(@settableno as varchar(10))+" and tableno="+cast(@tableno as varchar(10))
			exec(@strsql)
			set @strsql="select * into ##wltemp from "+@tableName+" where  ZB0110 is null 	update ##wltemp set zb0110='"+@zb0110+"',starttime='"+@endTime+"' ,zc9993='1'"
			exec(@strsql)
			set @strsql="update " +@tableName+" set  zc9993='0' where zb0110='"+@zb0110+"'   insert into "+@tableName+" select * from 	 ##wltemp  drop table ##wltemp"
			exec(@strsql)
			goto abandon
		END

		--3.4向临时表中增加每一列的值
---------------------------------------------------------------------
		--考虑表达式的处理

			if(@strEXP<>'')
			begin
				set @strSQL=" declare Curs_gwmc cursor for 	select za0101,ee0114  from ee01  where  za0101 in ("+@strEXP+") and ee0115='6'  open curs_gwmc"
				exec(@strsql)
		
			        	fetch next from  curs_gwmc into @za0101,@value
				while(@@fetch_status=0)
					begin
						
						--set @value="update "+@jstable+" set ["+@za0101+"]="+@za0101+"."+@za0101+"  from ("+@value+") as " + @za0101+" where "+@za0101+".za0100="+@jstable+".za0100"
						--exec(@value)
						set @strSQL="update "+@jstable+" set ["+@za0101+"]=["+@za0101+"].["+@za0101+"] from ("+@value+") as ["+@za0101+"] where "+@jstable+".za0100=["+@za0101+"].za0100"
						exec(@strsql)

						fetch next from  curs_gwmc into @za0101,@value
					end
				close Curs_gwmc
				deallocate Curs_gwmc
			end


---------------------------------------------------关联主对象中的数据赋值
		set @ItemIdList=@objectAssicate
		SELECT @Length = DATALENGTH(@ItemIdList)
		    WHILE @Length > 0
		    BEGIN
			--从表名字串中取出表名
	
		   	 EXECUTE @Length = flxp_PopFirstWord @ItemIdList OUTPUT, @FirstItemIdWord OUTPUT
			set @strsql="update "+@jstable+" set ["+@FirstItemIdWord+"]="+@FirstItemIdWord+" from "+left(@FirstItemIdWord,4)+" where "+@jstable+".za0100="+left(@FirstItemIdWord,4)+".za0100"
			exec(@strsql)
	
		    end 

--------------------------------------------------------------

	set @ItemIdList=@strFLD
	set @tablename=""
	set @FieldName=""

	SELECT @Length = DATALENGTH(@ItemIdList)
	    WHILE @Length > 0
	    BEGIN


		--从表名字串中取出表名
	   	 EXECUTE @Length = flxp_PopFirstWord @ItemIdList OUTPUT, @FirstItemIdWord OUTPUT
		set @tablename=left(@FirstItemIdWord,4)
		set @FieldName=substring(@FirstItemIdWord,6,6)

		--是主对象
		if(@strMainObject=left(@FirstItemIdWord,4))
		begin
			set @value="update "+@jstable+" set ["+@FirstItemIdWord+"]="+@FirstItemIdWord+" from "+left(@FirstItemIdWord,4)+" where "+@jstable+".za0100="+left(@FirstItemIdWord,4)+".za0100"
			exec(@value)
		end
		--主对象的子集
		else if(left(@strMainObject,2)=left(@FirstItemIdWord,2))
		begin
			set @value="update "+@jstable+" set ["+@FirstItemIdWord+"]="+@FirstItemIdWord+" from "+left(@FirstItemIdWord,4)+" where "+@jstable+".za0100="+left(@FirstItemIdWord,4)+".za0100 and "+left(@FirstItemIdWord,4)+".zc9993='1'"
			exec(@value)
		end
		--关联对象的主集
		else if(left(@strMainObject,2)<>left(@FirstItemIdWord,2) and substring(@FirstItemIdWord,3,2)='01' )


		begin
			select top 1 @za0101=isnull(infofield,'') from gs_property where left(dictid,4)=@tablename
			set @value="update "+@jstable+" set ["+@FirstItemIdWord+"]=kk."+@FieldName+" from (select "+@strMainObject+".za0100," +@FirstItemIdWord+" from "+@strMainObject+" left join "+@tablename+" on "+@strMainObject+"."+@za0101+"="+@tablename+".za0100) as kk where kk.za0100="+@jstable+".za0100"
			exec(@value)
		end
		--关联对象的子集
		else
		begin
			select top 1 @za0101=isnull(infofield,'') from gs_property where left(dictid,4)=left(@tablename,2)+'01'
			set @value="update "+@jstable+" set ["+@FirstItemIdWord+"]=kk."+@FieldName+" from (select "+@strMainObject+".za0100," +@FirstItemIdWord+" from "+@strMainObject+" left join "+left(@tablename,2)+'01'+" on "+@strMainObject+"."+@za0101+"="+left(@tablename,2)+'01'+".za0100 left join "+@tableName+"  on  " +left(@tablename,2)+'01'+".za0100= "+@tablename+".za0100 and "  +@tablename +".zc9993='1' ) as kk where kk.za0100="+@jstable+".za0100"
			exec(@value)
		end
	    end 
--4报表统计
	--增加数据索引表
	set @strsql="delete from r220  where   zb0110='"+@zb0110+"' and  starttime='"+@endTime+"'  and typeno="+ cast(@typeno as varchar(10))+" and settableno="+cast(@settableno as varchar(10))+" and tableno="+cast(@tableno as varchar(10))
	exec(@strsql)
	set @strsql="update r220  set  zc9993='0' where zb0110='"+@zb0110+"'   and typeno="+ cast(@typeno as varchar(10))+" and settableno="+cast(@settableno as varchar(10))+" and tableno="+cast(@tableno as varchar(10))
	exec(@strsql)
	set @strsql="insert into r220 (typeno,settableno,tableno,zb0110,starttime,startdate)  values ("+cast(@typeno as varchar(10))+","+cast(@settableno as varchar(10))+","+cast(@tableno as varchar(10))+",'"+@zb0110+"','"+@endtime+"','"+@starttime +"')"
	exec(@strsql)
	 set @tableName='T'+cast(@typeNo as varchar(10))+'_'+cast(@settableno as varchar(10))+'_'+cast(@tableno as varchar(10))
	if  not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].['+@tableName+']') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
		goto dealunit
	--41复制数据表的数据
	set @strsql="delete from  "+@tableName+" where   zb0110='"+@zb0110+"' and  starttime='"+@endTime+"' "-- and typeno="+ cast(@typeno as varchar(10))+" and settableno="+cast(@settableno as varchar(10))+" and tableno="+cast(@tableno as varchar(10))
	exec(@strsql)
	set @strsql="select * into ##wltemp from "+@tableName+" where  ZB0110 is null 	update ##wltemp set zb0110='"+@zb0110+"',starttime='"+@endTime+"' ,zc9993='1'"
	exec(@strsql)
	set @strsql="update " +@tableName+" set  zc9993='0' where zb0110='"+@zb0110+"'   insert into "+@tableName+" select * from 	 ##wltemp  drop table ##wltemp"
	exec(@strsql)
	--数据表生成完毕
	--数据表生成完毕
	--4.2
	--@length暂用来表示序列
	declare @RowSQl varchar(2000)
	declare @ColSQl varchar(2000)
	declare @ROWdealstyle varchar(1)
	declare @ROWstatObject varchar(20)
	declare @ROWSequencetype varchar(1)
	declare @COLdealstyle varchar(1)
	declare @COLstatObject varchar(20)
	declare @COLSequencetype varchar(1)
	declare @RowdealFieldname varchar(1000)
	declare @ColdealFieldname varchar(1000)
	--计算行条件统计的结果
	declare @statValue int
	set @row=1
	set @col=1
	declare curs_gwmc cursor for select serialNo from r202 where   icount<>0   and   serialtype='1' and  typeno=@typeno and settableno=@settableno and tableno=@tableno open curs_gwmc
        	fetch next from  curs_gwmc into @length
	--处理只有列的序列

	if( @@fetch_status<>0)
		begin
			declare curs_OnlyCol cursor for select statSQL,dealstyle,isnull(statObject,'za0100'),sequenceType,dealfieldname,mainobject  from r203  where typeno=@typeno and settableno=@settableno and tableno=@tableno  and cast(typeno as varchar(10))+'A'+cast(settableno as varchar(10))+'A'+cast(tableno as varchar(10))+'A'+cast(serialno as varchar(10)) in (select cast(typeno as varchar(10))+'A'+cast(settableno as varchar(10))+'A'+cast(tableno as varchar(10))+'A'+cast(serialno as varchar(10)) from r202 where serialtype='2') order by r203.serialno,sequenceno open curs_OnlyCol
        			fetch next from  curs_OnlyCol into @ColSQl,@coldealstyle,@colstatObject,@colSequencetype,@coldealFieldname,@otherMainobject
			set @ColSQl=replace(@ColSQl,upper(@strMainObject+".ZA0100"),'ZA0100')
			while(@@fetch_status=0)
			begin
			if(@colSequencetype<>'4') 
				begin
--					处理方式0:计数，1:求和2:最大值3:最小值4:平均值5:中位值6:平均人数
					if(@colSequencetype='2') set @colSQl=' 1=1 '
					if(@colSequencetype='1' or @colSequencetype='2')
						begin
						if @othermainobject<>"" 
							set @coldealFieldname=" distinct "+@coldealFieldname
						if (@coldealstyle='6')
							begin
								set @strsql=" declare @startdata int  declare @enddata int "
								set @strsql=@strsql+" set  @startdata=(select count(*) from "+@jstable+"  where "+rtrim(@ColSQl)+" and zb9991<='" + @starttime+"' and zb9992>='"+@starttime+"') " 
								set @strsql=@strsql+" set  @enddata=(select count(*) from "+@jstable+"  where "+rtrim(@ColSQl)+" and zb9991<='" + @endtime+"' and zb9992>='"+@endtime+"') " 
								set @strsql=@strsql+" update "+@tableName+" set C"+cast(@col as varchar(3))+"=isnull((@startdata+@enddata)/2,0)  where  zb0110='"+@zb0110+"' and zc9993='1'and rowid=1" 
							end


						else if (@coldealstyle='5')
							set @strsql=" update "+@tableName+" set C"+cast(@col as varchar(3))+"=(select isnull((max("+@coldealFieldname+") +min("+@coldealFieldname+"))/2,0) from "+@jstable+"  where "+rtrim(@ColSQl)+") where  zb0110='"+@zb0110+"' and zc9993='1'and rowid=1" 
						else if(@coldealstyle='4')
							
							set @strsql=" update "+@tableName+" set C"+cast(@col as varchar(3))+"=(select isnull(avg("+@coldealFieldname+"),0) from "+@jstable+"  where "+rtrim(@ColSQl)+") where zb0110='"+@zb0110+"' and zc9993='1'and  rowid=1"
						else if(@coldealstyle='3')
							set @strsql=" update "+@tableName+" set C"+cast(@col as varchar(3))+"=(select isnull(min("+@coldealFieldname+"),0) from "+@jstable+"  where "+rtrim(@ColSQl)+") where zb0110='"+@zb0110+"' and zc9993='1'and  rowid=1" 
						else if(@coldealstyle='2')
							set @strsql=" update "+@tableName+" set C"+cast(@col as varchar(3))+"=(select isnull(max("+@coldealFieldname+"),0) from "+@jstable+"  where "+rtrim(@ColSQl)+") where zb0110='"+@zb0110+"' and zc9993='1'and  rowid=1" 
						else if(@coldealstyle='1')
							set @strsql=" update "+@tableName+" set C"+cast(@col as varchar(3))+"=(select isnull(sum("+@coldealFieldname+"),0) from "+@jstable+"  where "+rtrim(@ColSQl)+") where zb0110='"+@zb0110+"' and zc9993='1'and  rowid=1"
						else 
							begin
							if(@colstatObject="")
								set @colstatObject="za0100"
								set @strsql=" update "+@tableName+" set C"+cast(@col as varchar(3))+"=(select count( distinct "+@colstatObject+") from "+@jstable+"  where "+rtrim(@ColSQl)+") where zb0110='"+@zb0110+"' and zc9993='1'and  rowid=1" 
							end

	
					
						exec(@strsql)
						end
				end 
        				fetch next from  curs_OnlyCol into @ColSQl,@coldealstyle,@colstatObject,@colSequencetype,@coldealFieldname,@otherMainobject
					set @ColSQl=replace(@ColSQl,upper(@strMainObject+".ZA0100"),'ZA0100')
		
				set @col=@col+1
			end
			close curs_OnlyCol
			deallocate curs_OnlyCol

		end		
	else--处理有行/列的序列
	while(@@fetch_status=0)
		begin
		--update r203 set statSQL=replace(statSQL,'$'+@za0101,@value)  where  typeno=@typeno and settableno=@settableno and tableno=@tableno
			declare curs_row cursor for select rtrim(statSQL),dealstyle,isnull(statObject,'za0100'),sequenceType,dealfieldname from r203 where    typeno=@typeno and settableno=@settableno and tableno=@tableno and serialno=@length open curs_row
        			fetch next from  curs_row into @RowSQl,@rowdealstyle,@rowstatObject,@rowSequencetype,@RowdealFieldname
			set @RowSQl=replace(@RowSQl,upper(@strMainObject+".ZA0100"),'ZA0100')
			while(@@fetch_status=0)
			begin	
				set @col=1
				if(isnull(@RowSQl,'')='')
				set @RowSQl='1=1'
				set @strsql="declare curs_Onlyrow cursor for   select count(*)  from "+@jstable+"  where "+@RowSQl+" open curs_Onlyrow"
				exec(@strsql)
        				fetch next from  curs_Onlyrow into @statValue
				close curs_Onlyrow

				deallocate curs_Onlyrow
				--set  @statValue = select count(*)  from "+@jstable+"  where @RowSQl
				--set @strsql='select @statValue=count(*)  from "+@jstable+"  where ' +@RowSQl
				--exec(@strsql)
				if(@rowSequencetype<>'4')
				begin
				if(@rowSequencetype='2') set @RowSQl=' 1=1 '
				if(@statvalue>0)
				begin
					declare curs_col cursor for select rtrim(statSQL),dealstyle,isnull(statObject,'za0100'),sequenceType,dealfieldname,isnull(mainobject,'')  from r203  where cast(typeno as varchar(10))+'A'+cast(settableno as varchar(10))+'A'+cast(tableno as varchar(10))+'A'+cast(serialno as varchar(10)) in (select cast(typeno as varchar(10))+'A'+cast(settableno as varchar(10))+'A'+cast(tableno as varchar(10))+'A'+cast(serialno as varchar(10)) from r202 where typeno=@typeno and settableno=@settableno and tableno=@tableno  and serialtype='2')   order by r203.serialno,r203.sequenceno open curs_col
		        			fetch next from  curs_col into @ColSQl,@coldealstyle,@colstatObject,@colSequencetype,@coldealFieldname,@otherMainobject
					set @ColSQl=replace(@ColSQl,upper(@strMainObject+".ZA0100"),'ZA0100')

					if(@@fetch_status<>0)--处理没有列的行序列
--------------------------------------------------------------------------------------------------------------
					begin
						if @othermainobject<>"" 
							set @coldealFieldname=" distinct "+@coldealFieldname
	
						if(@rowSequencetype='1' or @rowSequencetype='2')
						if (@coldealstyle='6')
							begin
								set @strsql=" declare @startdata int  declare @enddata int "
								set @strsql=@strsql+" set  @startdata=(select count(*) from "+@jstable+"  where "+rtrim(@RowSQl)+" and zb9991<='" + @starttime+"' and zb9992>='"+@starttime+"') " 
								set @strsql=@strsql+" set  @enddata=(select count(*) from "+@jstable+"  where "+rtrim(@RowSQl)+" and zb9991<='" + @endtime+"' and zb9992>='"+@endtime+"') " 
								set @strsql=@strsql+" update "+@tableName+" set C1=isnull((@startdata+@enddata)/2,0)  where  zb0110='"+@zb0110+"' and zc9993='1'  and  rowid="+ cast(@row as varchar(3))
							end

						else if (@coldealstyle='5')

							set @strsql=" update "+@tableName+" set C1=(select isnull((max("+@RowdealFieldname+") +min("+@RowdealFieldname+"))/2,0) from "+@jstable+"  where "+rtrim(@RowSQl)+") where  zb0110='"+@zb0110+"' and zc9993='1'  and  rowid="+ cast(@row as varchar(3))
							else if(@rowdealstyle='4')
								set @strsql="update "+@tableName+" set C1=(select isnull(avg("+@RowdealFieldname+"),0) from "+@jstable+"  where "+@RowSQl+") where zb0110='"+@zb0110+"' and zc9993='1' and  rowid="+ cast(@row as varchar(3))
							else if(@rowdealstyle='3')
								set @strsql="update "+@tableName+" set C1=(select isnull(min("+@RowdealFieldname+"),0) from "+@jstable+"  where "+@RowSQl+") where zb0110='"+@zb0110+"' and zc9993='1' and  rowid=" +cast(@row as varchar(3))

							else if(@rowdealstyle='2')
								set @strsql="update "+@tableName+" set C1=(select isnull(max("+@RowdealFieldname+"),0) from "+@jstable+"  where "+@RowSQl+") where zb0110='"+@zb0110+"' and zc9993='1' and  rowid=" +cast(@row as varchar(3))
							else if(@rowdealstyle='1')
								set @strsql="update "+@tableName+" set C1=(select isnull(sum("+@RowdealFieldname+"),0) from "+@jstable+"  where "+@RowSQl+") where zb0110='"+@zb0110+"' and zc9993='1' and  rowid="+ cast(@row as varchar(3))
							else 
								begin
								if(@rowstatObject="")
									set @rowstatObject="za0100"
								
								set @strsql="update "+@tableName+" set C1=(select count( distinct "+@rowstatObject+") from "+@jstable+"  where "+@RowSQl+") where zb0110='"+@zb0110+"' and zc9993='1'  and   rowid=" +cast(@row as varchar(3))
								end

							exec(@strsql)
					end
					else--处理有行列的序列
						begin


							while(@@fetch_status=0)
							begin
								
	-------------------------------------------------------------------------------处理行列条件的单元数据
								if @colSequencetype<>'4'
								begin
									if(@colSequencetype='1' or  @colSequencetype='2' )
										if(@coldealstyle='0' and @rowdealstyle<>'0')
										begin
											set @coldealstyle=@rowdealstyle
											set @coldealFieldname=@rowdealFieldname
										end
										if(@colSequencetype='2') set @colSQl=' 1=1 '
										if (@coldealstyle='6')
											begin
												set @strsql=" declare @startdata int  declare @enddata int "
												set @strsql=@strsql+" set  @startdata=(select count(*) from "+@jstable+"  where ("+@colSQl+") and ("+@RowSQl+") and zb9991<='" + @starttime+"' and zb9992>='"+@starttime+"') " 
												set @strsql=@strsql+" set  @enddata=(select count(*) from "+@jstable+"  where ("+@colSQl+") and ("+@RowSQl+") and zb9991<='" + @endtime+"' and zb9992>='"+@endtime+"') " 
												set @strsql=@strsql+" update "+@tableName+" set C"+cast(@col as varchar(3))+"=isnull((@startdata+@enddata)/2,0)  where  zb0110='"+@zb0110+"' and zc9993='1'  and  rowid="+ cast(@row as varchar(3))
											end
										else if (@coldealstyle='5')
											set @strsql=" update "+@tableName+" set C"+cast(@col as varchar(3))+"=(select isnull((max("+@coldealFieldname+") +min("+@coldealFieldname+"))/2,0) from "+@jstable+"  where ("+@colSQl+") and ("+@RowSQl+")) where  zb0110='"+@zb0110+"' and zc9993='1'  and  rowid="+ cast(@row as varchar(3))
										else if(@coldealstyle='4')
											set @strsql="update "+@tableName+" set C"+cast(@col as varchar(3))+"=(select isnull(avg("+@coldealFieldname+"),0) from "+@jstable+"  where ("+@colSQl+") and ("+@RowSQl+")) where zb0110='"+@zb0110+"' and zc9993='1'and  rowid=" +cast(@row as varchar(3))
										else if(@coldealstyle='3')
											set @strsql="update "+@tableName+" set C"+cast(@col as varchar(3))+"=(select isnull(min("+@coldealFieldname+"),0) from "+@jstable+"  where ("+@colSQl+") and ("+@RowSQl+")) where zb0110='"+@zb0110+"' and zc9993='1'and  rowid=" +cast(@row as varchar(3))
										else if(@coldealstyle='2')
											set @strsql="update "+@tableName+" set C"+cast(@col as varchar(3))+"=(select isnull(max("+@coldealFieldname+"),0) from "+@jstable+"  where ("+@colSQl+") and ("+@RowSQl+")) where zb0110='"+@zb0110+"' and zc9993='1'and  rowid=" +cast(@row as varchar(3))
										else if(@coldealstyle='1')
											set @strsql="update "+@tableName+" set C"+cast(@col as varchar(3))+"=(select isnull(sum("+@coldealFieldname+"),0) from "+@jstable+"  where ("+@colSQl+") and ("+@RowSQl+")) where zb0110='"+@zb0110+"' and zc9993='1'and  rowid=" +cast(@row as varchar(3))
										else 
											begin
											if(@colstatObject='' )
												if(@rowstatObject<>'')
													set @colstatObject=@rowstatObject
												else
													set @colstatObject="za0100"
											
											set @strsql="update "+@tableName+" set C"+cast(@col as varchar(3))+"=(select count( distinct "+@colstatObject+") from "+@jstable+"  where ("+rtrim(@colSQl)+") and  ("+rtrim(@RowSQl)+")) where zb0110='"+@zb0110+"' and zc9993='1'and  rowid=" +cast(@row as varchar(3))
											end

									--else goto abandon1
	 								exec(@strsql)
									if @@error<>0
										begin
										goto abandon1
										end
								end

	---------------------------------------------------------------------------------
								fetch next from  curs_col into @ColSQl,@coldealstyle,@colstatObject,@colSequencetype,@coldealFieldname,@otherMainobject
								set @ColSQl=replace(@ColSQl,upper(@strMainObject+".ZA0100"),'ZA0100')
								set @col=@col+1
							end

						end
						
					close Curs_col
					deallocate Curs_col
	

----------------------------------------------------------------------------------------------------------------
				end
				end
				set @row=@row+1
				fetch next from  curs_row into @RowSQl,@rowdealstyle,@rowstatObject,@rowSequencetype,@RowdealFieldname
				set @RowSQl=replace(@RowSQl,upper(@strMainObject+".ZA0100"),'ZA0100')
			end
			close Curs_row
			deallocate Curs_row

		        	fetch next from  curs_gwmc into @length
		end
	close Curs_gwmc
	deallocate Curs_gwmc
	dealunit:
	--处理单元条件，即补充资料的数据
	--set @strsql=" delete from r230  where   zb0110='"+@zb0110+"'  and typeno="+ cast(@typeno as varchar(10))+" and settableno="+cast(@settableno as varchar(10))+" and tableno="+cast(@tableno as varchar(10))
	--exec(@strsql)
	--处理单元数据
	set @strsql="update r230  set  zc9993='0' where zb0110='"+@zb0110+"'   and typeno="+ cast(@typeno as varchar(10))+" and settableno="+cast(@settableno as varchar(10))+" and tableno="+cast(@tableno as varchar(10))
	exec(@strsql)
	set    @strsql="delete from r230  where   zb0110='"+@zb0110+"' and  starttime='"+@endTime+"'  and typeno="+ cast(@typeno as varchar(10))+" and settableno="+cast(@settableno as varchar(10))+" and tableno="+cast(@tableno as varchar(10))
	exec(@strsql)
	if @@error<>0
	    goto abandon1

	----------------------------------------------------------------------------
	declare curs_unit cursor for select  startrow,startcol, rtrim(isnull(statSQL,'1=2')),isnull(dealstyle,'0'),isnull(statObject,'za0100'),isnull(sequenceType,'1'),dealfieldname from r201 left join  r202 on r201.typeno=r202.typeno and r201.settableno=r202.settableno and r201.tableno=r202.tableno  and r201.serialno=r202.serialno left join  r203 on  r201.typeno=r203.typeno and r201.settableno=r203.settableno and r201.tableno=r203.tableno  and r201.serialno=r203.serialno where r203.typeno=@typeno and r203.settableno=@settableno and r203.tableno=@tableno  and r202.serialtype='3'   order by r203.serialno,r203.sequenceno open curs_unit
	fetch next from  curs_unit into @row,@col,@colSQl,@coldealstyle,@colstatObject,@colSequencetype,@coldealFieldname
	set @ColSQl=replace(@ColSQl,upper(@strMainObject+".ZA0100"),'ZA0100')

	if @colstatObject=""
		set @colstatObject='za0100'
	while(@@fetch_status=0)
--------------------------------------------------------------------------------------------------------------
	begin
	
		if(@colSequencetype='1' or @colSequencetype='2')
		--6-1程序处理均有错误
		if (@coldealstyle='6')
			begin
				set @strsql=" declare @startdata int  declare @enddata int "
				set @strsql=@strsql+" set  @startdata=(select count(*) from "+@jstable+"  where "+rtrim(@RowSQl)+" and zb9991<='" + @starttime+"' and zb9992>='"+@starttime+"') " 
				set @strsql=@strsql+" set  @enddata=(select count(*) from "+@jstable+"  where "+rtrim(@RowSQl)+" and zb9991<='" + @endtime+"' and zb9992>='"+@endtime+"') " 
				set @strsql=@strsql+"  insert into r230 (typeno,setableno,tableno,zb0110,starttime,row,col,value) values ("+@typeno+","+@settableno+","+@tableno+",'"+@zb0110+"','"+@endtime+"',"+@row+","+@col+",(@startdata+@enddata)/2)"
			end

		else if (@coldealstyle='5')
			--enddata表示一个变量，即计算出来的结果
			begin
				set @strsql=+" set  @enddata=(select (max("+@coldealFieldname+") +min("+@coldealFieldname+"))/2 from "+@jstable+"  where "+rtrim(@colSQl)
				--set @strsql=@strsql+"  insert into r230 (typeno,setableno,tableno,zb0110,row,col,value) values ("+@typeno+","+@settableno+","+@tableno+",'"+@zb0110+"',"+@row+","+@col+",@enddata)"
				set @strsql=@strsql+"  insert into r230 (typeno,setableno,tableno,zb0110,starttime,row,col,value) values ("+@typeno+","+@settableno+","+@tableno+",'"+@zb0110+"','"+@endtime+"',"+@row+","+@col+",@enddata)"

			end
		else if(@rowdealstyle='4')--平均人数暂不做
			begin
				set @strsql=+" set  @enddata=(select avg("+@coldealFieldname+")  from "+@jstable+"  where "+rtrim(@colSQl)
				set @strsql=@strsql+"  insert into r230 (typeno,setableno,tableno,zb0110,starttime,row,col,value) values ("+@typeno+","+@settableno+","+@tableno+",'"+@zb0110+"','"+@endtime+"',"+@row+","+@col+",@enddata)"
			end

		else if(@rowdealstyle='3')
			begin
				set @strsql=+" set  @enddata=(select min("+@coldealFieldname+")  from "+@jstable+"  where "+rtrim(@colSQl)
				set @strsql=@strsql+"  insert into r230 (typeno,setableno,tableno,zb0110,starttime,row,col,value) values ("+@typeno+","+@settableno+","+@tableno+",'"+@zb0110+"','"+@endtime+"',"+@row+","+@col+",@enddata)"

				--set @strsql=@strsql+"  insert into r230 (typeno,setableno,tableno,zb0110,row,col,value) values ("+@typeno+","+@settableno+","+@tableno+",'"+@zb0110+"',"+@row+","+@col+",@enddata)"
			end
		else if(@rowdealstyle='2')
			begin
				set @strsql=+" set  @enddata=(select max("+@coldealFieldname+")  from "+@jstable+"  where "+rtrim(@colSQl)
				--set @strsql=@strsql+"  insert into r230 (typeno,setableno,tableno,zb0110,row,col,value) values ("+@typeno+","+@settableno+","+@tableno+",'"+@zb0110+"',"+@row+","+@col+",@enddata)"
				set @strsql=@strsql+"  insert into r230 (typeno,setableno,tableno,zb0110,starttime,row,col,value) values ("+@typeno+","+@settableno+","+@tableno+",'"+@zb0110+"','"+@endtime+"',"+@row+","+@col+",@enddata)"
			end
		else if(@rowdealstyle='1')
			begin
				set @strsql=+" declare  @enddata int   set  @enddata=(select sum("+@coldealFieldname+")  from "+@jstable+"  where "+rtrim(@colSQl)
				--set @strsql=@strsql+"  insert into r230 (typeno,setableno,tableno,zb0110,row,col,value) values ("+@typeno+","+@settableno+","+@tableno+",'"+@zb0110+"',"+@row+","+@col+",@enddata)"
				set @strsql=@strsql+"  insert into r230 (typeno,setableno,tableno,zb0110,starttime,row,col,svalue) values ("+@typeno+","+@settableno+","+@tableno+",'"+@zb0110+"','"+@endtime+"',"+@row+","+@col+",@enddata)"
			end
		else 
			begin
				set @strsql=" declare  @enddata int  set  @enddata=(select  count( distinct "+@colstatObject+") from "+@jstable+"  where "+rtrim(@colSQl)+")"
				set @strsql=@strsql+"  insert into r230 (typeno,settableno,tableno,zb0110,starttime,row,col,svalue) values ("+cast(@typeno as varchar(10))+","+cast(@settableno as varchar(10))+","+cast(@tableno as varchar(10))+",'"+@zb0110+"','"+@endtime+"',"+cast(@row as varchar(10))+","+cast(@col as varchar(10))+",@enddata )"
				--set @strsql=@strsql+"  insert into r230 (typeno,settableno,tableno,zb0110,starttime,row,col,value) values ("+@typeno+","+@settableno+","+@tableno+",'"+@zb0110+"','"+@endtime+"',"+@row+","+@col+",@enddata)"
			end
			exec(@strsql)
			fetch next from  curs_unit into @row,@col,@colSQl,@coldealstyle,@colstatObject,@colSequencetype,@coldealFieldname
			set @ColSQl=replace(@ColSQl,upper(@strMainObject+".ZA0100"),'ZA0100')

			if @colstatObject=""
				set @colstatObject='za0100'
		end
	close curs_unit
	deallocate curs_unit
	----------------------------------------------------------------------------
	abandon:
        --处理当前日期030


	declare @pkey varchar(20)
	select @pkey=right('000'+cast(max(cast(za0100 as int))+1 as varchar),3) from eb01
	if @pkey is null
		set @pkey='100'
	delete from  eb01 where eb0111 ='030' and za0101=@userid

	--delete from  eb01 where eb0111 in ('030','028','029') and za0101=@userid
	set @strsql="insert into eb01 (za0100,eb01id,za0101,eb0111,zb0102) values ('"+ @pkey+"',200,'"+@userid+"','030','"+convert(varchar(10),getdate(),21)+"')"
	exec(@strsql)
	--set @strsql="insert into eb01 (za0100,eb01id,za0101,eb0111,zb0102) values ('"+ @pkey+'1'+"',300,'"+@userid+"','028','"+@starttime+"')"
	--exec(@strsql)
	--set @strsql="insert into eb01 (za0100,eb01id,za0101,eb0111,zb0102) values ('"+ @pkey+'2'+"',300,'"+@userid+"','029','"+@endTime+"')"
	--exec(@strsql)

	--@endTime
	--@starttime
	--update eb01 set zb0102=convert(varchar(10),getdate(),21) where eb0111='030'

	--变量处理
	--@Userid

	--set @strsql="insert into r230 (typeno,settableno,tableno,zb0110,starttime,row,col,svalue) select typeno,settbl,tablno,'"+@ZB0110+"','"+@endtime+ "',startr,startc,case when eb0111='028' then  '"+@starttime+"' when eb0111='029'  then '"+@endtime+"' else zb0102  end from eb01 left join eg01 on eb01.eb0111=eg01.za0100 and eb01.za0101=eg01.userid where eg01.settbl="+cast(@settableNo as varchar(10))+" and typeno="+cast(@typeno as varchar(10))+" and tablno="+cast(@tableno as varchar(10))+" and userid='"+@userid +"' "
	set @strsql="insert into r230 (typeno,settableno,tableno,zb0110,starttime,row,col,svalue) select typeno,settbl,tablno,'"+@ZB0110+"','"+@endtime+ "',startr,startc,case when eb0111='028' then  '"+@starttime+"' when eb0111='029'  then '"+@endtime+"' else zb0102  end from eb01 left join eg01 on eb01.eb0111=eg01.za0100  where eg01.settbl="+cast(@settableNo as varchar(10))+" and typeno="+cast(@typeno as varchar(10))+" and tablno="+cast(@tableno as varchar(10))+" and eb01.za0101='"+@userid +"' "
	exec(@strsql)
	--delete from  eb01 where eb0111 in ('030','028','029') and za0101=@userid
	set @strsql="	drop table "+@jstable
	exec(@strsql)
--	commit tran
	abandon1:
set @outsql=@strsql






GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO










CREATE         PROCEDURE  flxp_salary_AddAA58--工资子集加记录
 @salaryNo varchar(20),
 @condition varchar(2000)=null
AS

SET QUOTED_IDENTIFIER OFF 
declare @strsql varchar(2000)
declare @infofield varchar(6)
declare @fields1 varchar(2000)
declare @fields2 varchar(2000)
declare @zc9995 varchar(10)
select @zc9995=zc9995 from as01 where za0100=@salaryNo
if(isnull(@condition,'')='')
	begin
	set @condition='1=1'
	end
else
	begin
	set @condition="za0100 in ("+@condition+")"
	end

--set @strSQl=" declare curs_g cursor for select infofield from gs_property where infoid='aa58' and isnull(standbyvarchar,'')='' and flag='0' and infofield not in ('aa58id','zc9993') and Restriction<>'7' open curs_g"
--exec(@strsql)

---fetch next from  curs_g into @infofield
--while(@@fetch_status=0)
--	begin
--		if @fieldsBase=""
--			begin
--				set @fieldsBase=@infofield
--			end
--		else
--			begin
--				set @fieldsBase=@fieldsBase+","+@infofield
--			end
--		fetch next from  curs_g into @infofield
--	end
--close Curs_g
--deallocate Curs_g

set @fields1=''
set @fields2=''

set @strSQl=" declare curs_g cursor for select infofield from gs_property where infoid='aa58' and state='1' and standbyvarchar='A'  open curs_g"
exec(@strsql)
fetch next from  curs_g into @infofield
while(@@fetch_status=0)
	begin
		if @fields1=""
			begin
				set @fields1=@infofield
				set @fields2='_'+right(@infofield,5)
			end
		else
			begin
				set @fields1=@fields1+","+@infofield
				set @fields2=@fields2+",_"+right(@infofield,5)
			end
		fetch next from  curs_g into @infofield
	end
close Curs_g
deallocate Curs_g
if @fields1<>""
begin
	--set @fields1="za0100,aa58id,"+@fields1
	--set @fields2="za0100,aa58id+100,"+@fields2
	set @fields1="za0100,aa58id,zc9993,"+@fields1
	set @fields2="za0100,aa58id+100,'*',"+@fields2

	set @strsql="insert into aa58 ("+@fields1+") select "+@fields2+" from aa58 where zc9993='1' and "+@condition
	exec(@strsql)
        set @strsql="update aa58 set zc9993='0' where zc9993='1' and "+@condition
	exec(@strsql)
	set @strsql="update aa58 set zc9993='1' where zc9993='*' and "+@condition
	exec(@strsql)
end
if (@zc9995='1')
	begin
		update aa25 set aa2506='1'
		 where aa25.za0100+right('0000000000'+cast(aa25.aa25id as varchar(10)),10) in
		(select a1.za0100+right('0000000000'+cast(a1.aa25id as varchar(10)),10) from  
		(select za0100,aa25id from aa25) as a1 left join (select za0100,aa25id from aa25 where aa2501='2' and aa2504>='3' and aa2506<>'1') as a2
		 on a2.za0100=a1.za0100 where a1.aa25id<=a2.aa25id)
		set @strsql="update  aa25  set aa2506='1' where  "+@condition
	end
if (@zc9995='2')
	begin
		update aa25 set aa2507='1'
		 where aa25.za0100+right('0000000000'+cast(aa25.aa25id as varchar(10)),10) in
		(select a1.za0100+right('0000000000'+cast(a1.aa25id as varchar(10)),10) from  
		(select za0100,aa25id from aa25) as a1 left join (select za0100,aa25id from aa25 where aa2501='2' and aa2504>='3' and aa2507<>'1') as a2
		 on a2.za0100=a1.za0100 where a1.aa25id<=a2.aa25id)
		set @strsql="update  aa25  set aa2507='1' where  "+@condition
	end
exec(@strsql)




GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO






--处理SQL语句的常量、表达式、函数、组成SQL语句
CREATE                  PROCEDURE  flxp_salary_standcompute
@strMainObject varchar(4),
@standid integer,
@strCondition varchar(2000)
 
  AS

	SET QUOTED_IDENTIFIER OFF  
	declare @isusual  bit--简单还是复杂
	declare @strsql varchar(2000)--SQL 语句
	declare @rowTarget varchar(200)--行指标
        declare @colTarget varchar(200)--列指标
	declare @createSQl varchar(2000)--SQL语句
	declare @colvalue varchar(100)--列值
        declare @rowvalue varchar(100)--行值
	declare @resulttarget varchar(100)--结果字段
	declare @rowinfofield varchar(100)--控制对象的字段
	declare @colinfofield varchar(100)--控制对象的字段
	declare @updatevalue varchar(100)--待更新的值
	declare @infoid varchar(10)--控制对象名
	declare @strwhere varchar(2000)--构造更新条件
	declare @rowcount int--行：记录的个数
	declare @colcount int--列：记录的个数
	declare @strcondition1 varchar(2000)--范围过滤
	declare @strcondition2 varchar(2000)--更新过滤
	declare @strFirstcol varchar(2000)--第一列条件
	declare @strsecondcol varchar(2000)--第二列条件
	declare @strFirstrow varchar(2000)--第一行条件
	declare @strsecondrow varchar(2000)--第二行条件
 	declare @j int --计数
	declare @i int --计数
	declare @m int
	declare @secondrowcount int
        declare @dispfield varchar(200)
	declare @jstable varchar(200)
        declare @standbyvarchar varchar(3000)
	set @jstable="[##"+convert(varchar(40),getdate(),21)+"]"
	SET QUOTED_IDENTIFIER OFF  
        --获得简单
        --获得简单

	select @isusual=isusual, @resulttarget =left(target,11), @infoid =infoid,@strwhere=isnull(setsql,''),@standbyvarchar=isnull(standbyvarchar,'') from gs_stand where standid=cast(@standid as varchar(10))
	if @standbyvarchar<>''
		begin
			set @strwhere=@standbyvarchar
		end
	if isnull(@strCondition,'')=''
	   begin
		set  @strCondition1=@strMainObject+".zc9993='1'"
		set  @strCondition2="1=1"
		if @strwhere<>''
			begin
				set @strCondition1=@strMainObject+".za0100 in ("+@strwhere+")"
				set @strCondition2=left(@resulttarget,4)+".za0100 in ("+@strwhere+")"
			end
           end

	ELSE
	   begin
		set @strCondition1=@strMainObject+".za0100 in ("+@strCondition+")"
		set @strCondition2=left(@resulttarget,4)+".za0100 in ("+@strCondition+")"
		if @strwhere<>''
			begin
				set @strCondition1= @strCondition1+" and "+@strMainObject+".za0100 in ("+@strwhere+")"
				set @strCondition2=@strCondition2+" and "+left(@resulttarget,4)+".za0100 in ("+@strwhere+")"
			end

	   end
	set @strwhere=''

--single stand table

	if @isusual=1 
	  begin
	    select @coltarget=infoid+'.'+infofield from gs_standitem where standid=cast(@standid as varchar(10)) and type=0--列
	    select @rowtarget=infoid+'.'+infofield from gs_standitem where standid=cast(@standid as varchar(10)) and type=1--行

            set @strwhere ="select "+@strMainObject+".za0100  from "+@strMainObject 

	    if upper(@coltarget)<>upper(@rowtarget) and not isnull(@coltarget,'')='' and not isnull(@rowtarget,'')=''
	      begin
	        set @createsql="select "+@strMainObject+".za0100,"+@coltarget+","+@rowtarget+" into "+@jstable+" from "+@strMainObject 
		set @dispfield=right(@coltarget,6)+","+right(@rowtarget,6)
              end
	    else
	      if isnull(@rowtarget,'')='' 
		begin
	        set @createsql="select "+@strMainObject+".za0100,"+@coltarget+" into "+@jstable+" from "+@strMainObject 
		set @dispfield=right(@coltarget,6)

		end
	      else
		begin
	        set @createsql="select "+@strMainObject+".za0100,"+@rowtarget+" into "+@jstable+" from "+@strMainObject 
		set @dispfield=right(@rowtarget,6)
		end

	    if left(upper(@rowtarget),4)=upper(@strMainObject)
		begin
		    if left(upper(@coltarget),4)<>upper(@strMainObject)
			begin
			set @createsql=@createsql+" left join "+left(upper(@coltarget),4)+" on "+@strMainObject +".za0100="+left(upper(@coltarget),4)+".za0100 and "+left(upper(@coltarget),4)+".zc9993='1'"
			set @strwhere=@strwhere+" left join "+left(upper(@coltarget),4)+" on "+@strMainObject +".za0100="+left(upper(@coltarget),4)+".za0100 and "+left(upper(@coltarget),4)+".zc9993='1'"

			end
		end
	    else
		BEGIN
			if not isnull(@rowtarget,'')='' 
			begin
				set @createsql=@createsql+" left join "+left(upper(@rowtarget),4)+" on "+@strMainObject +".za0100="+left(upper(@rowtarget),4)+".za0100 and "+left(upper(@rowtarget),4)+".zc9993='1'"
				set @strwhere= @strwhere+ " left join "+left(upper(@rowtarget),4)+" on "+@strMainObject +".za0100="+left(upper(@rowtarget),4)+".za0100 and "+left(upper(@rowtarget),4)+".zc9993='1'"
			end
			if left(upper(@coltarget),4)<>upper(@strMainObject) and not isnull(@coltarget,'')=''
			    begin
				set @createsql=@createsql+" left join "+left(upper(@coltarget),4)+" on "+@strMainObject +".za0100="+left(upper(@coltarget),4)+".za0100 and "+left(upper(@coltarget),4)+".zc9993='1'"
				set @strwhere=@strwhere+" left join "+left(upper(@coltarget),4)+" on "+@strMainObject +".za0100="+left(upper(@coltarget),4)+".za0100 and "+left(upper(@coltarget),4)+".zc9993='1'"
			    end
		end
	    --行列指标不等且不为空
--if(charindex(@createsql,'left join')<=0)
	exec(@createsql+" where "+@strCondition1)
--else
--	exec(@createsql+" and  "+@strCondition1)
--print @strwhere

	    if upper(@coltarget)<>upper(@rowtarget) and not isnull(@coltarget,'')='' and not isnull(@rowtarget,'')=''
		begin
	         -- set @createsql="declare curs_gwmc cursor for "+ @createsql+" where "+@strCondition1+"  group by "+@coltarget+","+@rowtarget+" order by "+@rowtarget+" desc open curs_gwmc "
 		set @createsql="declare curs_gwmc cursor for select "+@dispfield+" from "+@jstable+" group by " +@dispfield+" open curs_gwmc "
                  exec(@createsql)
	          fetch next from  curs_gwmc into @colvalue,@rowvalue
		  while(@@fetch_status=0)
			begin
				set @colinfofield=''
				set @rowinfofield=''
				select top 1 @colinfofield=left(infofields,6) from gs_standitem where standid=cast(@standid as varchar(10)) and type=0 and dictvalue=@colvalue
				select top 1 @rowinfofield=left(infofields,6) from gs_standitem where standid=cast(@standid as varchar(10)) and type=1 and dictvalue=@rowvalue
				if(isnull(@colinfofield,'')<>'' and isnull(@rowvalue,'')<>'' and isnull(@rowinfofield,'')<>'')
				begin
					set @updatevalue=''
					set @createsql="declare curs_g cursor for select "+@colinfofield+" from "+@infoid+" where za0100='"+isnull(@rowvalue,'')+"' open curs_g"
 		        	          exec(@createsql)
	     				  fetch next from  curs_g into @updatevalue
		 			  close Curs_g
					  deallocate Curs_g

					if isnull(@updatevalue,'')>""
					begin
						set @createsql=""
						set @strwhere=@strwhere

						set @createsql="update "+left(@resulttarget,4)+" set "+right(@resulttarget,6)+"='"+@updatevalue+"' where zc9993='1' and za0100 in (select za0100 from "+@jstable+" where "+right(@coltarget,6)+"='"+@colvalue+"' and "+right(@rowtarget,6)+"='"+@rowvalue+"')"
						 exec(@createsql)
					end
				end
		        	fetch next from  curs_gwmc into @colvalue,@rowvalue
			end
		  close Curs_gwmc
		  deallocate Curs_gwmc

		end
	    else
	        if isnull(ltrim(@rowtarget),'')=''

		begin

	          --set @createsql="declare curs_gwmc cursor for "+ @createsql+" where "+@strCondition1+"  group by "+@coltarget+" open curs_gwmc "
 		set @createsql="declare curs_gwmc cursor for select "+@dispfield+" from "+@jstable+" group by " +@dispfield+" open curs_gwmc "

                  exec(@createsql)
	          fetch next from  curs_gwmc into @colvalue
		  while(@@fetch_status=0)
			begin
			   if(isnull(@colvalue,'')<>'')
				begin
		                set @colinfofield=''
			
				set @updatevalue=''
				select top 1 @colinfofield=left(infofields,6) from gs_standitem where standid=cast(@standid as varchar(10)) and dictvalue=@colvalue and  type=0
				if(isnull(@colinfofield,'')<>'')
					begin
					--select top 1 @rowinfofield=left(infofields,6) from gs_standitem where standid=@standid and type=1
					set @createsql="declare curs_g cursor for select "+@colinfofield+" from "+@infoid+"  open curs_g"
	 		                  exec(@createsql)
		     			  fetch next from  curs_g into @updatevalue
		 			  close Curs_g
					  deallocate Curs_g
					set @createsql=""
					if(isnull(@updatevalue,'')<>'' )
					begin
						set @createsql="update "+left(@resulttarget,4)+" set "+right(@resulttarget,6)+"='"+@updatevalue+"' where zc9993='1' and za0100 in (select za0100 from "+@jstable+" where "+right(@coltarget,6)+"='"+@colvalue+"')"

					 -- set @createsql="update "+left(@resulttarget,4)+" set "+right(@resulttarget,6)+"='"+@updatevalue+"' where zc9993='1' and za0100 in ("+@strwhere++" where "+@coltarget+"='"+@colvalue+"') and "+@strCondition2
					  exec(@createsql)
					end
				end
			end
	        	fetch next from  curs_gwmc into @colvalue
			end

		  close Curs_gwmc
		  deallocate Curs_gwmc
		end
		else
		begin

	          set @createsql="declare curs_gwmc cursor for "+ @createsql+" where "+@strCondition1+"  group by "+@rowtarget+" open curs_gwmc "

                  exec(@createsql)

	          fetch next from  curs_gwmc into @rowvalue
		 
  		  --select top 1 @colinfofield=left(infofields,6) from gs_standitem where standid=@standid  and dictvalue=@rowvalue and type=0

		  while(@@fetch_status=0)
			begin
				set @updatevalue=''
				set @rowinfofield=''
				select top 1 @rowinfofield=left(infofields,6) from gs_standitem where standid=cast(@standid as varchar(10)) and dictvalue=@rowvalue and type=1
				if(isnull(@rowvalue,'')<>'')
				begin
				set @createsql="declare curs_g cursor for select za01aa  from "+@infoid+" where za0100='"+@rowvalue+"' open curs_g"

 		                  exec(@createsql)
	     			  fetch next from  curs_g into @updatevalue
	 			  close Curs_g
				  deallocate Curs_g
				if(isnull(@updatevalue,'')<>'')
				  begin
				    set @createsql=""
				    set @createsql="update "+left(@resulttarget,4)+" set "+right(@resulttarget,6)+"='"+@updatevalue+"' where zc9993='1' and za0100 in ("+@strwhere++" where "+@rowtarget+"='"+@rowvalue+"') and "+@strCondition2

				    exec(@createsql)
				  end
				end
		        	fetch next from  curs_gwmc into @rowvalue
			end
		  close Curs_gwmc
		  deallocate Curs_gwmc

		end
		set @strsql="drop table "+ @jstable
		exec(@strsql)
          end
	else--复杂处理,只处理不超过两层的
	  begin
	    --select distinct layer,infoif from gs_standitem where standid=125 and type=1 
		--1、先生成行条件，判断是否为空，如果为空则一进行处理下一行
		--2、找出第一个单元格的值，如果为null，或字符型为空格，或数值型为0，不计算。
		--3、找出列条件与行条件共同构造条件
		--4、根据条件进行赋值
	      select @rowcount=count(distinct layer) from gs_standitem where standid=cast(@standid as varchar(10)) and type=1

	      if isnull(@rowcount,0)=0--没行
		begin
		  select @colcount=count(distinct layer) from gs_standitem where standid=cast(@standid as varchar(10)) and type=0  
		      if @colcount=1--一列
			begin

				  set @createsql="declare curs_g cursor for select left(infofields,6),setsql from gs_standitem where standid='"+cast(@standid as varchar(10))+"' and type='0' order by itemid open curs_g"
 		                  exec(@createsql)
	     			  fetch next from  curs_g into @colinfofield,@strsql
				  while(@@fetch_status=0)
					begin

						EXECUTE flxp_create_condition @strMainObject,@strsql,@strwhere output
						  set @createsql="declare curs_gcol cursor for select "+@colinfofield+" from "+@infoid+"  open curs_gcol"
				        	          exec(@createsql)
			     			  fetch next from  curs_gcol into @updatevalue
 						  close Curs_gcol
						  deallocate Curs_gcol
						IF(isnull(@updatevalue,'')<>'')
						begin
							set @createsql=""
							set @createsql="update "+left(@resulttarget,4)+" set "+right(@resulttarget,6)+"='"+@updatevalue+"' where zc9993='1' and za0100 in ("+@strwhere+")   and "+@strCondition2
					 		exec(@createsql)
						end
						fetch next from  curs_g into @colinfofield,@strsql
					end

	 			  close Curs_g
				  deallocate Curs_g
			end
		      else--两列
			begin


				 set @i=0
				 set @strFirstcol=''
				  set @strsql="declare curs_firstCol cursor for select setsql from gs_standitem where layer=0 and type=0 AND standid='"+cast(@standid as varchar(10))+"' order by itemid open curs_firstcol"

				  exec(@strsql)
				  fetch next from  curs_firstCol into @strFirstcol
				  while(@@fetch_status=0)
				  begin
					  set @strsecondcol=''
					  set @colinfofield=''
					  set @createsql="declare curs_g cursor for select infofields,setsql from gs_standitem where standid='"+cast(@standid as varchar(10))+"' and type='0' and layer=1 order by itemid open curs_g"
	 		                  exec(@createsql)
		     			  fetch next from  curs_g into @colinfofield,@strsecondcol
					  while(@@fetch_status=0)
						begin
							if(isnull(@strFirstcol,'')='')
								set @strfirstcol='1=1'	
							if(isnull(@strsecondcol,'')='')
								set @strsecondcol='1=1'	
							set @strsql="("+@strfirstcol +") and ("+@strsecondcol+")"
							EXECUTE flxp_create_condition @strMainObject,@strsql,@strwhere output
							set @colinfofield=substring(@colinfofield,@i*7+1,6)
							set @createsql="declare curs_gcol cursor for select "+@colinfofield+" from "+@infoid+"  open curs_gcol"
 				        	        exec(@createsql)
				     			fetch next from  curs_gcol into @updatevalue
	 						close Curs_gcol
							deallocate Curs_gcol
							if isnull(@updatevalue,'')<>''
							begin
								set @createsql=""
								set @createsql="update "+left(@resulttarget,4)+" set "+right(@resulttarget,6)+"='"+@updatevalue+"' where zc9993='1' and za0100 in ("+@strwhere+")   and "+@strCondition2

						 		exec(@createsql)
							end
							fetch next from  curs_g into @colinfofield,@strsecondcol
						end
		 			  close Curs_g
					  deallocate Curs_g
					  set @i=@i+1
					  fetch next from  curs_firstCol into @strFirstcol
				  end
	 			  close curs_firstCol
				  deallocate curs_firstCol
			end
		end
	      else if @rowcount=1--一行
	-- declare @strFirstcol varchar(2000)--第一列条件
	-- declare @strsecondcol varchar(2000)--第二列条件
	-- declare @strFirstrow varchar(2000)--第一行条件
	-- declare @strsecondrow varchar(2000)--第二行条件
 	-- declare @j int --计数
	-- declare @i int --计数

		begin
---------------------------------------------------------------------------------
		  set @j=1
		  set @strFirstrow=''
		  set @strsql="declare curs_firstrow cursor for select setsql from gs_standitem where layer=0 and type=1 AND standid='"+cast(@standid as varchar(10))+"' order by itemid open curs_firstrow"
		  exec(@strsql)
		  fetch next from  curs_firstrow into @strFirstrow
		  while(@@fetch_status=0)
		  begin
			  set @rowcount=0

		          EXECUTE flxp_create_condition @strMainObject,@strFirstrow,@strwhere output

			  set @createsql="declare curs_grow cursor for select count(*) from "+@strMainObject+" where za0100 in ("+@strwhere+")  open curs_grow"
	        	  exec(@createsql)
     			  fetch next from  curs_grow into @rowcount
			  close Curs_grow
			  deallocate Curs_grow
			  if @rowcount>0
			  begin
				  select @colcount=count(distinct layer) from gs_standitem where standid=cast(@standid  as varchar(10)) and type=0
				  if @colcount=0 --只有一行没有列
				     begin
						set @createsql="declare curs_g cursor for select za01aa from "+@infoid+"  where "+@infoid+"id="+cast(@j*100 as varchar(100))+" open curs_g"
				        	exec(@createsql)
			     			fetch next from  curs_g into @updatevalue
 						close Curs_g
						deallocate Curs_g
						IF(isnull(@updatevalue,'')<>'')
						begin
							set @createsql=""
							set @createsql="update "+left(@resulttarget,4)+" set "+right(@resulttarget,6)+"='"+@updatevalue+"' where zc9993='1' and za0100 in ("+@strwhere+")   and "+@strCondition2
					 		exec(@createsql)
						end

				     end
				  else if @colcount=1--一行一列
				     begin
-------------------------------------------------------
					  set @createsql="declare curs_g cursor for select left(infofields,6),setsql from gs_standitem where standid='"+cast(@standid as varchar(10))+"' and type='0' order by itemid open curs_g"
	 		                  exec(@createsql)
		     			  fetch next from  curs_g into @colinfofield,@strfirstcol
					  while(@@fetch_status=0)
						begin
							if(isnull(@strFirstcol,'')='')
								set @strfirstcol='1=1'	
							if(isnull(@strFirstrow,'')='')
								set @strFirstrow='1=1'	
							set @strsql="("+@strfirstcol +") and ("+@strFirstrow+")"
							
							EXECUTE flxp_create_condition @strMainObject,@strsql,@strwhere output
							  set @createsql="declare curs_gcol cursor for select "+@colinfofield+" from "+@infoid+" where "+@infoid+"id="+cast(@j*100 as varchar(100))+" open curs_gcol"
					        	          exec(@createsql)
				     			  fetch next from  curs_gcol into @updatevalue
	 						  close Curs_gcol
							  deallocate Curs_gcol
							IF(isnull(@updatevalue,'')<>'')
							begin
								set @createsql=""
								set @createsql="update "+left(@resulttarget,4)+" set "+right(@resulttarget,6)+"='"+@updatevalue+"' where zc9993='1' and za0100 in ("+@strwhere+")   and "+@strCondition2
						 		exec(@createsql)
							end
							fetch next from  curs_g into @colinfofield,@strfirstcol
						end
	
		 			  close Curs_g
					  deallocate Curs_g
	

--------------------------------------------------------
				     end
		                  else--一行两列
				     begin
----------------------------------------------------------
					 set @i=0
					 set @strFirstcol=''
					  set @strsql="declare curs_firstCol cursor for select setsql from gs_standitem where layer=0 and type=0 AND standid='"+cast(@standid as varchar(10))+"' order by itemid open curs_firstcol"
					  exec(@strsql)
					  fetch next from  curs_firstCol into @strFirstcol
					  while(@@fetch_status=0)
					  begin
						  set @strsecondcol=''
						  set @colinfofield=''
						  set @createsql="declare curs_g cursor for select infofields,setsql from gs_standitem where standid='"+cast(@standid as varchar(10))+"' and type='0' and layer=1 order by itemid open curs_g"
		 		                  exec(@createsql)
			     			  fetch next from  curs_g into @colinfofield,@strsecondcol
						  while(@@fetch_status=0)
							begin
								if(isnull(@strFirstcol,'')='')
									set @strfirstcol='1=1'	
								if(isnull(@strsecondcol,'')='')
									set @strsecondcol='1=1'	
								if(isnull(@strFirstrow,'')='')
									set @strFirstrow='1=1'	
	
								set @strsql="("+@strfirstcol +") and ("+@strsecondcol+") and ("+@strFirstrow+")"
								EXECUTE flxp_create_condition @strMainObject,@strsql,@strwhere output
								set @colinfofield=substring(@colinfofield,@i*7+1,6)
								set @createsql="declare curs_gcol cursor for select "+@colinfofield+" from "+@infoid+" where "+@infoid+"id="+cast(@j*100 as varchar(100))+"  open curs_gcol"
	 				        	        exec(@createsql)
					     			fetch next from  curs_gcol into @updatevalue
		 						close Curs_gcol
								deallocate Curs_gcol
								if isnull(@updatevalue,'')<>''
								begin
									set @createsql=""
									set @createsql="update "+left(@resulttarget,4)+" set "+right(@resulttarget,6)+"='"+@updatevalue+"' where zc9993='1' and za0100 in ("+@strwhere+")   and "+@strCondition2
							 		exec(@createsql)
								end
								fetch next from  curs_g into @colinfofield,@strsecondcol
							end
			 			  close Curs_g
						  deallocate Curs_g
						  set @i=@i+1
						  fetch next from  curs_firstCol into @strFirstcol
					  end
		 			  close curs_firstCol
					  deallocate curs_firstCol
-----------------------------------------------------------
				     end
                          end
			set @j=@j+1
			fetch next from  curs_firstrow into @strFirstrow
		  end
 		  close curs_firstrow
		  deallocate curs_firstrow


---------------------------------------------------------------------------------
		end
	      else--两行
		begin
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

		  set @j=0
		  set @m=0
		  select @secondrowcount=count(*) from gs_standitem where standid=cast(@standid as varchar(10)) and layer=1 and type=1
		  set @strFirstrow=''
		  set @strsql="declare curs_firstrow cursor for select setsql from gs_standitem where layer=0 and type=1 AND standid='"+cast(@standid as varchar(10))+"' order by itemid open curs_firstrow"
		 exec(@strsql)
		  fetch next from  curs_firstrow into @strFirstrow
		  while(@@fetch_status=0)
		  begin
			  set @rowcount=0
			  set @m=1
		          EXECUTE flxp_create_condition @strMainObject,@strFirstrow,@strwhere output
			  set @createsql="declare curs_grow cursor for select count(*) from "+@strMainObject+" where za0100 in ("+@strwhere+")  open curs_grow"
	        	  exec(@createsql)
     			  fetch next from  curs_grow into @rowcount
			  close Curs_grow
			  deallocate Curs_grow

			  if @rowcount>0
			  begin
			  set @strsql="declare curs_secondrow cursor for select setsql from gs_standitem where layer=0 and type=1 AND standid='"+cast(@standid as varchar(10))+"' order by itemid open curs_secondrow"
			  exec(@strsql)
			  fetch next from  curs_secondrow into @strsecondrow
			  while(@@fetch_status=0)
			  begin
				  set @rowcount=0
				if(isnull(@strFirstrow,'')='')
					set @strfirstrow='1=1'	
				if(isnull(@strsecondrow,'')='')
					set @strsecondrow='1=1'	
				set @strsql="("+@strsecondrow +") and ("+@strFirstrow+")"

			          EXECUTE flxp_create_condition @strMainObject,@strFirstrow,@strwhere output
				  set @createsql="declare curs_grow1 cursor for select count(*) from "+@strMainObject+" where za0100 in ("+@strwhere+")  open curs_grow1"
		        	  exec(@createsql)
	     			  fetch next from  curs_grow1 into @rowcount
				  close Curs_grow1
				  deallocate Curs_grow1
				  if @rowcount>0
				  begin
						  select @colcount=count(distinct layer) from gs_standitem where standid=cast(@standid  as varchar(10)) and type=0
						  if @colcount=0 --只有行没有列
						     begin
								set @createsql="declare curs_g cursor for select za01aa from "+@infoid+"  where "+@infoid+"id="+cast((@j*@secondrowcount+@m)*100 as varchar(100))+" open curs_g"
						        	exec(@createsql)
					     			fetch next from  curs_g into @updatevalue
		 						close Curs_g
								deallocate Curs_g
								IF(isnull(@updatevalue,'')<>'')
								begin
									set @createsql=""
									set @createsql="update "+left(@resulttarget,4)+" set "+right(@resulttarget,6)+"='"+@updatevalue+"' where zc9993='1' and za0100 in ("+@strwhere+")   and "+@strCondition2
							 		exec(@createsql)
								end
		
						     end
						  else if @colcount=1--一行一列
						     begin
		-------------------------------------------------------
							  set @createsql="declare curs_g cursor for select left(infofields,6),setsql from gs_standitem where standid='"+cast(@standid as varchar(10))+"' and type='0' order by itemid open curs_g"

			 		                  exec(@createsql)
				     			  fetch next from  curs_g into @colinfofield,@strfirstcol
							  while(@@fetch_status=0)
								begin
									if(isnull(@strFirstcol,'')='')
										set @strfirstcol='1=1'	
									if(isnull(@strFirstrow,'')='')
										set @strFirstrow='1=1'	
									set @strsql="("+@strfirstcol +")  and "+@strsql
									
									EXECUTE flxp_create_condition @strMainObject,@strsql,@strwhere output
									  set @createsql="declare curs_gcol cursor for select "+@colinfofield+" from "+@infoid+" where "+@infoid+"id="+cast((@j*@secondrowcount+@m)*100 as varchar(100))+" open curs_gcol"
							        	          exec(@createsql)
						     			  fetch next from  curs_gcol into @updatevalue
			 						  close Curs_gcol
									  deallocate Curs_gcol
									IF(isnull(@updatevalue,'')<>'')
									begin
										set @createsql=""
										set @createsql="update "+left(@resulttarget,4)+" set "+right(@resulttarget,6)+"='"+@updatevalue+"' where zc9993='1' and za0100 in ("+@strwhere+")   and "+@strCondition2
								 		exec(@createsql)
									end
									fetch next from  curs_g into @colinfofield,@strfirstcol
								end
			
				 			  close Curs_g
							  deallocate Curs_g
			
		
		--------------------------------------------------------
						     end
				                  else--一行两列
						     begin
		----------------------------------------------------------
							 set @i=0
							 set @strFirstcol=''
							  set @strsql="declare curs_firstCol cursor for select setsql from gs_standitem where layer=0 and type=0 AND standid='"+cast(@standid as varchar(10))+"' order by itemid open curs_firstcol"
							  exec(@strsql)
							  fetch next from  curs_firstCol into @strFirstcol
							  while(@@fetch_status=0)
							  begin
								  set @strsecondcol=''
								  set @colinfofield=''
								  set @createsql="declare curs_g cursor for select infofields,setsql from gs_standitem where standid='"+cast(@standid as varchar(10))+"' and type='0' and layer=1 order by itemid open curs_g"
				 		                  exec(@createsql)
					     			  fetch next from  curs_g into @colinfofield,@strsecondcol
								  while(@@fetch_status=0)
									begin
										if(isnull(@strFirstcol,'')='')
											set @strfirstcol='1=1'	
										if(isnull(@strsecondcol,'')='')
											set @strsecondcol='1=1'	
										if(isnull(@strFirstrow,'')='')
											set @strFirstrow='1=1'	
			
										set @strsql="("+@strfirstcol +") and ("+@strsecondcol+") and "+@strsql
										EXECUTE flxp_create_condition @strMainObject,@strsql,@strwhere output
										set @colinfofield=substring(@colinfofield,@i*7+1,6)
										set @createsql="declare curs_gcol cursor for select "+@colinfofield+" from "+@infoid+" where "+@infoid+"id="+cast((@j*@secondrowcount+@m)*100 as varchar(100))+"  open curs_gcol"
			 				        	        exec(@createsql)
							     			fetch next from  curs_gcol into @updatevalue
				 						close Curs_gcol
										deallocate Curs_gcol
										if isnull(@updatevalue,'')<>''
										begin
											set @createsql=""
											set @createsql="update "+left(@resulttarget,4)+" set "+right(@resulttarget,6)+"='"+@updatevalue+"' where zc9993='1' and za0100 in ("+@strwhere+")   and "+@strCondition2
									 		exec(@createsql)
										end
										fetch next from  curs_g into @colinfofield,@strsecondcol
									end
					 			  close Curs_g
								  deallocate Curs_g
								  set @i=@i+1
								  fetch next from  curs_firstCol into @strFirstcol
							  end
				 			  close curs_firstCol
							  deallocate curs_firstCol
		-----------------------------------------------------------
						     end
						end
						set @m=@m+1
						fetch next from  curs_secondrow into @strsecondrow

		                          end
			 		  close curs_secondrow
					  deallocate curs_secondrow
					  end
					set @j=@j+1
					fetch next from  curs_firstrow into @strFirstrow
				  end
		 		  close curs_firstrow
				  deallocate curs_firstrow
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
		end    

	  end

abandon:

SET QUOTED_IDENTIFIER OFF 















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO





CREATE  PROCEDURE  flxp_stand_updateStructure--工资子集加记录
 @SourceTable varchar(100),
 @SourceFields varchar(2000),
 @sourceCode varchar(2000),
 @Standid varchar(200)
 
AS



SET QUOTED_IDENTIFIER OFF 

declare @strsql varchar(2000)
declare @infoid varchar(6)
declare @Code varchar(100)
declare @field varchar(100)
declare @value varchar(100)
declare @table varchar(100)
select @table=infoid from gs_stand where standid=@standid
set @strSQl=" declare curs_g cursor for select dictvalue from gs_standitem where standid='"+@Standid+"' and type=1 and charindex(dictvalue,"+@sourceCode+")>=1 open curs_g"
exec(@strsql)
fetch next from  curs_g into @Code
while(@@fetch_status=0)
	begin

		set @strSQl=" declare curs_field cursor for select left(infofields,6) from gs_standitem where standid='"+@Standid+"' and type=0 and charindex(left(infofields,6),"+@SourceFields+")>=1 open curs_field"
		exec(@strsql)
		fetch next from  curs_field into @field
		while(@@fetch_status=0)
			begin
				set @strSQl=" declare curs_1 cursor for select "+@field+" from "+@SourceTable +" where za0100='"+@code+"' open curs_1"
				exec(@strsql)
				fetch next from  curs_g into @value
				close curs_1
		                deallocate curs_1
				set @strSQl="update "+@table+" set "+@field+"='"+@value+"' where za0100='"+@code+"'"
				exec(@strsql)
				fetch next from  curs_field into @field
			end
		close curs_field
		deallocate curs_field
		fetch next from  curs_g into @Code
	end
close Curs_g
deallocate Curs_g




GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO




CREATE PROCEDURE   flxp_updateza9999  
	@objName varchar(4),
             @za9999A varchar(100)=null,
             @za0101A varchar(100)=null
 
 AS
--declare @objName varchar(4)
--declare @za9999A varchar(100)
--declare @za0101A varchar(100)
--set @objName='aa01' 
--set @za9999A='wl2'
--set @za0101A='za0101'
	SET QUOTED_IDENTIFIER OFF  
	--对象名称
	declare @za0100 varchar(50)
	--对象描述
	declare @za0101 varchar(50)
	--对象描述字符长度
	declare @CharLen int
	--临时变量
	declare @resultTempChar varchar(2000)
	--临时变量
	declare @pp varchar(10)
	--SQL语句
	declare @strsql varchar(1000)
	if(@za9999A=null)
		set @za9999A=' za9999'
	if(@za0101A=null)
		set @za0101A=' za0101'
	else
		set @za0101A=right(@za0101A,6)
	--游标
	set @strsql="declare Curs_gwmc cursor for 	select za0100,isnull("+@za0101A+",'')  from "+@objname+'  open curs_gwmc'
	exec(@strsql)
        	fetch next from  curs_gwmc into @za0100,@za0101
	while(@@fetch_status=0)
		begin
		--初始化临时变量
  		set @resultTempChar=''
		--获得描述长度
		 set @CharLen=len(@za0101)
		while(not @CharLen=0)
			begin
				if(@za0101='') goto abandon
				--按字符从表dp0102中取出
				set @pp=(select top 1 dp0102 from dp01 where za0101=substring(@za0101,len(@za0101)-@charlen+1,1))
				set @resulttempchar=@resulttempchar+isnull(@pp,'')
				set @CharLen=@CharLen-1
		  	end
		if @resulttempchar<>''
			begin
				set @strsql='update '+@objname+" set "+@za9999A+"=left('"+@resulttempchar+"',10) where za0100='"+@za0100+"'"
				exec(@strsql)
			end
abandon:
		 fetch next from  curs_gwmc into @za0100,@za0101
		end
	close Curs_gwmc
	deallocate Curs_gwmc
	SET QUOTED_IDENTIFIER on


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO




create procedure getFirstlevelObject 
 
as
declare @parentid varchar(100)
set @parentid='aa01'
aa:
declare SubObject_cursor  cursor for select infoid from gs_structure where parentid=@parentid
declare @ObjectName varchar(100)
open SubObject_cursor

fetch next from SubObject_cursor into @ObjectName

while @@fetch_status = 0
  begin
	print @ObjectName
	fetch next from SubObject_cursor into @ObjectName
  end

close SubObject_cursor
deallocate SubObject_cursor





GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO




-- 添加新用户
CREATE Procedure gsp_AddNewUser
 
/*Procedure_Name*/
 /*
 此功能只有（SYSADMIN）系统管理员才能使用
 */
 @UserName   varchar(20),   --添加的用户名称
 @UserPassWord  varchar(100)=NULL,  --用户的密码
 @DataBaseName  varchar(20) ,   --数据库名称
 @outputvalue  tinyint=0 output  --返回值=0成功=1增加用户失败=2 添加成功

       

As
declare @Return1 int 


select @Return1=0
select @outputvalue=0

begin tran

-- 增加登录用户
-- 存储过程sp_addlogin
if (len(Ltrim(rtrim(@UserPassWord)))=0)
 select @UserPassWord=NULL
select @UserName=ltrim(rtrim(@UserName))
--登录存在，先删除该用户
if exists(select * from master.dbo.syslogins where name = @UserName) 
   begin
      delete from master.syslogins where name=@UserName
   end

if exists(select * from sysusers where name=@UserName and issqlrole=1)
   begin
	select @outputvalue=10
	return(-1)
   end

--添加登录用户sp_addlogin
	execute @Return1=master.dbo.sp_addlogin @UserName,@UserPassWord,@DataBaseName,NULL,NULL,NULL
	if @Return1!=0 
	 begin
	  select @outputvalue=1
	  return(-1)
	 end

--增加数据库用户
-- 存储过程 sp_adduser
  execute @Return1=sp_adduser @UserName,@UserName,'public'
 --添加角色
  exec @Return1=sp_addrolemember 'db_owner',@UserName


 commit tran
return (0)




GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO




/****** Object:  Stored Procedure dbo.db_AddScheduleShrink    Script Date: 2003-1-22 10:29:42 ******/

/****** Object:  计划性优化 Stored Procedure dbo.db_AddScheduleShrink    Script Date: 2002-08-29 15:23:46 ******/
CREATE Procedure gsp_AddScheduleShrink
 @myjob_name               varchar(30),                 --工作名称
 @mydatabasename    varchar(20)              ,   --数据库名称
 @myfreq_type              INT              = 0,    --备份日期类型
 @myfreq_interval          INT              = 0,        --备份时间间隔
 @myfreq_subday_type       INT              = 0,        --备份子日期类型
 @myfreq_subday_interval   INT              = 0,    --备份子日期时间间隔
 @myfreq_relative_interval INT              = 0,    --备份相关时间间隔 
 @myfreq_recurrence_factor INT              = 0,        --
 @myactive_start_date      INT              = NULL,     -- 计划的开始日期
 @myactive_end_date        INT              = 99991231, -- 计划的结束日期，缺省日期是99991231
 @myactive_start_time      INT              = 000000,   -- 计划开始时间，缺省时间12:00:00 am
 @myactive_end_time        INT              = 235959,   -- 计划结束时间，缺省时间11:59:59 pm
 @outputvalue    tinyint    output     --返回值 =0表示成功=1表示不成功 
 
As
--注意：在设计工作步骤的时候，假如有两个或两个以上的工作步骤时，最后一个工作
--步骤的参数@on_success_action=1和 @on_fail_action=2, 非最后的工作步骤的这两
--个参数应为@on_success_action=3， @on_fail_action=3
--1：表示在成功时退出执行
--2：表示在失败时退出执行
--3：表示继续进行下一步
--4：对于@on_success_action表示在成功时执行由@on_success_step_id 指向的工作步骤号
--对于@on_fail_action表示在成功时执行由@on_fail_step_id 指向的工作步骤号
begin 
 declare @shrink_database varchar(100)
 declare @Return1   int
 declare @system_database varchar(110)
 declare @ms     varchar(50)
 select @outputvalue=0
 select @ms=convert(varchar(20),getdate(),100)+'的数据库优化'
 --检测这个工作名是否存在,若存在，则删除，再添加
 if EXISTS(SELECT *  FROM   msdb.dbo.sysjobs WHERE name = @myjob_name)
  begin
     delete from msdb.dbo.sysjobs where name=@myjob_name
     select @outputvalue=2
   
  end 
      
 begin tran
 execute @Return1=msdb.dbo.sp_add_job @job_name=@myjob_name,
           @enabled=1,@description=@ms
 if @Return1!=0
  begin
   rollback
   select @outputvalue=1
   return(-1)
  end
 -- 建立工作步骤
 select @shrink_database='DBCC SHRINKDATABASE  ( ' + @mydatabasename + ', NOTRUNCATE)'  
 
 execute @Return1=msdb.dbo.sp_add_jobstep @job_name=@myjob_name,
             @step_name='Step1',
            @subsystem='TSQL',
            @on_fail_action=2, 
            @on_success_action=1, 
            @command=@shrink_database
 if @Return1!=0
  begin
   rollback
   select @outputvalue=1
   return(-1)
  end
 --使工作可运行
 execute msdb.dbo.sp_add_jobserver @job_name=@myjob_name
 if @Return1!=0
  begin
   rollback
   select @outputvalue=1
   return(-1)
 end
 --建立工作计划
 EXEC @Return1=msdb.dbo.sp_add_jobschedule @job_name = @myjob_name, 
             @name = '第一调度',
              @enabled=1,       
             @freq_type=@myfreq_type,
             @freq_interval=@myfreq_interval,
             @freq_subday_type=@myfreq_subday_type,
             @freq_subday_interval=@myfreq_subday_interval,
             @freq_relative_interval=@myfreq_relative_interval,
             @freq_recurrence_factor=@myfreq_recurrence_factor,
             @active_start_date=@myactive_start_date,
             @active_end_date=@myactive_end_date,
             @active_start_time=@myactive_start_time,
             @active_end_time=@myactive_end_time
 if @Return1!=0
  begin
   rollback
   select @outputvalue=1
   return(-1)
  end
--任务提交
  COMMIT TRANSACTION 
  return (0)
end






GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO




--拷贝模块

create procedure  gsp_Copy_Module

  @sourceCode varchar(10),
  @DesCode varchar(10)

 
as

declare @subMaxCode varchar(10)
declare @curPreCode varchar(10)
declare @sql1 varchar(1000)
declare @sql varchar(1000)

 --declare  @sourceCode varchar(100)
 --declare  @DesCode varchar(100)
 --set @sourceCode='0110'
 --set @DesCode='10'

SET QUOTED_IDENTIFIER  OFF


--取目标模块下的子模块的最大编码
select @subMaxCode=isnull(right(max(za0100),len(max(za0100))-len(@DesCode)),'00') from ua01  where za9996=@DesCode

print 'subMaxCode='+@subMaxCode

--最大编码加1
set @subMaxCode=@subMaxCode+1

if(len(@subMaxCode)<=1) set @subMaxCode='0'+@subMaxCode

--修改源模块编码及其所有子模块的编码
 set @curPreCode=@DesCode + @subMaxCode
 print 'CurPreCode=' + @curPreCode

 --将源模块移动到目标模块
set @sql1="select za0100='" + @curPreCode + "' + right(za0100,len(za0100)-len('" + @SourceCode + "')),ua01id,za0101,zb0199,za9999,za9996,za9997,zc9995,ua0110,ua0111,ua0112,ua0113,ua0114,ua0115,ua0116,ua011a,ua011c,ua011d,ua011e,za9998 from ua01 where za0100 like '" +  @sourceCode + "%'"
print 'sql1=' + @sql1
exec(@sql1)

set @sql="insert ua01(za0100,ua01id,za0101,zb0199,za9999,za9996,za9997,zc9995,ua0110,ua0111,ua0112,ua0113,ua0114,ua0115,ua0116,ua011a,ua011c,ua011d,ua011e,za9998) " + @sql1
print 'sql=' + @sql
exec(@sql)

--修改父指针
set @sql="update ua01 set za9996=substring(za0100,1,len(za0100)-2) where za0100 like '" + @curPreCode + "%'"
print 'sql=' + @sql
exec(@sql)

--修改目标模块的子指针为1
set @sql="update ua01 set za9997='1' where za0100='" + @DesCode + "'"
print 'sql=' + @sql
exec(@sql)

select  @curPreCode


--测试
--exec gsp_copy_module '0110','13'

  




GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO



--拷贝工资类别

create procedure  gsp_Copy_SalaryType

  @SetNo varchar(10), --帐套号
  @TypeNo varchar(10), --类别号
  @NewDescription varchar(1000) --新类别描述
 

as

declare @subMaxCode varchar(10)
declare @sql1 varchar(1000)
declare @sql varchar(1000)
declare @RelateFields varchar(1000)
declare @OldFuncId varchar(100)
declare @NewFuncId varchar(100)

SET QUOTED_IDENTIFIER  OFF


--取当前工资类别的最大编码
select @subMaxCode=isnull(max(CAST(typeno as int)),0) + 1 from gs_salarytype  where SetNo=@SetNo 
print 'subMaxCode='+@subMaxCode

 --拷贝工资类别
set @RelateFields="baseexpr,baseitem,chineseitem,filter,delivertype"

set @sql1="select SetNO='" + @SetNO + "',TypeNo='" + @subMaxCode + "',TypeDescription='" + @NewDescription + "'," + @RelateFields + " from gs_salarytype where SetNO ='" + @SetNo + "' and TypeNo='" + @TypeNo + "'"
print 'sql1=' + @sql1
exec(@sql1)

set @sql="insert gs_salarytype(setno,typeno,TypeDescription," + @RelateFields + ")" + @sql1
print 'sql=' + @sql
exec(@sql)

--拷贝工资项目
set @RelateFields="InfoField,ItemDescription,Flag,OrderNo"

set @sql1="select SetNO='" + @SetNO + "',TypeNo='" + @subMaxCode + "'," + @RelateFields + " from gs_salaryItem where SetNO ='" + @SetNo + "' and TypeNo='" + @TypeNo + "'"
print 'sql1=' + @sql1
exec(@sql1)

set @sql="insert gs_salaryItem(setno,typeno," + @RelateFields + ")" + @sql1
print 'sql=' + @sql
exec(@sql)


--拷贝计算公式
set @OldFuncId="gzff_" + @SetNo + "_" + @TypeNo
set @NewFuncId="gzff_" + @SetNo + "_" + @subMaxCode

set @RelateFields="Description,MainObject,InfoId,InfoField,BaseExpr,BaseItem,FieldType,flag,relation,userid,condition,subcondition,formulaSql,formulaFieldName,FormulaFlag,IsHistory,XmlDocument,ErrorNum"

set @sql1="select funcId='" + @NewFuncId + "'," + @RelateFields + " from gs_formula where funcId ='" + @OldFuncId +  "'"
print 'sql1=' + @sql1
exec(@sql1)

set @sql="insert gs_formula(funcid," + @RelateFields + ")" + @sql1
print 'sql=' + @sql
exec(@sql)







--测试
-- exec gsp_Copy_SalaryType '1','4','test123'

  



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO




--拷贝Web模块

create procedure  gsp_Copy_WebModule

  @sourceCode varchar(10),
  @DesCode varchar(10)
 

as

declare @subMaxCode varchar(10)
declare @curPreCode varchar(10)
declare @sql1 varchar(1000)
declare @sql varchar(1000)
declare @RelateFields varchar(1000)

 --declare  @sourceCode varchar(100)
 --declare  @DesCode varchar(100)
 --set @sourceCode='0110'
 --set @DesCode='10'

SET QUOTED_IDENTIFIER  OFF


--取目标模块下的子模块的最大编码
select @subMaxCode=isnull(right(max(za0100),len(max(za0100))-len(@DesCode)),'00') from XD01  where za9996=@DesCode

print 'subMaxCode='+@subMaxCode

--最大编码加1
set @subMaxCode=@subMaxCode+1

if(len(@subMaxCode)<=1) set @subMaxCode='0'+@subMaxCode

--修改源模块编码及其所有子模块的编码
 set @curPreCode=@DesCode + @subMaxCode
 print 'CurPreCode=' + @curPreCode

 --将源模块移动到目标模块
set @RelateFields="xd01id,za0101,zb0199,za9999,za9996,za9997,zc9995,xd0110,xd0111,xd0112,xd0113,xD0114,xD0115,xD0116,xD011a,xD011c,xD011d,xD011e,xD011f,XD011G,XD011h,za9998"

set @sql1="select za0100='" + @curPreCode + "' + right(za0100,len(za0100)-len('" + @SourceCode + "'))," + @RelateFields + " from xD01 where za0100 like '" +  @sourceCode + "%'"
print 'sql1=' + @sql1
exec(@sql1)

set @sql="insert xD01(za0100," + @RelateFields + ")" + @sql1
print 'sql=' + @sql
exec(@sql)

--修改父指针
set @sql="update xD01 set za9996=substring(za0100,1,len(za0100)-2) where za0100 like '" + @curPreCode + "%'"
print 'sql=' + @sql
exec(@sql)

--修改目标模块的子指针为1
set @sql="update xD01 set za9997='1' where za0100='" + @DesCode + "'"
print 'sql=' + @sql
exec(@sql)

select  @curPreCode


--测试
--exec gsp_copy_webmodule '07','16'

  




GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



--删除所有的触发器
create procedure gsp_DeleteAllTrigger
    
  as

     declare @TriggerName varchar(1000) --触发器名称
     declare @str varchar(1000)
   
      declare myCursor  cursor for  select name from sysobjects  where xtype='tr' order by name

      OPEN myCursor

     fetch next from myCursor into @TriggerName

     while @@fetch_status = 0
         begin
            print @TriggerName
            select @str='drop trigger ' + @TriggerName
            exec(@str)
            fetch next from myCursor into @TriggerName
         end

        close myCursor
        deallocate mycursor




GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO





/****** Object:  删除计划性任务Stored Procedure dbo.db_DeleteSchedule    Script Date: 2002-08-29 15:23:46 ******/
Create Procedure gsp_DeleteSchedule
/*删除计划*/
 @job_name1          varchar(30),  --被删除的工作名称
 @outputvalue  tinyint  output  --返回值=0成功=1 失败

 
As
 declare @Return1 int 
 select @outputvalue=0
 begin
  begin tran
  --删除工作
  exec @Return1=msdb.dbo.sp_delete_job @job_name=@job_name1
  if @Return1!=0
   begin
    select @outputvalue=1
    rollback
    return(-1)
   end
  
  delete from SM_Job where Job_Name=@job_name1  
 
  --任务提交
  if @@TRANCOUNT >0
   commit tran
  
  return (0)
 end




GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO




CREATE PROCEDURE  gsp_GetBackupJobInfo
 @myJob_name varchar(30)
 
  AS

select msdb..sysjobs.name,msdb..sysjobschedules.name as JhName,msdb..sysjobsteps.command,msdb..sysjobschedules.freq_type,msdb..sysjobschedules.freq_interval,msdb..sysjobschedules.freq_subday_type,msdb..sysjobschedules.freq_subday_interval,msdb..sysjobschedules.freq_relative_interval,msdb..sysjobschedules.freq_recurrence_factor,msdb..sysjobschedules.active_start_date,msdb..sysjobschedules.active_end_date,msdb..sysjobschedules.active_start_time,msdb..sysjobschedules.active_end_time from msdb..sysjobs,msdb..sysjobschedules,msdb..sysjobsteps  where msdb..sysjobs.job_id=msdb..sysjobschedules.job_id  and msdb..sysjobs.job_id=msdb..sysjobsteps.job_id and step_id=2 and msdb..sysjobs.name=@myJob_name




GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



--获取可用的模块编码
create procedure  gsp_GetCurModuleCode

  @PPtr varchar(10)
 
as

declare @subMaxCode varchar(10)
declare @curPreCode varchar(10)
declare @sql varchar(1000)

--set @sourceCode='07'
--set @DesCode='08'

SET QUOTED_IDENTIFIER  OFF


--取目标模块下的子模块的最大编码
if (@PPtr ='')
 begin
   select @subMaxCode=isnull(max(za0100),'00') from ua01  where za9996 is null
 end
else
 begin
    select @subMaxCode=isnull(right(max(za0100),len(max(za0100))-len(@PPtr)),'00') from ua01  where za9996=@PPtr
 end

print 'subMaxCode='+@subMaxCode

--最大编码加1
set @subMaxCode=@subMaxCode+1

if(len(@subMaxCode)<=1) set @subMaxCode='0'+@subMaxCode

select  @subMaxCode


--测试
--  gsp_GetCurModuleCode ''






GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO




--获取某个对象的所有邮箱地址记录
Create  procedure gsp_GetEmailAddress
   @ObjectName varchar(10), --对象名称
   @EmailField varchar(300), --Email字段名
   @filter varchar(1000) --过滤条件
    
  as

      declare @ExeSql varchar(1000) --执行的SQl语句
      declare @EmailAddress varchar(100) --邮箱地址
      declare @EmailList varchar(3000) --邮箱地址列表，分号隔开



        --从变动表中取满足时间的记录(编码+关联字段）
        if(@filter='')
           begin
               set @exeSql='declare mycursor cursor for select ' + @EmailField + ' from  ' + @ObjectName  + ' where (' + @EmailField + " <>'' or " + @EmailField + " is not null)"
           end
        else
           begin
              set @exeSql='declare mycursor cursor for select ' + @EmailField + ' from  ' + @ObjectName  + ' where (' + @EmailField + " <>'' or " + @EmailField + " is not null)" + " and " + @filter

           end

        print @exeSql
        exec(@exeSql)
        open mycursor

         set @EmailList=''
     	  fetch next from mycursor into @EmailAddress

          while @@fetch_status =0
            begin
                if charindex('@',@EmailAddress,1)>1
                  begin
                      set @EmailList=@EmailList + @EmailAddress + ';'
                      print @EmailList
                  end
     	       fetch next from mycursor into @EmailAddress
            end  --while 更新完一个主表中的关联字段


            --关闭主表游标
            close mycursor
            deallocate mycursor

           print @EmailList
           set @EmailList=substring(rtrim(ltrim(@EmailList)),1,len(rtrim(ltrim(@EmailList)))-1)
           select @EmailList

     

--测试
--  gsp_GetEmailAddress 'aa01','aa1996',""
  



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO





CREATE PROCEDURE  gsp_GetShrinkJobInfo
 @myJob_name varchar(30)
 
  AS

select msdb..sysjobs.name,msdb..sysjobschedules.name as JhName,msdb..sysjobschedules.freq_type,msdb..sysjobschedules.freq_interval,msdb..sysjobschedules.freq_subday_type,msdb..sysjobschedules.freq_subday_interval,msdb..sysjobschedules.freq_relative_interval,msdb..sysjobschedules.freq_recurrence_factor,msdb..sysjobschedules.active_start_date,msdb..sysjobschedules.active_end_date,msdb..sysjobschedules.active_start_time,msdb..sysjobschedules.active_end_time from msdb..sysjobs,msdb..sysjobschedules,msdb..sysjobsteps  where msdb..sysjobs.job_id=msdb..sysjobschedules.job_id  and msdb..sysjobs.job_id=msdb..sysjobsteps.job_id  and msdb..sysjobs.name=@myJob_name




GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO





--获取WEb可用的模块编码
create procedure  gsp_GetWebCurModuleCode

  @PPtr varchar(10),
  @Flag varchar(1)  -- 0-cs模块   1-bs模块
 
as

declare @subMaxCode varchar(10)
declare @curPreCode varchar(10)
declare @sql varchar(1000)

--set @sourceCode='07'
--set @DesCode='08'

SET QUOTED_IDENTIFIER  OFF


--取目标模块下的子模块的最大编码
if (@PPtr ='')
 begin
    select @subMaxCode=isnull(max(za0100),'00') from  xD01   where za9996 is null and XD011H=@Flag
 end
else
 begin
   select @subMaxCode=isnull(right(max(za0100),len(max(za0100))-len(@PPtr)),'00') from xD01  where za9996=@PPtr  and XD011H=@Flag
 end

print 'subMaxCode='+@subMaxCode

--最大编码加1
set @subMaxCode=@subMaxCode+1

--不是偶数位
if(len(@subMaxCode) % 2 <>0) set @subMaxCode='0'+@subMaxCode


select  @subMaxCode


--测试
--  gsp_GetWebCurModuleCode '0201','0'

--print 4 % 2


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO



--历史点回滚：机构处理
create   procedure gsp_HisDealOrg
  @SetNumber varchar(10), --套数
   @HisDate varchar(10), --历史点，如：2002-12-10
   @MainObjectList varchar(300) --备份的主表,如：AA01,AC01
   
  as

      declare @tempMainObjectList varchar(300) --临时备份主表
      declare @MainObjectName varchar(10) --主表名称
      declare @ChangeObjectName varchar(10) --主表变动名称 
      declare @Length int  
      declare @PropertySet varchar(100) --关联字段 ab0110,ae0112
      declare @ZA0100 varchar(100) --编码
      declare @AB0110 varchar(100) --单位编码
      declare @AE0122 varchar(100) --一级部门编码
      declare @AE0123 varchar(100) --二级部门编码
      declare @AE0124 varchar(100) --班组编码
      declare @AC0125 varchar(100) --职位编码
      declare @ExeSql varchar(1000) --执行的SQl语句
      declare @SubObjectName varchar(100) --子表名称
      declare @BackupDataBaseName varchar(100) --历史点的数据库名称
      declare @InsertFields varchar(3000)  --插入的字段名串
      declare @OneField varchar(100)  --插入的一个字段名
      declare @UpdateFieldSql varchar(100) --更新的机构字段（单位/部门/分组)
      declare @tempPropertySet varchar(100)   
      declare @templength int
      declare @ChangeInfoSql varchar(1000)



   set @tempMainObjectList=@MainObjectList

  


  ------------------------------------------------------------------------------------
    --将ABXXS表中恢复点时间在变动时间范围内的记录插入ABXX表中

    --取AB01中非计算字段
   declare mycursor cursor for select a.name from syscolumns a,sysobjects b where a.id=b.id and b.name='ab01' and a.iscomputed <> 1
   open mycursor
   fetch next from mycursor into @OneField
   set @InsertFields=''
    while @@fetch_status =0
       begin
           set @InsertFields=@InsertFields + @OneField + ','
           fetch next from mycursor into @OneField
       end
     close mycursor
     deallocate mycursor

      Set @InsertFields=substring(@InsertFields,1,len(@InsertFields)-1)
      print @InsertFields

      
     --没有符合时间点的机构变动，取当前机构中的数据
     if(@SetNumber='-1')
      begin 
        print "Ab01表中的记录不动"
      end

    else
      begin

         --清空AB01表
	 delete from AB01
	 --将AB01S表中符合时间点的记录插入AB01中
	 set @ExeSql="insert ab01(" + @InsertFields + ") select " + @InsertFields + " from ab01s where  SetNumber=" + @SetNumber
	 print @ExeSql
	 Exec(@ExeSql)
        print "Ab01S表中的记录插入Ab01表成功"

     end
 



  --------------------------------------------------------------------------------
  --删除AA01S中的无关记录
      set @ExeSql="delete from ab01s where convert(varchar(10),ZD9991,120) >='"  + @HisDate + "'"
       print @ExeSql
       Exec(@ExeSql)

 ------------------ 开始处理人员的类别-----------------------------------

          print "开始还原人员类别"

      --从类别变动表中取满足时间的记录(编码+关联字段）,每个编码取最后变动的记录，恢复点的时间在开始时间和结束时间范围内
       -- select * from aaoo where za0100+ cast(aaooid as varchar(50)) in(select za0100+ cast(max(aaooid) as varchar(50)) from aaoo  where convert(varchar(10),ZC9000,120)<='2003-02-17' group by za0100)
        set  @MainObjectName='AA01'
        set @ChangeObjectName='AA99'  --类别变动表
        print "开始更新主表: " + @MainObjectName 
        print @ChangeObjectName

        set @ChangeInfoSql="select za0100,AA9903 from  " + @ChangeObjectName  + " where za0100+cast(" + @ChangeObjectName + "ID as varchar(50)) in(select za0100 + cast(max(" + @ChangeObjectName + "ID) as varchar(50)) from " + @ChangeObjectName + " where convert(varchar(10),AA9901,120)<='"+ @HisDate + "' group by za0100)"
        print @ChangeInfoSql
        set @ExeSql="update " + @MainObjectName + " set AA010D=b.AA9903 from " + @MainObjectName + " as a,(" + @ChangeInfoSql + ") as b where a.za0100=b.za0100"
        print "ExeSql=" + @ExeSql
        exec(@ExeSql)
        print "更新主表: " + @MainObjectName + "的人员类别成功"


        --对还原时间小于变动时间的人员，设置其人员类别为为时间最早的变动前类别
        print '更新历史点时间小于变动时间的记录'
       set @ChangeInfoSql="select za0100,AA9902 from  " + @ChangeObjectName  + " where za0100+cast(" + @ChangeObjectName + "ID as varchar(50)) in(select za0100 + cast(min(" + @ChangeObjectName + "ID) as varchar(50)) from " + @ChangeObjectName + " where convert(varchar(10),AA9901,120) >'"+ @HisDate + "' group by za0100)"
       set @ExeSql="update " + @MainObjectName + " set AA010D=b.AA9902 from " + @MainObjectName + " as a,(" + @ChangeInfoSql + ") as b where a.za0100=b.za0100"
        print "ExeSql=" + @ExeSql
       exec(@ExeSql)
     
     
   ------------------人员的类别处理完成--------------------------------

  

   -------------------------开始处理人员的机构 ---------------------------------------------------------------
   --根据指定的备份主表（人员ABOO或职位ACOO)从相应的机构变动表XXOO中取变动时间<=历史点时间的最后变动记录，来替换人员或职位中机构等的编码
    set @length=len(@tempMainObjectList)

    --逐个主表处理
    WHILE @Length > 0
       BEGIN
         --取一个主表的名称
        EXECUTE @Length = gsp_PopFirstWord @tempMainObjectList OUTPUT, @MainObjectName OUTPUT

        set @MainObjectName=ltrim(rtrim(@MainObjectName))
    
--wl     删除主表中不符合时间点的记录
             set  @exeSql="delete from "+@MainObjectName+" where convert(varchar(10),isnull(zb9991,getdate()),120)>'"+@HisDate+"'"
             print @exeSql
             exec(@exeSql)
--wl

        --取主表的关联字段
        declare mycursor cursor for select PropertySet from gs_objectassociate where infoidA=@MainObjectName and PATINDEX ('%ab0110%',propertyset)>0
        open mycursor
        fetch next from mycursor into @PropertySet
        close mycursor
        deallocate mycursor

        --根据关联字段设置机构的改变字段
         set @tempPropertySet=@PropertySet
         set @templength=len(@tempPropertySet)

        
         set @UpdateFieldSql=""

         while @tempLength>0
          begin
               --取一个变动字段
              EXECUTE @tempLength = gsp_PopFirstWord @tempPropertySet OUTPUT, @OneField OUTPUT
              set  @UpdateFieldSql=@UpdateFieldSql +  @OneField + "=b." + @OneField + "," 
          end

          Set @UpdateFieldSql=substring(@UpdateFieldSql,1,len(@UpdateFieldSql)-1)
          -- print @UpdateFieldSql


        --变动表的名称AAOO,ABOO
        set @ChangeObjectName=substring(@MainObjectName,1,2) + 'OO'

        --从变动表中取满足时间的记录(编码+关联字段）,每个编码取最后变动的记录，恢复点的时间在开始时间和结束时间范围内
       -- select * from aaoo where za0100+ cast(aaooid as varchar(50)) in(select za0100+ cast(max(aaooid) as varchar(50)) from aaoo  where convert(varchar(10),ZC9000,120)<='2003-02-17' group by za0100)
        print "开始更新主表: " + @MainObjectName 
        print @ChangeObjectName
        set @ChangeInfoSql="select za0100," + @PropertySet + " from  " + @ChangeObjectName  + " where za0100+cast(" + @ChangeObjectName + "ID as varchar(50)) in(select za0100 + cast(max(" + @ChangeObjectName + "ID) as varchar(50)) from " + @ChangeObjectName + " where convert(varchar(10),ZC9000,120)<='"+ @HisDate + "' group by za0100)"
        print @ChangeInfoSql
        set @ExeSql="update " + @MainObjectName + " set " + @UpdateFieldSql + " from " + @MainObjectName + " as a,(" + @ChangeInfoSql + ") as b where a.za0100=b.za0100"
        print "ExeSql=" + @ExeSql
        exec(@ExeSql)
        print "更新主表: " + @MainObjectName + " 成功"

    -----------------------------------------------------------
            --将主表中状态标志位ZC9993为0（已删除标志），且开始时间和结束时间在恢复点范围内的记录的标志位置为1
             print "开始重置主表中已删除记录的标志位: " + @MainObjectName 
             set @exeSql="update " + @MainObjectName + " set ZC9993='1'  where convert(varchar(10),Zb9991,120)<='"  + @HisDate + "' and  convert(varchar(10),Zb9992,120)>='" + @HisDate + "' and ZC9993='0'"
             print @exeSql
             exec(@exeSql)


  --------------------------------------------------------------------------  
     --删除AAOO中的无关记录
       set @ExeSql="delete from " + @ChangeObjectName + "  where convert(varchar(10),ZC9000,120) >'"  + @HisDate + "'"
       print @ExeSql
       Exec(@ExeSql)


  ----------------------------------------------
    --删除主表对应的子表中不符合时间范围的记录
           declare mySubObjectCursor cursor for select InfoId from gs_structure where left(infoid,2)=left(@MainObjectName,2) and right(infoId,2)>'01' and state='1' and type in('0','1')


           open mySubObjectCursor

           fetch next from mySubObjectCursor into @SubobjectName
           while @@fetch_status =0
             begin
                 print 'SubObjectName=' + @SubObjectName
                 if upper(@SubObjectName)<>'AA99'
                  begin
                    set @exeSql="delete from " +  @SubObjectName  + " where convert(varchar(10),isnull(zb9991,getdate()),120)>'" + @HisDate + "' "
                    exec(@exeSql)
                    print "删除子表: " + @SubObjectName + " 成功"
                  end
                 fetch next from mySubObjectCursor into @SubobjectName
             end

            --关闭子表游标
           close mySubObjectCursor
           deallocate mySubObjectCursor
         -----------------------------------------------------


       END  --处理完所有的主表

   --------------------人员的机构还原处理完成---------------------------

    
  

       print "操作完成"

--测试
 	
-- Exec gsp_HisDealOrg '1','1999-05-30','AA01'




GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



--添加登录信息，返回当前记录的ID

--添加用户登录日志，返回当前的ID
CREATE procedure gsp_InsertLoginLog

 @UserId varchar(30),  --用户编码
 @Module varchar(30), --模块编码
 @BeginTime varchar(30), --进入时间
 @HostName varchar(20) --主机名称
 
as

declare @CurId varchar(30) --当前记录的ID


--set @UserId='001'
--set @Module='0101'
--set @BeginTime='2002-10-01 10:20'
--set @HostName='xsm'


--获取当前的ID
set @CurId=(select isnull(max(uc05id)+100,100) from uc05 where za0100=@UserId)
--添加登录记录
insert uc05(za0100,uc0501,uc0502,zb9991,zb9992,uc0503,uc05id,zc9993,zc9995) values(@UserId,@UserId,@Module,@BeginTime,null,@HostName,@CurId,'1','')

--返回当前ID
select @CurId

--测试
-- gps_InsertLoginLog '005','0101','2002-10-01 10:30:20','xsm'





GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO



--接收数据
create procedure  gsp_NewReceiveData

   @ObjectName sysname,  --目标对象
   @PrimaryKey varchar(1000), --源对象主键,用逗号隔开
   @NewPrimaryKey varchar(1000), --目标对象主键,用逗号隔开
   @ReceiveCols varchar(8000), --源字段列,用逗号隔开,不能包含计算列
   @NewReceiveCols varchar(8000), --目标字段列,用逗号隔开,不能包含计算列
   @ReceiveType int,  --接收方式 1=更新方式 2=覆盖方式 =3追加不存在的记录,存在则不管
   @Filter varchar(8000), --过滤条件,
   @CoverKey varchar(8000) --覆盖接收时删除的定位键


as


  declare @str varchar(8000)
  declare @length int
  declare @Newlength int
  declare @LocateSql varchar(8000)
  declare @tempReceiveCols varchar(8000)
  declare @tempNewReceiveCols varchar(8000)
  declare @FieldName varchar(100)
  declare @NewFieldName varchar(100)
  declare @NotInSql varchar(8000)
  declare @IdentityOn varchar(8000)
  declare @IdentityOff varchar(8000)
  declare @CoverWhereSql varchar(8000)
  declare @CoverInSql varchar(8000)
  declare @CoverKeySql varchar(8000)
  declare @UpdateSql varchar(8000)
  declare @tempObjectName varchar(8000)


set @tempObjectName=@ObjectName

  --取主键中的每个字段，生成定位语句
 set @LocateSql=''
 set @NotInSql=''

  set @length=len(@primarykey)
  set @Newlength=len(@Newprimarykey)

 print 'ok'



  WHILE @Length > 0
    BEGIN

        --取源对象中的一列主键
        EXECUTE @Length = gsp_PopFirstWord @primarykey OUTPUT, @FieldName OUTPUT
        set @FieldName=ltrim(rtrim(@FieldName))
       -- print @FieldName
  
        --取目标对象中的一列主键
        EXECUTE @NewLength = gsp_PopFirstWord @Newprimarykey OUTPUT, @NewFieldName OUTPUT
        set @NewFieldName=ltrim(rtrim(@NewFieldName))
       -- print @NewFieldName



        set @LocateSql=@LocateSql +  'a.' + @NewFieldName + '= b.' +  @FieldName + ' and '
        set @NotInSql=@NotInSql + 'cast(a.' + @NewFieldName + ' as varchar(100))+'

       
   end
     
    set @LocateSql=left(@LocateSql,len(@LocateSql)-4)
    set @NotInSql=left(@NotInSql,len(@NotInSql)-1)

    print @LocateSql
    print @NotInSql


--取覆盖删除时的语句
 set @CoverWhereSql=''
 set @CoverInSql=''
 set @CoverKeySql=''

 if @CoverKey <> ''
   begin
		 set @length=len(@CoverKey)
		
		  WHILE @Length > 0
		    BEGIN
		
		        --取源对象中的一列主键
		        EXECUTE @Length = gsp_PopFirstWord @CoverKey OUTPUT, @FieldName OUTPUT
		        set @FieldName=ltrim(rtrim(@FieldName))
		       -- print @FieldName
		  
		
		        set @CoverWhereSql=@CoverWhereSql +  'a.' + @FieldName + '= b.' +  @FieldName + ' and '
		        set @CoverKeySql=@CoverKeySql + 'cast(a.' + @FieldName + ' as varchar(100))+'
		        set @CoverInSql=@CoverInSql + 'cast(' + @FieldName + ' as varchar(100))+'
		       
		   end
		     
		    set @CoverWhereSql=left(@CoverWhereSql,len(@CoverWhereSql)-4)
		    set @CoverInSql=left(@CoverInSql,len(@CoverInSql)-1)
		    set @CoverKeySql=left(@CoverKeySql,len(@CoverKeySql)-1)
     end
  

 set @tempReceiveCols=@ReceiveCols
 set @tempNewReceiveCols=@NewReceiveCols

print @tempReceiveCols
print @tempNewReceiveCols


--关闭所有标识
SET IDENTITY_INSERT gs_formula off
SET IDENTITY_INSERT gs_standitem off



  --有标识列，暂时打开
  set @IdentityOn=''
  set @IdentityOff=''
  if exists(select a.name,a.status from syscolumns a ,sysobjects b where a.id=b.id and b.name=@ObjectName and a.status=128)
   begin
     set @IdentityOn="SET IDENTITY_INSERT " + @ObjectName + " ON "
     set @IdentityOff="SET IDENTITY_INSERT " + @ObjectName + " OFF "
    end


--对人员，为保证接收时不在人员机构变动表中加记录，设置标志位
if upper(@tempObjectName)='AA01'
  begin
    update aaoo set zc9995=null
  end


--更新方式接收:目标数据库，有则更新，没有则追加
if @ReceiveType=1
  begin
	  --1.对于目标库中存在的记录，根据接收的列逐列更新
	  set @length=len(@tempReceiveCols)
	  set @Newlength=len(@tempNewReceiveCols)
          set @UpdateSql=''

	  WHILE @Length > 0
	    BEGIN

                --取源对象中的一列
	        EXECUTE @Length = gsp_PopFirstWord @tempReceiveCols OUTPUT, @FieldName OUTPUT
	        set @FieldName=ltrim(rtrim(@FieldName))
	        --print @FieldName


               --取目标对象中的一列
               EXECUTE @NewLength = gsp_PopFirstWord @tempNewReceiveCols OUTPUT, @NewFieldName OUTPUT
	        set @NewFieldName=ltrim(rtrim(@NewFieldName))
	        --print @NewFieldName

	       --更新一列的语句
	       set @UpdateSql = @UpdateSql + @NewFieldname + '=b.' + @FieldName + ","

	     end  --while

          --开始执行更新操作
          print 'get update ok'
          set @UpdateSql=left(@UpdateSql,len(@UpdateSql)-1)
          print  @UpdateSql
          print   @tempObjectName
       
          set @str='update ' + @tempObjectName + ' set ' + @UpdateSql + ' from ' + @tempObjectName + ' a,xsmtemp b where ' + @LocateSql
	  print @str
          exec(@str)
	   if @@ERROR <> 0 
	      begin 
	          print '更新列失败'
	          --exec(@IdentityOff)
		  select 0
	          return
	       end
	    else
	          print '更新列成功'
	
	      
	
	
	   --2.对于目标库中不存在的记录，进行追加
           print '开始追加不存在的记录'
           set @str="insert " + @tempObjectName + "(" + @NewReceiveCols  + ")  select " + @ReceiveCols + " from xsmtemp  a where "  + @NotInSql + " not in(select " + @NotInSql + " from xsmtemp a," + @tempObjectName + " b where " + @LocateSql + ")"
	   print @str
	   exec(@str)
           if @@ERROR <> 0 
               begin 
                  print '追加不存在的记录失败'
                  exec(@IdentityOff)
                  select 0
                  return
               end
            else
              print '追加不存在的记录成功'

     end

--覆盖方式接收：先删除目标数据库中相同的记录，在追加
else if @ReceiveType=2
   begin
          print 'covert'

	   --1.删除目标表中的记录
           if @CoverWhereSql=''
              set @str="delete from  " + @tempObjectName
           else
              set @str="delete from  " + @tempObjectName + " where "  + @CoverInSql + "  in (select " + @CoverKeySql + " from xsmtemp a," + @tempObjectName + " b where " + @CoverWhereSql + ")"
              

	   print @str
	   exec(@str)
           if @@ERROR <> 0 
             begin 
                     print '删除相同的记录失败'
                    -- exec(@IdentityOff)
                     select 0
                     return 
 
              end
            else
               print '删除相同的记录成功'
	   
          
	   --2.追加所有记录
             
             if @ObjectName = 'gs_StandItem'
              SET IDENTITY_INSERT gs_StandItem ON
             else if @ObjectName = 'gs_Formula'
              SET IDENTITY_INSERT gs_Formula ON

           set @str='insert ' + @tempObjectName + '(' + @NewReceiveCols + ')  select ' + @ReceiveCols + '  from xsmtemp'
	   print @str
	   exec(@str)
           if @@ERROR <> 0 
             begin 
 	        print '追加记录失败'
                 if @ObjectName = 'gs_StandItem'
                    SET IDENTITY_INSERT gs_StandItem OFF
                 else if @ObjectName = 'gs_Formula'
                    SET IDENTITY_INSERT gs_Formula OFF

                select 0
              end
            else
	   print '追加记录成功'


   end

--对不存在的记录进行追加，存在的记录不处理
else if @ReceiveType=3
   begin
	   --对于主键不存在的记录，进行追加
           set @str="insert " + @tempObjectName + "(" + @NewReceiveCols  + ")  select " + @ReceiveCols + " from xsmtemp  a where "  + @NotInSql + " not in(select " + @NotInSql + " from xsmtemp a," + @tempObjectName + " b where " + @LocateSql + ")"
	   print @str
	   exec(@str)
           if @@ERROR <> 0 
             begin 
 	        print '追加记录失败'
                select 0
                return
              end
           else
	      print '追加记录成功'

   end


  --重新打开种子列
  exec(@IdentityOff)

 --对子集，保证最大ID为当前记录
      if len(@ObjectName)=4 and  right(@ObjectName,2)<>'01' and CHARINDEX('ZC9993',@ReceiveCols)<>0 and CHARINDEX('ZA0100',@ReceiveCols)<>0 and CHARINDEX(@ObjectName + "id",@ReceiveCols)<>0
        begin
          print '更新子集的状态'
         set @str="update " + @ObjectName + " set ZC9993='0'"
         print @str
         exec(@str)
         set @str="update " + @ObjectName + " set ZC9993='1'" + " where za0100+cast(" + @ObjectName + "id as varchar) in(select za0100+cast(max(" + @ObjectName + "id) as varchar) from " + @ObjectName + " group by za0100)"
         print @str
         exec(@str)
       end


if upper(@tempObjectName)='AA01'
  begin
    delete from aaoo where  zc9995='A'
  end
   

  --操作成功
   select 1



--测试

/*
SET QUOTED_IDENTIFIER off 
SET ANSI_NULLS ON  
exec gsp_NewReceiveData "MA01" ,"ZA0100","ZA0100","MA0110,MA0111,MA0112,MA01ID,ZA0100,ZA0101,ZA9996,ZA9997,ZA9998,ZA9999,ZB9991,ZB9992,ZC9993","MA0110,MA0111,MA0112,MA01ID,ZA0100,ZA0101,ZA9996,ZA9997,ZA9998,ZA9999,ZB9991,ZB9992,ZC9993",1,"select ZA0100 from MA01 where za0100 in (select ZA0100 from MA01 where MA01.ZC9993='1') and  ZC9993='1' and  ZA0100 like '%'","ZA0100"
*/






GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO



------------------------------------------------
-- PopFirstWord
------------------------------------------------
create PROCEDURE gsp_PopFirstWord
    @SourceString   NVARCHAR(4000) = NULL OUTPUT,
    @FirstWord      NVARCHAR(4000) = NULL OUTPUT
 
AS
    SET NOCOUNT ON

    -- Procedure accepts a comma delimited string as the first parameter
    -- Procedure outputs the first word in the second parameter
    -- Procedure outputs the remainder of the delimeted string in the first parameter
    -- Procedure yields the length of the First Word as the return value

    DECLARE @Oldword        NVARCHAR(4000)
    DECLARE @Length         INT
    DECLARE @CommaLocation  INT

    SELECT @Oldword = @SourceString

    IF NOT @Oldword IS NULL
    BEGIN
        SELECT @CommaLocation = CHARINDEX(',',@Oldword)
        SELECT @Length = DATALENGTH(@Oldword)

        IF @CommaLocation = 0
        BEGIN
            SELECT @FirstWord = @Oldword
            SELECT @SourceString = NULL

            RETURN 0
        END

        SELECT @FirstWord = SUBSTRING(@Oldword, 1, @CommaLocation -1)
        SELECT @SourceString = SUBSTRING(@Oldword, @CommaLocation + 1, @Length - @CommaLocation)

        RETURN @Length - @CommaLocation
    END

    RETURN 0
------------------------------------------------




GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO




------------------------------------------------
-- PopFirstWord
------------------------------------------------
create  PROCEDURE gsp_PopFirstWordbyChar
    @SourceString   NVARCHAR(4000) = NULL OUTPUT,
    @FirstWord      NVARCHAR(4000) = NULL OUTPUT,
    @DeliverChar varchar(1)
 
AS
    SET NOCOUNT ON

    -- Procedure accepts a comma delimited string as the first parameter
    -- Procedure outputs the first word in the second parameter
    -- Procedure outputs the remainder of the delimeted string in the first parameter
    -- Procedure yields the length of the First Word as the return value

    DECLARE @Oldword        NVARCHAR(4000)
    DECLARE @Length         INT
    DECLARE @CommaLocation  INT

    SELECT @Oldword = @SourceString

    IF NOT @Oldword IS NULL
    BEGIN
        SELECT @CommaLocation = CHARINDEX(@DeliverChar,@Oldword)
        SELECT @Length = DATALENGTH(@Oldword)

        IF @CommaLocation = 0
        BEGIN
            SELECT @FirstWord = @Oldword
            SELECT @SourceString = NULL

            RETURN 0
        END

        SELECT @FirstWord = SUBSTRING(@Oldword, 1, @CommaLocation -1)
        SELECT @SourceString = SUBSTRING(@Oldword, @CommaLocation + 1, @Length - @CommaLocation)

        RETURN @Length - @CommaLocation
    END

    RETURN 0
------------------------------------------------





GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO




/****** Object:  Stored Procedure dbo.db_QuickBackUpDataBase    Script Date: 2002-08-29 15:23:46 ******/
create  Procedure gsp_QuickBackUpDataBase
 @BackupName varchar(100), --备份名称
 @DataBaseName   varchar(30)    , --被备份的数据库名
 @BackupFile    varchar(130)    --备份的文件
 
as
      begin
       --删除日志
       BACKUP LOG @DatabaseName WITH TRUNCATE_ONLY
       --备份数据库
       BACKUP DATABASE @DatabaseName
           TO DISK=@BackupFile with INIT , SKIP,Name=@BackupName
       if @@ERROR!=0
        begin
         return(-1)
        end
      end
 return (0)




GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO




/****** Object:  Stored Procedure dbo.db_QuickShrinkDatabase    Script Date: 2003-1-22 10:27:02 ******/

/****** Object:  Stored Procedure dbo.db_QuickShrinkDatabase    Script Date: 2002-08-29 15:23:46 ******/
--立即优化
CREATE Procedure gsp_QuickShrinkDatabase
 /*数据库优化*/
 @databasename   varchar(20)   --被优化的数据库
  

As

 DBCC SHRINKDATABASE  (@databasename , NOTRUNCATE)
 if @@ERROR!=0 
  begin
     return(-1)
  end
 return (0)




GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO



--接收数据
create procedure  gsp_ReceiveData

   @ObjectName sysname,  --更新的对象
   @PrimaryKey varchar(50), --对象的主键,用逗号隔开
   @ReceiveCols varchar(1000), --接收的列,用逗号隔开,不能包含计算列
   @ReceiveType int,  --接收方式 1=更新方式 2=覆盖方式 =3追加不存在的记录
   @Filter varchar(3000) --过滤条件
 

as


  declare @str varchar(2000)
  declare @length int
  declare @LocateSql varchar(1000)
  declare @tempReceiveCols varchar(1000)
  declare @FieldName varchar(20)
  declare @NotInSql varchar(1000)
  declare @CovertInSql varchar(1000)


/*
 declare @ObjectName varchar(100)
 declare @primarykey varchar(100)
 declare @receivecols varchar(1000)
 set @ObjectName='aa02'
 set @primarykey='za0100,aa02id'
 set @Receivecols='za0100,za0101'
*/


 

 set @LocateSql=''
 set @NotInSql=''
 set @CovertInSql=''
 set @tempReceiveCols=@ReceiveCols

  --取主键中的每个字段，生成定位语句
  set @length=len(@primarykey)
  WHILE @Length > 0
    BEGIN

        EXECUTE @Length = gsp_PopFirstWord @primarykey OUTPUT, @FieldName OUTPUT
        set @FieldName=ltrim(rtrim(@FieldName))
       -- print @FieldName
        set @LocateSql=@LocateSql +  'a.' + @FieldName + '= b.' +  @FieldName + ' and '
        set @NotInSql=@NotInSql + 'cast(a.' + @FieldName + ' as varchar(20))+'
        set @CovertInSql=@CovertInSql + 'cast(' + @FieldName + ' as varchar(20))+'
       
    end
     
     set @LocateSql=left(@LocateSql,len(@LocateSql)-4)
     set @NotInSql=left(@NotInSql,len(@NotInSql)-1)
     set @CovertInSql=left(@CovertInSql,len(@CovertInSql)-1)

    -- print @LocateSql
    -- print @NotInSql
     --print @CovertInSql


--更新方式接收:目标数据库，有则更新，没有则追加
if @ReceiveType=1
  begin
	  --1.对于目标库中存在的记录，根据接收的列逐列更新
	  set @length=len(@tempReceiveCols)
	  WHILE @Length > 0
	    BEGIN
	
	        EXECUTE @Length = gsp_PopFirstWord @tempReceiveCols OUTPUT, @FieldName OUTPUT
	        set @FieldName=ltrim(rtrim(@FieldName))
	        --print @FieldName
	       --更新一列
	       set @str='update ' + @ObjectName + ' set ' + @Fieldname + '=b.' + @FieldName + ' from ' + @ObjectName + ' a,xsmtemp b where ' + @LocateSql
	       print @str
	       exec(@str)

               if @@ERROR <> 0 
                 begin 
                     print '更新列 ' + @FieldName + ' 失败'
                      return 0
 
                end
               else
                     print '更新列 ' + @FieldName + ' 成功'

	  end  --while
	
	
	   --2.对于目标库中不存在的记录，进行追加
           print '开始追加不存在的记录'
           set @str="insert " + @ObjectName + "(" + @ReceiveCols  + ")  select " + @ReceiveCols + " from xsmtemp  a where "  + @NotInSql + " not in(select " + @NotInSql + " from xsmtemp a," + @ObjectName + " b where " + @LocateSql + ")"
	   print @str
	   exec(@str)
           if @@ERROR <> 0 
               begin 
                  print '追加不存在的记录失败'
                     return 0
 
                end
            else
              print '追加不存在的记录成功'

     end

--覆盖方式接收：先删除目标数据库中相同的记录，在追加
else if @ReceiveType=2
   begin
          print 'covert'

	   --1.删除目标表中的记录
           if @Filter=''
               set @str='delete from  ' + @ObjectName 
           else
              set @str='delete from  ' + @ObjectName  + ' where ZA0100 in(' + @Filter + ')' 
              

 
	   print @str
	   exec(@str)
           if @@ERROR <> 0 
             begin 
                     print '删除相同的记录失败'
                     return 0
 
                end
            else
               print '删除相同的记录成功'
	   
          
	   --2.追加所有记录
           set @str='insert ' + @ObjectName + '(' + @ReceiveCols + ')  select ' + @ReceiveCols + '  from xsmtemp'
	   print @str
	   exec(@str)
           if @@ERROR <> 0 
             begin 
 	   print '追加记录失败'
                     return 0
 
                end
            else
	   print '追加记录成功'


   end

--对不存在的记录进行追加，存在的记录不处理
else if @ReceiveType=3
   begin
	   --对于主键不存在的记录，进行追加
	   set @str='insert ' + @ObjectName + '(' + @ReceiveCols + ')  select ' + @ReceiveCols + '  from xsmtemp  a where ' + @NotInSql + ' not in(select ' + @NotInSql + ' from xsmtemp a,' + @ObjectName + ' b where ' + @LocateSql + ')'
	   print @str
	   exec(@str)
           if @@ERROR <> 0 
             begin 
 	   print '追加记录失败'
                     return 0
 
                end
            else
	   print '追加记录成功'


   end


  --操作成功
   return 1

--测试
-- exec gsp_ReceiveData "MA01" ,"ZA0100","ZA0100,MA01ID,ZA0101,ZA9996,ZA9997,ZA9998,ZA9999,ZB9991,ZB9992,MA0112,MA0110,MA0111",2,"select ZA0100 from MA01 where ZC9993='1' and ZA0100 like '11%'"





GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO




--数据库恢复
create  Procedure gsp_RestoreDatabase
    @DesDatabaseName       varchar(30)         ,   --目的数据库名
    @SourceFileName         varchar(130)        ,   --源文件名
    @SourceDataName            varchar(30)=NULL    ,   --源数据库数据名称
    @SourceLogName            varchar(30)=NULL    ,   --源数据库日志名称
    @DesDataFile               varchar(100)=NULL   ,   --目的数据库数据文件
    @DesLogFile               varchar(100)=NULL   ,   --目的数据库日志文件
    @outputvalue        tinyint  =0 output      --返回值0:成功1：失败
 
As
    select @outputvalue=0

    --set noexec off
    --set parseonly off 
    
    --覆盖恢复
         RESTORE DATABASE @DesDatabaseName
                    FROM DISK=@SourceFileName WITH FILE=1, NOUNLOAD,STATS=10,RECOVERY,REPLACE,Move @SourceDataName To @DesDataFile,Move @SourceLogName To @DesLogFile

                    if @@ERROR!=0
                        begin
                            select @outputvalue=1
                            return(-1)
                        End
       
    
    return (0)



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO




/****** Object:  计划性备份 Stored Procedure dbo.db_AddScheduleBackUp    Script Date: 2002-08-29 15:23:46 ******/
CREATE Procedure gsp_ScheduleBackUp
 @myjob_name               varchar(30),                 --1. 作业名称
 @mydatabasename    varchar(30)  ,   --2.要备份的数据库名称
 @mybackupfile     varchar(30)         ,   --3.备份到的文件,两边带单引号
 @myfreq_type              INT           = 0,   --4.-备份日期类型
 @myfreq_interval          INT              = 0,        --5.备份时间间隔
 @myfreq_subday_type       INT              = 0,       ---6.-备份子日期类型
 @myfreq_subday_interval   INT              = 0,    --7.备份子日期时间间隔
 @myfreq_relative_interval INT              = 0,    --8.备份相关时间间隔 
 @myfreq_recurrence_factor INT              = 0,  --9.作业已调度执行之间的周数或月数
 @myactive_start_date      INT              = NULL,    -- -10.- 计划的开始日期
 @myactive_end_date        INT              = 99991231, --11. 计划的结束日期，缺省日期是99991231
 @myactive_start_time      INT              = 000000,   --12. 计划开始时间，缺省时间12:00:00 am
 @myactive_end_time        INT              = 235959,   --13. 计划结束时间，缺省时间11:59:59 pm
 @outputvalue    int    out     --14.返回值=0表示成功=1表示不成功,=2表示已存在该作业
 
As
--注意：在设计工作步骤的时候，假如有两个或两个以上的工作步骤时，最后一个工作
--步骤的参数@on_success_action=1和 @on_fail_action=2, 非最后的工作步骤的这两
--个参数应为@on_success_action=3， @on_fail_action=3
--1：表示在成功时退出执行
--2：表示在失败时退出执行
--3：表示继续进行下一步
--4：对于@on_success_action表示在成功时执行由@on_success_step_id 指向的工作步骤号
--对于@on_fail_action表示在成功时执行由@on_fail_step_id 指向的工作步骤号
begin 
 declare @backup_database varchar(100)
 declare @Return1   int
 declare @ms     varchar(50)
 declare @log    varchar(100)

 select @outputvalue=0
 select @ms=convert(varchar(20),getdate(),100)+'的数据库备份'

--开始事务
 begin tran

 --检测这个作业是否存在, ,若存在，则删除现有的
 if EXISTS(SELECT *  FROM   msdb.dbo.sysjobs WHERE name = @myjob_name)
  begin
   select @outputvalue=2  
  delete  FROM   msdb.dbo.sysjobs WHERE name = @myjob_name
  end


--添加作业
 execute @Return1=msdb.dbo.sp_add_job @job_name=@myjob_name,
           @enabled=1,@description=@ms
 if @Return1!=0
  begin
   rollback
   select @outputvalue=1
   return(-1)
  end

 -- 建立作业步骤1

     --删除非活动的事物日志
     select @log='BACKUP LOG ' + @mydatabasename + ' WITH TRUNCATE_ONLY'
       execute @Return1=msdb.dbo.sp_add_jobstep @job_name=@myjob_name,
                 @step_name='Step1',
                @subsystem='TSQL',
                @on_fail_action=3, 
                @on_success_action=3, 
                @command=@log
     if @Return1!=0
      begin
       rollback
       select @outputvalue=1
       return(-1)
      end
  
 ---- 建立作业步骤2
     select @backup_database='BACKUP DATABASE ' + @mydatabasename +' TO DISK =N'+ @mybackupfile+' with INIT '
     execute @Return1=msdb.dbo.sp_add_jobstep @job_name=@myjob_name,
                 @step_name='Step2',
                @subsystem='TSQL',
                @on_fail_action=2, 
                @on_success_action=1, 
                @command=@backup_database
     if @Return1!=0
      begin
       rollback
       select @outputvalue=1
       return(-1)
      end


 --使工作可运行
 execute msdb.dbo.sp_add_jobserver @job_name=@myjob_name
 if @Return1!=0
  begin
   rollback
   select @outputvalue=1
   return(-1)
 end

 --建立作业计划
 EXEC @Return1=msdb.dbo.sp_add_jobschedule @job_name = @myjob_name, 
             @name ='第一调度',
              @enabled=1,       
             @freq_type=@myfreq_type,
             @freq_interval=@myfreq_interval,
             @freq_subday_type=@myfreq_subday_type,
             @freq_subday_interval=@myfreq_subday_interval,
             @freq_relative_interval=@myfreq_relative_interval,
             @freq_recurrence_factor=@myfreq_recurrence_factor,
             @active_start_date=@myactive_start_date,
             @active_end_date=@myactive_end_date,
             @active_start_time=@myactive_start_time,
             @active_end_time=@myactive_end_time
 if @Return1!=0
  begin
   rollback
   select @outputvalue=1
   return(-1)
  end
--任务提交
  COMMIT TRANSACTION 
  return (0)
end



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO




--设置用户组的流程权限gs_flowitem
Create  procedure gsp_SetFlowOperate

   @UserGroupCode varchar(10), --用户组编码
   @UserFlowItems varchar(1000) --流程编码，格式：业务编码1:流程1,流程2;业务编码2:流程1,流程2  如：1:11,12;3:31,32
   
  as

      declare @FlowId varchar(100) --业务号
      declare @FlowItems varchar(100) --流程号
      declare @Length int  
      declare @Length2 int  
      declare @tempUserFlowItems varchar(1000)
      declare @OneFlowItems varchar(1000)
      declare @ExeSql varchar(1000) --执行的SQl语句
      declare @Location2 int



    set @length=len(@UserFlowItems)
    set @tempUserFlowItems=@UserFlowItems

    --逐个业务处理
    WHILE @Length > 0

       BEGIN
         --取一个业务对应的流程编码项  1:11,12
        EXECUTE @Length = gsp_PopFirstWordbyChar @tempUserFlowItems OUTPUT, @OneFlowItems OUTPUT,';'
        
        print 'oneFlowItems=' + @OneFlowItems
        --取出业务编码和业务流程
       set @Length2=Datalength(@OneFlowItems)
       set @Location2=charindex(':', @OneFlowItems)
       set @FlowId=SUBSTRING(@OneFlowItems, 1, @Location2 -1)
       set @FlowItems=SUBSTRING(@OneFlowItems, @Location2 + 1, @Length2 - @Location2)
       print @FlowId
       print @FlowItems

       --保存该用户组对该业务处理的各个流程的权限
       set @ExeSql="update gs_flowItem set Operator=isnull(Operator,'') + ','+'" + @UserGroupCode + "' where FlowId='" + @FlowId + "' and ItemId in (" + @FlowItems + ") and charindex('" + @UserGroupCode + "',isnull(Operator,''))<=0"
       print @ExeSql

       --对没有设置权限的流程，将该用户组编码置空
       set @ExeSql="update gs_flowItem set Operator=REPLACE(isnull(Operator,'') + ',','" + @UserGroupCode + ",','')  where FlowId='" + @FlowId + "' and ItemId not in (" + @FlowItems + ")"
       print @ExeSql

       exec(@ExeSql)

        
        

       END  --处理完

       print "操作完成"

--测试
 	
--Exec gsp_SetFlowOperate '01','1:11,12;3:31,32'




GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO





--设置模块对象的子对象和相关对象为只读
create procedure gsp_SetModuleObjectReadOnly
    
  as

    --系统模块对象全为只读
    update XD01  set XD0111=XD0111 + ',' + XD0112 ,XD0112="" ,XD0113=XD0113 + ',' + XD0114,XD0114='' 
   --用户模块权限对象全为只读
    update XE02  set XE0211=XE0211 + ',' + XE0212 ,XE0212='' ,XE0213=XE0213 + ',' + XE0214,XE0214=''

--测试
-- gsp_SetModuleObjectReadOnly



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



--根据用户编码和ID修改该用户对应登录日志的退出时间

--添加用户登录日志，返回当前的ID
create procedure gsp_UpdateLoginLog

 @UserId varchar(30),  --用户编码
 @CurId varchar(30), --当前记录的ID
 @EndTime varchar(30) --退出时间
 
as


--获取当前的ID
update uc05 set ZB9992=@EndTime where ZA0100=@UserId and UC05Id=@CurId


--测试
-- gps_UpdateLoginLog '005',100,'2002-10-01 10:40:20'





GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO





/****** Object:  更新计划性任务 Stored Procedure dbo.db_UpdateSchedule    Script Date: 2002-08-29 15:23:46 ******/
Create Procedure  gsp_UpdateSchedule
 @job_name1               varchar(30),                 --工作名称
 @job_newname             varchar(30),      --新工作名称
 @schedule_name           varchar(30),                 --计划名称
 @enable                  tinyint =1,                  --计划使能
 @freq_type1              INT              = 0,    --备份日期类型
 @freq_interval1          INT              = 0,        --备份时间间隔
 @freq_subday_type1       INT              = 0,        --备份子日期类型
 @freq_subday_interval1   INT              = 0,    --备份子日期时间间隔
 @freq_relative_interval1 INT              = 0,    --备份相关时间间隔 
 @freq_recurrence_factor1 INT              = 0,        --
 @active_start_date1      INT              = NULL,     -- 计划的开始日期
 @active_end_date1        INT              = 99991231, -- 计划的结束日期，缺省日期是99991231
 @active_start_time1      INT              = 000000,   -- 计划开始时间，缺省时间12:00:00 am
 @active_end_time1        INT              = 235959,   -- 计划结束时间，缺省时间11:59:59 pm
 @outputvalue     tinyint    output    --返回值 @outputvalue为1时更新不成功
 
As
begin 
 declare @backup_database varchar(100)
 declare @Return1   int
 declare @ms     varchar(100) 
 
 select @outputvalue=0
 select @ms=convert(varchar(20),getdate(),100)+'的数据库备份'
 begin tran
 --更改工作
 execute @Return1=msdb.dbo.sp_update_job @job_name=@job_name1,
           @new_name=@job_newname,
           @enabled=@enable,@description=@ms
 if @Return1!=0
  begin
   rollback
   select @outputvalue=1
   return(-1)
  end
 --更改工作计划
 EXEC @Return1=msdb.dbo.sp_update_jobschedule @job_name = @job_newname, 
              @name = @schedule_name,
              @new_name=@job_newname,
               @enabled=@enable,       
              @freq_type=@freq_type1,
              @freq_interval=@freq_interval1,
              @freq_subday_type=@freq_subday_type1,
              @freq_subday_interval=@freq_subday_interval1,
              @freq_relative_interval=@freq_relative_interval1,
              @freq_recurrence_factor=@freq_recurrence_factor1,
              @active_start_date=@active_start_date1,
              @active_end_date=@active_end_date1,
              @active_start_time=@active_start_time1,
              @active_end_time=@active_end_time1
 if @Return1!=0
  begin
   rollback
   select @outputvalue=1
   return(-1)
  end
--任务提交
  COMMIT TRANSACTION 
  return (0)
end




GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO






--添加登录信息，返回当前记录的ID

--添加用户登录日志，返回当前的ID
create procedure gsp_WebInsertLoginLog

 @UserId varchar(30),  --用户编码
 @Module varchar(30), --模块编码
 @BeginTime varchar(20), --进入时间
 @HostName varchar(20) --主机名称
 
as

declare @CurId varchar(30) --当前记录的ID


--set @UserId='001'
--set @Module='0101'
--set @BeginTime='2002-10-01 10:20'
--set @HostName='xsm'


--获取当前的ID
set @CurId=(select isnull(max(XF02Id)+100,100) from XF02 where za0100=@UserId)
--添加登录记录
insert XF02(za0100,XF0201,XF0202,zb9991,zb9992,XF0203,XF02id,zc9993,zc9995) values(@UserId,@UserId,@Module,@BeginTime,null,@HostName,@CurId,'1','')

--返回当前ID
select @CurId

--测试
-- gps_InsertLoginLog '005','0101','2002-10-01 10:30:20','xsm'





GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO






--根据用户编码和ID修改该用户对应登录日志的退出时间
create procedure gsp_WebUpdateLoginLog

 @UserId varchar(30),  --用户编码
 @CurId varchar(30), --当前记录的ID
 @EndTime varchar(30) --退出时间
 
as


--获取当前的ID
update XF02 set ZB9992=@EndTime where ZA0100=@UserId and XF02Id=@CurId


--测试
-- gsp_WebUpdateLoginLog '005',100,'2002-10-01 10:40:20'





GO
SET QUOTED_IDENTIFIER OFF 
GOf
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE PROCEDURE gsp_associate
	@infoida varchar(4),
	@infoidb varchar(100),
	@associatetype varchar(1),
	@flag varchar(1),
	@propertyset varchar(2000)
 
AS
	declare @field varchar(1000)
	declare @flen int
	declare @infields varchar(2000)

	--如果是继承关系
	if @associatetype = '0'
	begin
		--在关系表中插入一条记录
		insert into gs_objectassociate(infoida,infoidb,associatetype,flag,propertyset)values(@infoida,@infoidb,@associatetype,@flag,@propertyset)
		set @infields = @propertyset
		
		while len(@infields) > 0
		begin
			set @flen = charindex(',',@infields,0)
			if @flen = 0
			begin
				set @field = @infields
				set @infields = ''
			end
			else
				set @field = left(@infields,@flen - 1)
			------------------------------------------------------------
			--print @field
			--如果该属性不存在则添加
			if not exists(select infofield from gs_property where infoid = @infoida and infofield = @field)
			begin
				insert into gs_property(infoid,infofield,description,datatype,length,decimal,defaultvalue,explain,restriction,restrictionexplain,dictid,condition,state,propertyset,orderno,singleness,secondname,seconddisplay,standbyint,standbyvarchar)
				select infoid = @infoida,infofield,description,datatype,length,decimal,defaultvalue,explain,restriction,restrictionexplain,dictid,condition,state = '0',propertyset = '2',orderno,singleness,secondname,seconddisplay,standbyint,standbyvarchar
				from gs_property where infoid = @infoidb and infofield = @field
				print @field
			end
			------------------------------------------------------------
			set @infields = substring(@infields,@flen + 1,len(@infields) - @flen)
		end
		--加入对象引用字段
		declare @zc9996desc varchar(1000)
		select @zc9996desc = shortdesc from gs_structure where infoid = @infoidb
		insert into gs_property(infoid,infofield,description,datatype,length,decimal,dictid,state,propertyset,orderno,secondname,seconddisplay)
		values(@infoida,'ZC9996',@zc9996desc,'12','100','0',@infoidb +'.ZA0101','0','0','100','C9996',@zc9996desc)
		--execute('alter table ' + @infoida + ' add ZC9996 varchar(100) null')
	end
	--如果是关联关系
	if @associatetype = '1'
	begin
		--如果是已建引用属性关联
		--@infoidb varchar(4) 则为 NULL
		--@propertyset varchar(2000) 则为本对象中要设为关联关系的属性
		if @infoidb is null
		begin
			select @infoidb = left(dictid, charindex('.',dictid) - 1)
				--,@propertyset = right(dictid, charindex('.',dictid) + 1) 
			from gs_property where(infoid = @infoida and infofield = @propertyset)
			insert into gs_objectassociate(infoida,infoidb,associatetype,flag,propertyset)values(@infoida,@infoidb,@associatetype,@flag,@propertyset)
		end
		--如果是常量关联
		--@infoidb varchar(4) 则为关联常量编号
		--@propertyset varchar(2000) 则为 NULL
		else
		begin

			--用来存放常量表中的字段描述
			declare @fieldsdesc varchar(1000)
			--从 @fieldsdesc 分离开的单个的字段描述	
			declare @fielddesc varchar(50)
			--从 @infields 分离开的单个的字段	
			declare @infoidc varchar(4)
			--字段描述的长度
			declare @fdlen int



			--从关联常量表中取值
			select @infields = EA0111,@fieldsdesc = ZA0101 from EA01 where ZA0100 = @infoidb
			set @infoidb = ''
			set @propertyset = ''
			--循环各个字段
			while len(@infields) > 0
			begin
				set @flen = charindex(',',@infields,0)
				if @flen = 0
				begin
					set @field = @infields
					set @infields = ''
				end
				else
					set @field = left(@infields,@flen - 1)

				set @fdlen = charindex('-',@fieldsdesc,0)
				if @fdlen = 0
				begin
					set @fielddesc = @fieldsdesc
					set @fieldsdesc = ''
				end
				else
					set @fielddesc = left(@fieldsdesc,@fdlen - 1)

				------------------------------------------------------------
				set @infoidc = left(@field, charindex('.',@field) - 1)
				set @field =  right(@field, charindex('.',@field) + 1) 

				set @propertyset = @propertyset + ',' + @field
				set @infoidb = @infoidb + ',' + @infoidc
			
				--如果该属性不存在则添加
				if not exists(select infofield from gs_property where infoid = @infoida and infofield = @field)
				begin
					--insert into gs_property(infoid,infofield,description,datatype,length,decimal,defaultvalue,explain,restriction,restrictionexplain,dictid,condition,state,propertyset,orderno,singleness,secondname,seconddisplay,standbyint,standbyvarchar)
					--select infoid = @infoida,infofield = @field,description = @fielddesc,datatype,length,decimal,defaultvalue,explain,restriction,restrictionexplain,dictid,condition,state = '0',propertyset,orderno,singleness,secondname,seconddisplay,standbyint,standbyvarchar
					--from gs_property where infoid = @infoidc and infofield = 'ZA0100'
					insert into gs_property(infoid,infofield,description,datatype,length,decimal,dictid,state,orderno,secondname,seconddisplay)
					select infoid = @infoida,infofield = @field,description = @fielddesc,datatype = '12',length = '100',decimal = 0,dictid = @infoidc + '.' + 'ZA0101',state = '0',orderno,secondname,seconddisplay
					from gs_property where infoid = @infoidc and infofield = 'ZA0100'
				end

				------------------------------------------------------------
				set @infields = right(@infields,len(@infields) - @flen)
				set @fieldsdesc = right(@fieldsdesc,len(@fieldsdesc) - @fdlen)
			end
			set @infoidb = right(@infoidb,len(@infoidb) - 1)
			set @propertyset = right(@propertyset,len(@propertyset) - 1)
			insert into gs_objectassociate(infoida,infoidb,associatetype,flag,propertyset)values(@infoida,@infoidb,@associatetype,@flag,@propertyset)
		end
	end


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO



CREATE PROCEDURE gsp_changed_trigger 
	@infoid sysname,
	@associateobj varchar(1000) = null
 
AS

declare @pername varchar(10)
set @pername = left(@infoid,2)

declare @associate varchar(1000)
set @associate = dbo.associate_propertyset(@infoid,@associateobj,1)

declare @sqlstring nvarchar(4000)

set @sqlstring =
	N'
	if exists (select name 
		   from   sysobjects 
		   where  name = N''CHANGED_' + @infoid + ''' 
		   and 	  type = ''TR'')
	    drop trigger CHANGED_' + @infoid + '
	'
execute sp_executesql @sqlstring

set @sqlstring =
	N'
	create trigger CHANGED_' + @infoid + '
	on ' + @infoid + '
	for insert, update 
	as 
	if ' + 'UPDATE(' + replace(@associate,',',') OR UPDATE(') + ')' + '
	begin
		declare @key varchar(100)
		select top 1 @key = ZA0100 from inserted
		declare @newid int
		select @newid = (count(*) + 1)*100 from ' + @pername + 'OO where ZA0100 = @key
		insert into ' + @pername + 'OO(ZA0100,' + @pername + 'OOID,ZC9000,' + @associate + ') select ZA0100,' + @pername + 'OOID = @newid,ZC9000 = getdate(),' + @associate + ' from inserted
	end
	'
execute sp_executesql @sqlstring
	


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO



CREATE PROCEDURE gsp_check_layer_parent
 
--
AS
	declare @sonobject sysname
	declare @parent_data sysname
	declare @layer int
	declare @keys varchar(2000)


	--历遍所有的对象
	declare subobject cursor forward_only for select infoid from gs_structure
	open subobject
	fetch next from subobject into @sonobject
	while 0 = 0
	begin 
		------------------------------------------------------------------------
		if (select type from gs_structure where infoid = @sonobject) = '2' --如果是分类对象
		begin
			set @layer = 0
			set @parent_data = null
			set @keys = null
		end
		else
		begin
	
			--确定数据关系上的父对象(相区别于层次结构上的)
			set @parent_data = @sonobject
			while 1 = 1
			begin
				set @parent_data = (select parentid from gs_structure where infoid = @parent_data)
				if(select type from gs_structure where infoid = @parent_data) != 2 break;
				if @parent_data is null break;
			end
			--数据关系上的层数 1 为主集对象,2 为子集对象,3 为孙集对象...以此类推
			set @keys = ''
			declare @parent_temp sysname
			set @parent_temp = @sonobject
			set @layer = 0
			while((@parent_temp is not null) and (@parent_temp != ''))
			begin
				if(select type from gs_structure where infoid = @parent_temp) != 2 
				begin
					set @keys =  ',' + @parent_temp + 'ID'+ @keys
					set @layer = @layer + 1
				end
				set @parent_temp = (select parentid from gs_structure where infoid = @parent_temp)
			end
			set @keys = 'ZA0100' + right(@keys,len(@keys) - 7)			
		end

		--更新该对象的数据
		update gs_structure set layer = @layer, parentid1 = @parent_data, pkey = @keys where infoid = @sonobject
		------------------------------------------------------------------------
		fetch next from subobject into @sonobject
		if @@fetch_status != 0 	break;
	end 
	close subobject 
	deallocate subobject 



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO



CREATE PROCEDURE gsp_check_object 
	@infoid sysname
 
AS
	declare @certified int
	set @certified = 0

	declare @type int
	declare @layer int
	declare @state int
	declare @condition varchar(1000)
	declare @pkey varchar(1000)
	declare @parent sysname
	declare @parent1 sysname
	--select * from gs_structure where infoid = 'ZP05'
	--检测中以表 gs_structure 的数据为准，假定其中的数据无误
	select @type = type,@layer = layer,@state = state,@pkey = pkey,@parent1 = parentid1,@parent = parentid from gs_structure where infoid = @infoid

	--检测名字前缀的一致性
	if left(@parent1,2) <> left(@infoid,2)
	begin
		set @certified = 1
		update gs_structure set standbyvarchar = '名字前缀与父对象不一致。' where infoid = @infoid
		goto THEEND
	end
	--检测主对象的名字没有以“01”结尾。
	if @layer = 1 and right(@infoid,2) <> '01'
	begin
		set @certified = 1
		update gs_structure set standbyvarchar = '主对象的名字没有以“01”结尾。' where infoid = @infoid
		goto THEEND
	end
	--检测表的主键
	if @layer >= 1 and  @state = 1
	begin
		if not exists(select name from sysobjects where name = 'PK_' + @infoid)
		begin
			goto PKEYERROE		
		end	
		declare @key varchar(100)
		declare zmpkey cursor static for
	    	select pkey = c.name from sysindexes i, syscolumns c, sysobjects o
		where o.id = object_id(@infoid) and o.id = c.id and o.id = i.id and (i.status & 0x800) = 0x800
			and (c.name = index_col(@infoid, i.indid,1) or c.name = index_col(@infoid, i.indid,2) or
			     c.name = index_col(@infoid, i.indid,3) or c.name = index_col(@infoid, i.indid,4) or
			     c.name = index_col(@infoid, i.indid,5))
		open zmpkey
		if @@cursor_rows <> @layer
		begin
			goto PKEYERROE
		end
		fetch next from zmpkey into @key
		while @@fetch_status = 0
		begin
			if @pkey not like '%' + @key + '%'
			begin
PKEYERROE:
				set @certified = 1
				update gs_structure set standbyvarchar = '主键不一致。' where infoid = @infoid
				if(cursor_status('local','zmpkey') >= 0)
				begin
					close zmpkey
					deallocate zmpkey
				end
				goto THEEND
			end
			fetch next from zmpkey into @key
		end
		close zmpkey
		deallocate zmpkey
	end
	--检测表的外键
	if(@state = 1 and @layer > 1)
	begin
		if not exists(select name from sysobjects where name = 'FK_' + @infoid + '_' + @parent1)
		begin
			goto RKEYERROE		
		end
		declare @fkeyid int
		declare @rkeyid int
		declare zmfkey cursor static for
		select fkeyid,rkeyid from sysforeignkeys where constid = object_id('FK_' + @infoid + '_' + @parent1)
		open zmfkey
		if @@cursor_rows <> @layer - 1
		begin
			goto RKEYERROE
		end
		fetch next from zmfkey into @fkeyid,@rkeyid
		while @@fetch_status = 0
		begin
			if (@fkeyid <> object_id(@infoid)) or (@rkeyid <> object_id(@parent1))
			begin
RKEYERROE:
				set @certified = 1
				update gs_structure set standbyvarchar = '外键不一致。' where infoid = @infoid
				if(cursor_status('local','zmfkey') >= 0)
				begin
					close zmfkey
					deallocate zmfkey
				end
				goto THEEND
			end
			fetch next from zmfkey into @fkeyid,@rkeyid
		end
		close zmfkey
		deallocate zmfkey
	end
THEEND:
	select @certified


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO



--复制表结构
create procedure gsp_copy_TableSchema

   @Sourcetablename varchar(200),  --源数据表
   @Destablename varchar(200)  --目标数据表
 
as

declare @colname varchar(1000)  --字段名
declare @colType varchar(100)  --字段类型
declare @colLength int --字段长度
declare @colXprec int --字段精度
declare @colXScale int --字段小数位数
declare @str varchar(4000)


set @str='create table dbo.' + @Destablename + '('

print @str

declare mycursor cursor for select  a.name as colname ,c.name as coltype,a.length as collength ,a.xprec as colxprec,a.xscale as colscale from syscolumns a,sysobjects b,systypes c where a.id=b.id and a.xtype=c.xtype and b.name=@Sourcetablename
 print 'cursor ok'
open mycursor

 fetch next from mycursor into @colname,@colType,@colLength,@colXprec,@colXScale

print 'fetch ok'

  --循环处理
 while @@fetch_status=0
   begin
       print @colname
       if @coltype='int' or  @coltype='smallint' or  @coltype='bit' or @coltype='image' or @coltype='datetime' or @coltype='text'
         begin
          set  @str=@str + '[' +  @colname + '] [' + @colType + '],'
         end
       else if @coltype='numeric' 
         begin
            set  @str=@str +  '[' + @colname + '] [' + @colType + '] (' + cast(@colXprec as varchar(10))+ ',' + cast(@colXScale as varchar(10)) + '),'
         end
       else
         begin
          set  @str=@str + '[' +  @colname + '] [' + @colType + '] (' + cast(@collength as varchar(10))+ '),'
         end
         
       --找下一个 
    fetch next from mycursor into @colname,@colType,@colLength,@colXprec,@colXScale
    end 

  close mycursor
  deallocate mycursor
   
   set @str=left(@str,len(@str)-1)
    
   set @str=@str + ')'

   print @str

 --先删除目标表
  if exists(select * from sysobjects where name=@Destablename)
   begin
     exec('drop table ' +  @Destablename)
   end


 --重建目标表
  exec(@str)
   if @@error <>0
      select 0
   else
      select 1


print 'create ok'


--测试
-- gsp_copy_TableSchema 'aa04','xsmtemp'







GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO




CREATE PROCEDURE gsp_copy_field 
	@InfoId sysname, --被拷贝表
	@infofield sysname, --被拷贝字段
	@newInfoId sysname,  --拷贝对象表
	@newinfofield sysname = null--新的名称
 
AS
	if(@newinfofield is null)
	begin
		insert into gs_property(
			infoid,infofield,description,datatype,length,decimal,defaultvalue,explain,
			restriction,restrictionexplain,dictid,condition,state,propertyset,orderno,
			singleness,secondname,seconddisplay,standbyint,standbyvarchar)
		select infoid= @newInfoId,infofield,description,datatype,length,decimal,defaultvalue,
			explain,restriction,restrictionexplain,dictid,condition,state = 0,propertyset,
			orderno,singleness,secondname,seconddisplay,standbyint,standbyvarchar 
		from gs_property 
		where (infoid = @InfoId) and (infofield = @infofield)
		select * from gs_property where(infoid =@newinfoid and infofield = @infofield)
	end
	else
	begin
		insert into gs_property(
			infoid,infofield,description,datatype,length,decimal,defaultvalue,explain,
			restriction,restrictionexplain,dictid,condition,state,propertyset,orderno,
			singleness,secondname,seconddisplay,standbyint,standbyvarchar)
		select infoid= @newInfoId,infofield = @newinfofield,description,datatype,length,decimal,defaultvalue,
			explain,restriction,restrictionexplain,dictid,condition,state = 0,propertyset,
			orderno,singleness,secondname,seconddisplay,standbyint,standbyvarchar 
		from gs_property 
		where (infoid = @InfoId) and (infofield = @infofield)
		select * from gs_property where(infoid =@newinfoid and infofield = @newinfofield)
	end
	--返回复制后的属性




GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO



CREATE PROCEDURE gsp_create_field
	@infoid sysname,
	@infofield sysname
 
--
AS

	declare	@datatype varchar(10)
	declare	@length varchar(4)
	declare	@decimal varchar(2)
	declare	@defaultvalue varchar(20)
	declare	@singleness varchar(1)
	declare @Restriction int
	declare @RestExplain varchar(1000)
	--生成的字段的定义
	declare @fielddefinition varchar(100)
	--实际的字段的宽度
	--declare @realylength varchar(4)

	select  @datatype = datatype,
		@length = length, 
		@decimal = decimal,
		@defaultvalue = defaultvalue,
		@singleness = singleness,
		@Restriction = Restriction,
		@RestExplain = RestrictionExplain
	from gs_property where(infoid = @infoid and infofield = @infofield)

	--set @realylength = dbo.field_length(cast(@infoid as varchar(20)),cast(@infofield as varchar(20)))

	if not exists(select * from syscolumns where((id = object_id(@infoid)) and (name = @infofield)))
	begin --如果表中还没有该字段
		set @fielddefinition = dbo.field_definition(cast(@infoid as varchar(20)),cast(@infofield as varchar(20))) 
-------------------------------------------------------------------------------------------------------------------------
		--表中添加字段
		execute('alter table ' + @infoid + ' add ' + @infofield + @fielddefinition)
-------------------------------------------------------------------------------------------------------------------------
		if exists(select * from dbo.sysobjects where id = object_id(@infoid + '_B') and objectproperty(id, N'IsUserTable') = 1)
		begin
			if not exists(select * from syscolumns where((id = object_id(@infoid + '_B')) and (name = @infofield)))
			begin
				execute('alter table ' + @infoid + '_B add ' + @infofield + @fielddefinition)
			end
		end
-------------------------------------------------------------------------------------------------------------------------
		if exists(select * from dbo.sysobjects where id = object_id(@infoid + '_C') and objectproperty(id, N'IsUserTable') = 1)
		begin
			if not exists(select * from syscolumns where((id = object_id(@infoid + '_C')) and (name = @infofield)))
			begin
				execute('alter table ' + @infoid + '_C add ' + @infofield + @fielddefinition)
			end
		end

-------------------------------------------------------------------------------------------------------------------------
		if exists(select * from dbo.sysobjects where id = object_id(@infoid + 'S') and objectproperty(id, N'IsUserTable') = 1)
		begin
			if not exists(select * from syscolumns where((id = object_id(@infoid + 'S')) and (name = @infofield)))
			begin
				execute('alter table ' + @infoid + 'S add ' + @infofield + @fielddefinition)
			end
		end
-------------------------------------------------------------------------------------------------------------------------
		--该字段添加缺省约束,这一步将通过界面层实现
		/*
		if((@defaultvalue <> '') and (not(@defaultvalue is null))) --如果有缺省值
			print('alter table ' + @infoid + ' add constraint DF_' + @infoid + '_' + @infofield + ' default ' + @defaultvalue +  ' for ' + @infofield)
		*/
-------------------------------------------------------------------------------------------------------------------------
		--添加唯一性约束
		if @singleness = '1'
		begin
			execute('create unique index UQ_' + @infoid + '_' + @infofield + ' on ' + @infoid + '(' + @infofield + ')')
		end
-------------------------------------------------------------------------------------------------------------------------
		--更新属性表
		update gs_property set state = 1 where infoid = @infoid and infofield = @infofield
-------------------------------------------------------------------------------------------------------------------------
		--在引用对象中添加触发器
		if(@datatype = '12')
		begin
			declare @dictid varchar(1000)
			select  @dictid = dictid from gs_property where(infoid = @infoid and infofield = @infofield)
			if(not (isnull(@dictid,'') = ''))
			begin
				set @dictid = left(@dictid, charindex('.',@dictid) - 1)
				execute gsp_del_ref_trigger @dictid
			end
		end
	end
	else
	begin
		--更新属性表
		update gs_property set state = 1 where infoid = @infoid and infofield = @infofield
	end

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO



CREATE PROCEDURE gsp_create_ootable
	@infoid sysname,
	@associatefields varchar(1000) = null
 
AS
	declare @newname sysname
	declare @associate varchar(1000)
	declare @infofield sysname
	declare @state int
	declare @pkey sysname
	declare @pkeyfield varchar(1000)

	--确定关联变动对象的名称
	set @newname = substring(@infoid,1,2) + 'OO'
	--拷贝对象
	execute('gsp_plaster_object ' + @infoid +  ',' + @infoid + ',' + @newname + '')
	--删除非关联字段
	set @associate = dbo.associate_propertyset(@infoid,@associatefields,1)
	delete gs_property where infoid = @newname and not @associate like '%' + infofield + '%'
	--建立子对象表
	execute('gsp_create_table ' + @newname)
	--拷贝变动时间字段

	execute('gsp_copy_field ' + @newname + ',ZB9991,' + @newname + ',ZC9000')
	update gs_property set description = '变动时间' where infoid = @newname and infofield = 'ZC9000'
	--建立关联字段
	declare cursor_property cursor for 
		select infofield,state from gs_property where infoid = @newname order by orderno
		for read only
	open cursor_property
	fetch next from cursor_property into @infofield,@state
	while @@fetch_status = 0
	begin
		if @state = 0
		begin --建立关联字段
			execute('gsp_create_field ' + @newname + ',' + @infofield)
		end
/*
		else if @state = 1 and (not @associate like '%' + @infofield + '%') and @infofield <> 'ZA0100' and @infofield <> @newname + 'ID'
		begin --删除已经建立的且没有用的字段
			execute('alter table ' + @newname + ' drop column '+ @infofield +'')
			delete gs_property where infoid = @newname and infofield = @infofield
		end
*/
		fetch next from cursor_property into @infofield,@state
	end
	close cursor_property
	deallocate cursor_property
	--删除主键
	set @pkey = 'PK_' + @newname
	execute('alter table ' + @newname + ' drop constraint ' + @pkey)
	select @pkeyfield = pkey from gs_structure where infoid = @newname
	--添加主键
	execute('alter table ' + @newname + ' alter column ZC9000 datetime not null')
	execute('alter table ' + @newname + ' add constraint ' + @pkey + ' primary key clustered(' + @pkeyfield + ',ZC9000)')

	--删除附加的信息
	update gs_property set condition = null,dictid = null,restriction = 0,restrictionexplain = null where infoid  = @newname
	update gs_structure set description = '变动信息子集',shortdesc = '变动信息',type = 7 where infoid = @newname


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO



CREATE PROCEDURE gsp_create_stable 
	@infoid varchar(4)
 
AS
	--如果已经建立则删除
	if exists(select * from dbo.sysobjects where id = object_id(@infoid + 'S') and objectproperty(id, N'IsUserTable') = 1)
		execute('drop table ' + @infoid + 'S')
	execute('select * into dbo.' + @infoid + 'S from ' + @infoid + ' where 1=2')

/*
	if not exists(select * from syscolumns where id = object_id(@infoid + 'S') and name = 'ZC9992')
		execute('alter table ' + @infoid + 'S add ZC9992 datetime null')
	if not exists(select * from syscolumns where id = object_id(@infoid + 'S') and name = 'ZC9993')
		execute('alter table ' + @infoid + 'S add ZC9993 datetime null')
*/
	execute('alter table ' + @infoid + 'S add ZD9991 datetime null')
	execute('alter table ' + @infoid + 'S add ZD9992 datetime null')
	execute('alter table ' + @infoid + 'S add SetNumber int null')


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO





CREATE   PROCEDURE gsp_create_table
	@infoid sysname
 

AS

	--确定对象的性质
----------------------------------------------------------------------------------------------------------------
	declare @layer int --对象在对象库中的层数 1为主集，2为子集，3为子子集
	declare @objecttype varchar(2)	--对象的类型
	declare @desc varchar(1000) --	对象的描述
	declare @parentid sysname --数据上的父对象
	declare @keys varchar(1000) --对象的主键

	--取该对象的自己所包含的信息	
	select @layer = layer,@objecttype = type,@desc = shortdesc,@parentid = parentid1,@keys = pkey 	from gs_structure where infoid = @infoid
----------------------------------------------------------------------------------------------------------------

	--建立基本的表结构
	declare @fielddef varchar(2000)
	declare @keys_temp varchar(2000)
	declare @field_temp varchar(100)
	set @keys_temp = @keys + ','
	--生成主键字段的定义
	while @keys_temp <> ''
	begin
		set @field_temp = left(@keys_temp,charindex(',',@keys_temp,0) - 1)
		set @keys_temp = right(@keys_temp,len(@keys_temp) - charindex(',',@keys_temp,0))
		if @field_temp = 'ZA0100'
			set @fielddef = 'ZA0100 varchar(20) not null'
		else
			set @fielddef = @fielddef + ',' + @field_temp + ' int not null'
	end
	--如果是主对象添加它自己的ID排序字段(该字段不作为主键)
	if @layer = 1 
	begin
		set @fielddef = @fielddef + ',' + @infoid + 'ID int not null'
	end
----------------------------------------------------------------------------------------------------------------
	--执行建表动作
	execute('create table dbo.' + @infoid + '(' + @fielddef + ')')

----------------------------------------------------------------------------------------------------------------
	--修改该对象在的 gs_structure 中的记录(去掉对象的草稿标记)
	update gs_structure set state = '1'/*, pkey = @pkey*/  where infoid = @infoid
----------------------------------------------------------------------------------------------------------------
	--设置停止触发器的标记
	execute('create default [property_orderno_trigger_flag] as 1')
----------------------------------------------------------------------------------------------------------------
	--属性表中插入除“序号字段(XXXXID)”以外的其它已经构建的字段
	if @layer = 1 
	begin--如果是主对象添加主键
		insert into gs_property(infoid, infofield, description,datatype, length, decimal, defaultvalue,
			explain, restriction, orderno, singleness, secondname,seconddisplay, state,dictid,flag)
			values (@infoid,'ZA0100',@desc + '编码',0,20,0, null, null,0,1,0 ,'ZA0100',@desc + '编码','1', null,0);
		if(@infoid='AB01' )
			update gs_property set restriction='9' where infoid='AB01' and infofield='ZA0100'

	end
	else 
	begin --如果是子对象从主对象中拷贝主键
		insert into gs_property(
			infoid,infofield,description,datatype,length,decimal,defaultvalue,explain,
			restriction,restrictionexplain,dictid,condition,state,propertyset,orderno,
			singleness,secondname,seconddisplay,flag)
		select infoid= @infoid,infofield,description,datatype,length,decimal,defaultvalue='',
			explain,restriction=0,restrictionexplain='',dictid,condition='',state = '1','1',
			orderno,singleness=0,secondname,seconddisplay,flag = '0'
		from gs_property 
		where (infoid = @parentid) and (@keys like '%' + infofield + '%')
	end
----------------------------------------------------------------------------------------------------------------
	--属性表中插入“序号字段(XXXXID)”对应的记录
	insert into gs_property(infoid, infofield, description,datatype, length, decimal, defaultvalue,
		explain, restriction, orderno, singleness, secondname,seconddisplay, state,dictid,propertyset,flag)
		values (@infoid, @infoid + 'ID',@desc + '序号',2,9,0, null, null,0,5,0, @infoid + 'ID','序号','1', null,1,0)

----------------------------------------------------------------------------------------------------------------
	--设置对象主键
	execute('alter table ' + @infoid + ' add constraint PK_' + @infoid + ' primary key clustered (' + @keys + ')')

----------------------------------------------------------------------------------------------------------------

	--设置该对象与父对象的外键
	declare @parentkey varchar(1000)
	select @parentkey = pkey from gs_structure where infoid = @parentid
	--如果不是主对象
	if(@parentkey <> '' and (not @parentkey is null))
		execute('alter table ' + @infoid + ' add constraint FK_' + @infoid + '_' + @parentid + ' foreign key (' + @parentkey + ') references ' + @parentid + '(' + @parentkey + ') on update cascade on delete cascade')
	

--以下是为各种对象定制特定的属性
----------------------------------------------------------------------------------------------------------------------------------------
	--主对象添加特定的属性(主对象要定制的字段)
	if @layer = 1
	begin
		--ZA0101 是对象中元素的描述如：名称，姓名等
		execute('alter table ' + @infoid + ' add ZA0101 varchar(50) null')
		insert into gs_property(infoid,infofield,description,datatype, 
			length,decimal,defaultvalue,explain,restriction,orderno,
			singleness, secondname,seconddisplay, state,dictid,flag)
			values (@infoid,'ZA0101','名称',0,50,0,null,null,0,6,0,'ZA0101','名称','1',null,0)


		--ZA9999 是查询码，只对主对象起作用，适应范围除类别之外
		execute('alter table ' + @infoid + ' add ZA9999 varchar(10) null')
		insert into gs_property(infoid,infofield,description,datatype, 
			length,decimal,defaultvalue,explain,restriction,orderno,
			singleness, secondname,seconddisplay, state,dictid,flag)
			values (@infoid,'ZA9999','查询码',0,10,0,null,null,0,7,0,'ZA9999','查询码','1',null,0)

		--主对象中的分层、信息岛对象添加图像字段)
		/*
		if @objecttype = '0' or @objecttype = '1'
		begin
			--ZA9998：对象图片，只对主对象起作用，适应范围是分层、信息岛对象
			execute('alter table ' + @infoid + ' add ZA9998 image null')
			insert into gs_property(infoid,infofield,description,datatype, 
				length,decimal,defaultvalue,explain,restriction,orderno,
				singleness, secondname,seconddisplay, state,dictid,flag)
				values (@infoid,'ZA9998','图标',11,16,0,null,null,0,3,0,'ZA9998','图标','1',null,0)
		end
		*/

		--主对象中的信息岛对象，图像引用对象才添加
		--[2003-02-18]

		if @objecttype = '6' or @objecttype = '0'
		begin
			--ZA9998：对象图片，只对主对象起作用，适应范围是分层、信息岛对象
			execute('alter table ' + @infoid + ' add ZA9998 image null')
			insert into gs_property(infoid,infofield,description,datatype, 
				length,decimal,defaultvalue,explain,restriction,orderno,
				singleness, secondname,seconddisplay, state,dictid,flag)
				values (@infoid,'ZA9998','图片',11,16,0,null,null,0,10,0,'ZA9998','图片','1',null,0)
		end
		

	end
----------------------------------------------------------------------------------------------------------------
	--[2002-11-19]“主对象中的分层、信息岛对象添加图像字段”改为只有图像引用对象才添加
	--[2003-02-18]“有图像引用对象才添加”改为主对象中的信息岛对象，图像引用对象才添加
	/*
	if @objecttype = '6'
	begin
		--ZA9998：对象图片，只对主对象起作用，适应范围是分层、信息岛对象
		execute('alter table ' + @infoid + ' add ZA9998 image null')
		insert into gs_property(infoid,infofield,description,datatype, 
			length,decimal,defaultvalue,explain,restriction,orderno,
			singleness, secondname,seconddisplay, state,dictid,flag)
			values (@infoid,'ZA9998','图标',11,16,0,null,null,0,8,0,'ZA9998','图标','1',null,0)
	end
	*/
----------------------------------------------------------------------------------------------------------------
	--如果是分层对象
	if @objecttype = '1'
	begin
		--ZA9996默认为隐藏(propertyset = 1)
		execute('alter table ' + @infoid + ' add ZA9996 varchar(20) null')
		insert into gs_property(infoid,infofield,description,datatype, 
			length,decimal,defaultvalue,explain,restriction,orderno,
			singleness, secondname,seconddisplay, state,dictid,propertyset,flag)
			values (@infoid,'ZA9996','父项名称',0,20,0,null,null,0,9,0,'ZA9996','父项名称','1',null,1,0)
		--ZA9997默认为隐藏(propertyset = 1)
		execute('alter table ' + @infoid + ' add ZA9997 bit null')
		insert into gs_property(infoid,infofield,description,datatype, 
			length,decimal,defaultvalue,explain,restriction,orderno,
			singleness, secondname,seconddisplay, state,dictid,propertyset,flag)
			values (@infoid,'ZA9997','有无子项',2,1,0,null,null,0,10,0,'ZA9997','子项','1',null,1,0)

		execute('alter table ' + @infoid + ' add ZB0198 varchar(20) null default ''1''')
		insert into gs_property(infoid,infofield,description,datatype, 
			length,decimal,defaultvalue,explain,restriction,orderno,
			singleness, secondname,seconddisplay, state,dictid,propertyset,flag)
			values (@infoid,'ZB0198','是否允许录入',1,20,0,'1',null,0,11,0,'ZB0198','是否允许录入','1','09',0,0)

		execute('alter table ' + @infoid + ' add ZB0199 varchar(20) null')
		insert into gs_property(infoid,infofield,description,datatype, 
			length,decimal,defaultvalue,explain,restriction,orderno,
			singleness, secondname,seconddisplay, state,dictid,propertyset,flag)
			values (@infoid,'ZB0199','类别',1,20,0,null,null,0,12,0,'ZB0199','类别','1','OO',0,0)

	end
----------------------------------------------------------------------------------------------------------------
	execute('alter table ' + @infoid + ' add ZB9991 datetime null CONSTRAINT ZB9991' + @infoid+' DEFAULT getdate() WITH VALUES')
	insert into gs_property(infoid,infofield,description,datatype, 
		length,decimal,defaultvalue,explain,restriction,orderno,
		singleness, secondname,seconddisplay, state,dictid,propertyset,flag)
		values (@infoid,'ZB9991','起始时间',5,8,0,null,null,0,13,0,'ZB9991','起始','1',null,1,0)

	execute('alter table ' + @infoid + ' add ZB9992 datetime null  CONSTRAINT ZB9992' + @infoid+' DEFAULT getdate() WITH VALUES')
	insert into gs_property(infoid,infofield,description,datatype, 
		length,decimal,defaultvalue,explain,restriction,orderno,
		singleness, secondname,seconddisplay, state,dictid,propertyset,flag)
		values (@infoid,'ZB9992','截止时间',5,8,0,null,null,0,14,0,'ZB9992','截止','1',null,1,0)
----------------------------------------------------------------------------------------------------------------
	--非主对象添加状态标志字段
	/*
	if @layer != 1
	begin
		execute('alter table ' + @infoid + ' add ZC9993 varchar(1) null  default ''1''')
		insert into gs_property(infoid,infofield,description,datatype, 
			length,decimal,defaultvalue,explain,restriction,orderno,
			singleness, secondname,seconddisplay, state,dictid,propertyset,flag)
			values (@infoid,'ZC9993','状态标志',0,1,0,'0',null,0,9,0,'ZC9993','状态','1',null,1,0)
	end
	*/
	--[2002-11-19]以上改为所有对象都要添加 ZC9993 
	execute('alter table ' + @infoid + ' add ZC9993 varchar(1) null default ''1''')
	insert into gs_property(infoid,infofield,description,datatype, 
		length,decimal,defaultvalue,explain,restriction,orderno,
		singleness, secondname,seconddisplay, state,dictid,propertyset,flag)
		values (@infoid,'ZC9993','状态标志',0,1,0,'',null,0,15,0,'ZC9993','状态','1',null,1,0)

----------------------------------------------------------------------------------------------------------------		
	--为每个对象添加一个备注字段
	execute('alter table ' + @infoid + ' add ZC9995 varchar(255) null')
	insert into gs_property(infoid,infofield,description,datatype, 
		length,decimal,defaultvalue,explain,restriction,orderno,
		singleness, secondname,seconddisplay, state,dictid,propertyset,flag)
		values (@infoid,'ZC9995','备注',0,255,0,null,null,0,16,0,'ZC9995','备注',1,null,1,0)
----------------------------------------------------------------------------------------------------------------
	--对属性表进行重新排序
	declare @infofield sysname
	declare @orderno int
	set @orderno = 1	
	declare zm cursor keyset for select infofield from gs_property where infoid = @infoid order by flag,orderno
	open zm
	fetch next from zm into @infofield
	while @@fetch_status = 0
	begin
		update gs_property set orderno = @orderno where infoid = @infoid and infofield = @infofield
		fetch next from zm into @infofield
		set @orderno = @orderno + 1
	end
	close zm
	deallocate zm	
----------------------------------------------------------------------------------------------------------------
	--清除停止触发器的标记
	--if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[property_orderno_trigger_flag]') and objectproperty(id, N'IsDefault') = 1)
	drop default [dbo].[property_orderno_trigger_flag]
----------------------------------------------------------------------------------------------------------------





GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO


CREATE PROCEDURE gsp_del_ref_trigger 
	@infoid varchar(4)
 
AS
	execute(
'IF EXISTS (SELECT name FROM sysobjects WHERE  name = N''ZM_TRIGGER_DELETE_REFERENCE_' + @infoid + ''' AND type = ''TR'')
	DROP TRIGGER ZM_TRIGGER_DELETE_REFERENCE_' + @infoid)

	execute(
'CREATE TRIGGER ZM_TRIGGER_DELETE_REFERENCE_' + @infoid + '
ON ' + @infoid + ' FOR DELETE AS 
BEGIN
declare @infoid varchar(4), @infofield sysname, @datadelete varchar(1000)
declare refobj_cursor cursor for select infoid,infofield from gs_property where state = ''1'' and dictid like ''' + @infoid + '%''
open refobj_cursor
fetch next from refobj_cursor into @infoid, @infofield
while @@fetch_status = 0
begin
	SELECT @datadelete = ZA0100 FROM deleted
	execute(''update '' + @infoid + '' set '' + @infofield + '' = null where '' + @infofield + '' = '''''' + @datadelete + '''''''')
	fetch next from refobj_cursor into @infoid, @infofield
end
close refobj_cursor
deallocate refobj_cursor
END'
)


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO



CREATE PROCEDURE gsp_find_result 
	@datasource varchar(8000)
AS
	create table #ZMFINDRESULTVALUSE(fid int,falue int)
	execute('
		declare @valueindex int
		declare @index int
		set @valueindex = 1
		set @index = 1
		declare @value varchar(8000)
		declare cursor_value cursor for 
			' + @datasource + '
			for read only
		open cursor_value
		fetch next from cursor_value into @value
		while @@fetch_status = 0
		begin
			if @value = 1
			begin
				insert into #ZMFINDRESULTVALUSE(fid,falue) values (@index,@valueindex)
				set @index = @index + 1
			end
			fetch next from cursor_value into @value
			set @valueindex = @valueindex + 1
		end
		close cursor_value
		deallocate cursor_value'
	)
	select * from #ZMFINDRESULTVALUSE
	drop table #ZMFINDRESULTVALUSE

	


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO



CREATE PROCEDURE gsp_get_associate 
	@infoid sysname,
	@type int = 1,
	@infoidb sysname = null,
	@flag int = 0
 
AS
	if @flag = 0
	select dbo.associate_propertyset(@infoid,@infoidb,@type)


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO



CREATE PROCEDURE gsp_get_info 
	@infoid sysname = null,
	@flag int = 0,
	@showfield sysname = null,
	@where varchar(1000) = null
 
AS
	if @flag = 0
	begin
		if @infoid is null
		begin --返回所有的信息集
			select * from gs_structure
		end
		else
		begin --返回指定的信息集
			select * from gs_structure where infoid = @infoid
		end
	end
	else if @flag = 1
	begin --返回所有的存在表的信息集
		select * from gs_structure where layer > 0
	end
	else if @flag = 3
	begin --反回一个对象的根对象的名字如“AA01”
		declare @parent sysname
		while(1=1)
		begin
			set @parent = (select parentid1 from gs_structure where infoid = @infoid)
			if(@parent is null) break
			if(ltrim(rtrim(@parent)) = '') break
			set @infoid = @parent
		end
		select infoid = @infoid
	end
	else if @flag = 4
	begin --返回任何一个对象的根对象的名字如“AA01”，如果不存在根对象返回 NULL，应该用 4 代替 3
	      --而 3 中如果找不到根对象则返回它自己
		declare @parent_a sysname
		declare @layer int
		declare @root sysname
		while(1=1)
		begin
			select @parent_a = parentid,@layer = layer from gs_structure where infoid = @infoid
			if(@layer = 1)
			begin
				set @root = @infoid
			end
			if(@parent_a is null) break
			if(ltrim(rtrim(@parent_a)) = '') break
			set @infoid = @parent_a
		end
		select infoid = @root
	end
	else if @flag = 5
	begin--根据父对象返回子对象
		if @infoid is null
			select * from gs_structure where(parentid is null)
			--select * from gs_structure where(type != 7 and parentid is null)
		else
			select * from gs_structure where(parentid = @infoid)
			--select * from gs_structure where(type != 7 and parentid = @infoid)
	end
	else if @flag = 6
	begin--返回常量对象
		select * from gs_structure where infoid = 'EC01'
	end
	else if @flag = 7
	begin--返回可引用对象（主对象）
		select * from gs_structure where(type != 2 and layer = 1 and infoid != @infoid)
	end
	else if @flag = 8
	begin--返回有效的被继承对象
		declare @layer_a int
		set @layer_a = (select layer from gs_structure where infoid = @infoid)
		if(@layer_a = 1)
		begin
			select distinct o.infoid, gs_structure.description
			from gs_property inner join
			      gs_property o on 
			      gs_property.infofield = o.infofield inner join
			      gs_structure on o.infoid = gs_structure.infoid
			where((gs_property.infoid = @infoid) and (o.infoid <> @infoid) and (layer = 1))
		end
		else
		begin
			select distinct o.infoid, gs_structure.description
			from gs_property inner join
			      gs_property o on 
			      gs_property.infofield = o.infofield inner join
			      gs_structure on o.infoid = gs_structure.infoid
			where((gs_property.infoid = @infoid) and (o.infoid <> @infoid) and (layer < @layer_a) and layer > 0)
		end
	end
	else if @flag = 9
	begin--返回图像引用对象
		select * from gs_structure where type = '6'
	end
	else if @flag = 10
	begin	
		if @where = '' or @where is null
			execute('select ZA0100,' + @showfield + ' from ' + @infoid)
		else
			execute('select ZA0100,' + @showfield + ' from ' + @infoid + ' where ' + @where)
	end
	else if @flag = 11
	begin
		declare @result int
		set @result = 0
		if exists (select * from dbo.sysobjects where id = object_id(@infoid) and OBJECTPROPERTY(id, N'IsUserTable') = 1)
			set @result = @result + 1
		if exists (select * from gs_structure where infoid = @infoid)
			set @result = @result + 1
		select sourcetype = @result
	end

	else if @flag >= 100 and @flag <= 200
	begin--根据 state 返回对象
		select * from gs_structure where state = @flag - 100
	end


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO



CREATE PROCEDURE gsp_get_infoitem 
	@infoid sysname,
	@infofield sysname = null,
	@flag int = 0 

AS
	if @flag = 0
	begin --默认取对象所有的属性
		--带上是否有索引字段
		if @infofield is null
		begin
			select *,HadIndex = case when exists (select name from sysindexes where name = N'SIMPLE_' + InfoId + '_' + InfoField) then 1 else 0 end from gs_property where(infoid = @infoid) order by orderno
			--select * from gs_property where(infoid = @infoid) order by orderno
		end
		else
		begin
			select *,HadIndex = case when exists (select name from sysindexes where name = N'SIMPLE_' + InfoId + '_' + InfoField) then 1 else 0 end from gs_property where(infoid = @infoid and infofield = @infofield) order by orderno
		end
	end
	else if @flag = 1
	begin --设置计算公式时从中取各个对象的属性，过滤掉不能设置计算公式的属性
		select * from gs_property where(infoid = @infoid and infofield <> 'ZA0100'
			and datatype <> '9' and datatype <> '10' and datatype <> '11'
			and datatype <> '14' and datatype <> '15') order by orderno
	end
	else if @flag = 10
	begin --设置计算公式时从中取各个对象的属性，只取带有字符性质的字段
		select * from gs_property where(infoid = @infoid
			and infofield <> 'ZA0100'
			and (datatype = '0' or datatype = '1' or datatype = '6' 
				or datatype = '7' or datatype = '8' or datatype = '12' 
				or datatype = '13' or datatype = '16' or datatype = '17' 
				)) order by orderno
	end
	else if @flag = 11
	begin --设置计算公式时从中取各个对象的属性，只取带有数值性质的字段
		select * from gs_property where(infoid = @infoid
			and infofield <> 'ZA0100'
			and (datatype = '2')) order by orderno

	end
	else if @flag = 12
	begin --设置计算公式时从中取各个对象的属性，只取带有日期性质的字段
		select * from gs_property where(infoid = @infoid
			and infofield <> 'ZA0100'
			and (datatype = '3' or datatype = '4' or datatype = '5' 
				)) order by orderno
	end
	else if @flag = 21
	begin--返回一个对象的图像属性
		select * from gs_property where(infoid = @infoid and datatype = '11') order by orderno
	end
	else if @flag = 22
	begin--只选择非引用性质的、可以文本显示属性
	
		select * from gs_property where((infoid = @infoid) and (cast(datatype as int) < 9) and not(datatype = '1')) order by orderno
	end
	else if @flag = 23
	begin-- 返回可用作关联的引用属性
		select gs_property.*
		from gs_property left outer join gs_structure on left(gs_property.dictid,4) = gs_structure.infoid
		where (gs_property.datatype = '12') and (gs_property.infoid = @infoid) and (gs_structure.type = '0' or gs_structure.type = '1')
	end
	else if @flag = 24
	begin-- 返回有效的被继承对象所属性 @infoid:被继承对象
		select infofield,description from gs_property where(infoid = @infoid and flag = '1')
	end
	else if @flag = 25
	begin-- 返回有效的被继承对象所属性 @infoid:被继承对象
		-->>>>>>>>>>>>>>>>>>>>>>>>>>>>
		select max(infofield) from gs_property where((infoid = @infoid) 
		and (infofield  like substring(@infoid,1,2) +'%') 
		and (infofield not like '%ID'))
	end
	else if @flag = 30 or @flag = 31
	begin
		declare @properties varchar(8000),@field sysname
		if @flag = 30
		begin  --从表 syscolumns 中读取
			declare cursor_property cursor for 
				select [name] from syscolumns where(id = object_id(@infoid)) order by colid
				for read only
			open cursor_property
			fetch next from cursor_property into @field
			while @@fetch_status = 0
			begin
				if @properties is null
				begin --如果还没有为 @propertyflag 赋值则不加第一个 ;
					set @properties = @field
				end
				else
				begin --如果字符串中还没有了该字段
					set @properties = @properties + ',' + @field
				end
				fetch next from cursor_property into @field
			end
			close cursor_property
			deallocate cursor_property
	
		end		
	
		else
		begin --从表 gs_property 中读取
			--打开属性表的游标
			declare cursor_property cursor for 
				select infofield from gs_property where infoid = @infoid and state = 1 order by orderno
				for read only
			open cursor_property
			fetch next from cursor_property into @field
			while @@fetch_status = 0
			begin
				if @properties is null
				begin --如果还没有为 @propertyflag 赋值则不加第一个 ;
					set @properties = @field

				end
				else
				begin --如果字符串中还没有了该字段
					set @properties = @properties + ',' + @field
				end
				fetch next from cursor_property into @field
			end
			close cursor_property
			deallocate cursor_property
		end
		select properties = @properties
	end


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO



CREATE PROCEDURE gsp_get_propertyflag 
	@name sysname,--信息项标志的名称（取自表 gs_propertyflag 中的字段 CustomName）
	@datasourcetype char(1),--数据源类型：0。单独的一个对象(字串中不包含表名)；1。子对象附加父对象(字串中包含表名)；2：单独的一个对象字串中包含表名
	@userid varchar(300),--用户名
	@funcid varchar(300),--模块名
	@associatename varchar(1000) = null--根对象的关联名
 
AS
	if(@datasourcetype = 3)
	begin --如果是自定义的数据则不用生成字段语句
		select flag from gs_propertyflag where CustomName = @name and datasourcetype = @datasourcetype and userid = @userid and funcid = @funcid 
	end
	else
	begin
		declare @infoid sysname
		declare	@associatefield varchar(1000)
		set @infoid = @name
		--如果标记表中还没有该对象的条目
		if not exists(select infoid from gs_propertyflag where infoid = @infoid and datasourcetype = @datasourcetype and userid = @userid and funcid = @funcid)
		begin
			declare @propertyflag varchar(8000),@infofield sysname,@propertyset varchar(2)
			declare @layer int --取对象的数据上的层次
			if @datasourcetype = '0'
			begin
				--取该对象的关联字段,并把关联字段放在前边
				set @associatefield = dbo.associate_propertyset(@infoid,@associatename,1)
				if @associatefield is null set @associatefield = ''
				if(not @associatefield = '')
				begin
					set @propertyflag = @associatefield
					set @propertyflag = @infoid + '.' + replace(@propertyflag,',',',0;' + @infoid + '.') + ',0'
				end
				--打开属性表的游标
				declare cursor_property cursor for 
					select infofield,propertyset from gs_property where infoid = @infoid and state = 1 order by orderno
					for read only
				open cursor_property
				fetch next from cursor_property into @infofield,@propertyset
				while @@fetch_status = 0
				begin
					if(@propertyset<> '1' or dbo.must_select_field(@infoid,@infofield,@associatename) = 1)
					begin --如果该字段是非隐藏字段或必选字段

						if @propertyflag is null
						begin --如果还没有为 @propertyflag 赋值则不加第一个 ;
							set @propertyflag = @infoid + '.' + @infofield + ',' + @propertyset
						end
						else
						begin --如果字符串中还没有了该字段
							if charindex(@infofield,@propertyflag) = 0
							begin
								set @propertyflag = @propertyflag + ';' + @infoid + '.' + @infofield + ',' + @propertyset
							end
						end
					end
					fetch next from cursor_property into @infofield,@propertyset
				end
				close cursor_property
				deallocate cursor_property
			end
			else if  @datasourcetype = '1'
			begin
				declare @currentobject sysname
				set @currentobject = @infoid
				declare @keys varchar(100)
				set @layer = (select layer from gs_structure where infoid = @infoid)
				--循环所有的对象
				while @layer > 0
				begin
					declare @propertyflag1 varchar(8000)
						
					select @layer = layer,@keys = pkey from gs_structure where infoid = @currentobject
					--取该对象的关联字段
					set @associatefield = dbo.associate_propertyset(@currentobject,@associatename,1)
					if @associatefield is null set @associatefield = ''

					if(not @associatefield = '')
					begin
						set @propertyflag1 = @associatefield
						set @propertyflag1 = @currentobject + '.' + replace(@propertyflag1,',',',0;' + @currentobject + '.') + ',0'
					end
					--打开属性表的游标
					declare cursor_property cursor for 
						select infofield,propertyset from gs_property where infoid = @currentobject and state = 1 order by orderno
						for read only
					open cursor_property
					fetch next from cursor_property into @infofield,@propertyset
					while @@fetch_status = 0
					begin
						if(@propertyset<> '1' or dbo.must_select_field(@currentobject,@infofield,@associatename) = 1)
						begin  --如果该字段是非隐藏字段或必选字段

							if(@currentobject <> @infoid)
							begin--如果当前的对象不是操作对象则只取关联字段和ZA0101字段
								if(charindex(@infofield,@associatefield) = 0 and @infofield <> 'ZA0101' and charindex(@infofield,@keys) = 0)
								begin --如果即不是关联字段又不是ZA0101字段
									fetch next from cursor_property into @infofield,@propertyset
									continue
								end
							end

					        	if @propertyflag1 is null
							begin --如果还没有为 @propertyflag 赋值则不加第一个 ;
								set @propertyflag1 = @currentobject + '.' + @infofield + ',' + @propertyset
							end
							else
							begin --如果字符串中还没有了该字段
								if charindex(@infofield,@propertyflag1) = 0
								begin
									set @propertyflag1 = @propertyflag1 + ';' + @currentobject + '.' + @infofield + ',' + @propertyset
								end
							end
						end
						fetch next from cursor_property into @infofield,@propertyset
					end
					close cursor_property
					deallocate cursor_property
	
					set @currentobject = (select parentid1 from gs_structure where infoid = @currentobject)
	
					if @propertyflag is null
					begin --如果还没有为 @propertyflag 赋值则不加第一个 ;
						set @propertyflag = @propertyflag1
					end
					else
					begin --如果字符串中还没有了该字段
						set @propertyflag = @propertyflag1 + ';' + @propertyflag
					end
					set @propertyflag1 = null
					set @layer = @layer - 1
				end
			end
			--insert into gs_propertyflag(customname,infoid,datasourcetype,userid,funcid,flag) values(@infoid,@infoid,@datasourcetype,@userid,@funcid,@propertyflag)
			select @propertyflag 
		end
		select flag from gs_propertyflag where infoid = @infoid and datasourcetype = @datasourcetype and userid = @userid and funcid = @funcid 
	end


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO




CREATE PROCEDURE dbo.gsp_getinfoid

	(
		@MainInfoId varchar(4),--主对象
		@childInfoId varchar(1) = '0',--是直接子对象为1 子对象加关联对象为0
		@strInfoId varchar(5000) OUTPUT   --返回值
	) 
AS
	/* SET NOCOUNT ON */
	SET QUOTED_IDENTIFIER off
	set @strInfoId=''
	--把主对象的所有子对象插入到临时表中
	select * into #strinfoid  from gs_structure where ((parentid=@maininfoid  or (parentid in ( select InfoId from gs_structure where parentid=@maininfoid and type='2'))) and (state=1) and (type='0' or type='1')) or (infoid=@maininfoid)
	


if @childInfoId='1'
   goto exitproc
--************取与主对象关联的对象
declare @strtemp varchar(4000)
declare @infoidb varchar(4)
set @strtemp=''
set @infoidb=''

      declare  objassociate cursor static for
      select infoidb from gs_objectassociate where infoida=@maininfoid
       
       open objassociate
       fetch next from  objassociate into @infoidb

       while(@@FETCH_STATUS=0)
       begin
          set @strtemp=@strtemp+@infoidb         
          fetch next from objassociate into @infoidb 
       end        
          
       close objassociate
       DEALLOCATE objassociate
--*************************       

       if  @strtemp=''
         goto exitproc

      set @strtemp=replace(@strtemp,',',"','")

      declare  objassociate cursor static for
      select infoid from gs_structure where infoid in (@strtemp)

       open objassociate
       fetch next from  objassociate into @infoidb

       while(@@FETCH_STATUS=0)
       begin
			insert into #strinfoid select *  from gs_structure where ((parentid=@infoidb  or (parentid in (select InfoId from gs_structure where parentid=@infoidb and type='2'))) and (state=1) and (type='0' or type='1')) or (infoid=@infoidb)
          fetch next from objassociate into @infoidb    
       end        
         close objassociate
       DEALLOCATE objassociate
     
      	
   exitproc:	
   
      declare  objassociate cursor static for
      select infoid from #strinfoid order by infoid
       
       open objassociate
       fetch next from  objassociate into @infoidb

       while(@@FETCH_STATUS=0)
       begin
          set @strInfoId=@strInfoId+','+@infoidb         
          fetch next from objassociate into @infoidb 
       end        
          
       close objassociate
       DEALLOCATE objassociate

	
	RETURN



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO



CREATE PROCEDURE gsp_goback_object 
	@table sysname
 
AS
	--删除数据表
	if exists (select * from sysobjects where id = object_id(@table) and objectproperty(id, N'IsUserTable') = 1)
		execute('drop table ' + @table)
	--把对象设置为草稿状态
	update gs_structure set state = 0 where infoid = @table
	--把对象的属性设置为草稿状态
	update gs_property set state = 0 where infoid = @table
	--删除内部字段
	--delete gs_property where((infoid = @table)and(infofield like 'Z%' ) )
	--删除ID字段
	--delete gs_property where((infoid = @table)and(infofield like '%ID' ) )
	--删除内部字段
	delete gs_property where((infoid = @table)and(flag = '0'))
	
	delete gs_propertyflag where flag like '%' + @table + '%'
	--如果有暗表则删除时间暗表的信息
	if exists (select * from sysobjects where id = object_id(@table + '_B') and objectproperty(id, N'IsUserTable') = 1)
		execute('drop table ' + @table + '_B');
	--如果有暗表则删除S表
	if exists (select * from sysobjects where id = object_id(@table + 'S') and objectproperty(id, N'IsUserTable') = 1)
		execute('drop table ' + @table + 'S');
	update gs_structure set secrit = 0 where infoid = @table



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO



CREATE PROCEDURE gsp_goback_properties 
	@table sysname,
	@properties varchar(1000)
 
AS
	declare @prperty varchar(50)
	declare @plen int

	while len(@properties) > 0
	begin
		set @plen = charindex(',',@properties,0)
		if @plen = 0
		begin
			set @prperty = @properties
			set @properties = ''
		end
		else
			set @prperty = left(@properties,@plen - 1)
		------------------------------------------------------------
		--使用字段 @prperty
		if exists(select name from syscolumns where (id = object_id(@table)) and (name = @prperty))
		begin--如果表中确实有该字段
			if exists(select * from sysindexes where name = 'UQ_' + @table + '_' + @prperty)
			begin--如果有唯一索引，则先删除依赖它的索引，这儿只过滤非主键的 UNIQUE 索引
				execute('drop index ' + @table + '.UQ_' + @table + '_' + @prperty)
			end
			if exists(select * from sysindexes where name = 'SIMPLE_' + @table + '_' + @prperty)
			begin--如果有简单索引，则先删除依赖它的索引，这儿只过滤非主键的 UNIQUE 索引
				execute('drop index ' + @table + '.SIMPLE_' + @table + '_' + @prperty)
			end
			--表中删除列
			execute('alter table ' + @table + ' drop column ' + @prperty)
			--gs_propertyflag 表中删除相应的纪录
			delete gs_propertyflag where flag like '%' +  @table + '.' + @prperty + '%'
		end
		--把对象的属性设置为草稿状态
		update gs_property set state = 0 where((infoid = @table) and (infofield = @prperty))
    delete from gs_objectassociate where propertyset like '%'+@prperty+'%'		
------------------------------------------------------------
		set @properties = substring(@properties,@plen + 1,len(@properties) - @plen)
	end



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO
















--行检验公式处理，返回检验未通过的校验公式
CREATE   procedure dbo.gsp_innercheck
      @typeno varchar(20),--类别
      @settableno varchar(20),--套表
      @rptno      varchar(20),--报表表号
      @za0100 varchar(20),--单位编码
      @starttime varchar(10),--统计时间
      @revalue  varchar(8000)  OUT
 
as
	SET NOCOUNT ON
	SET QUOTED_IDENTIFIER off
  
declare @v1 varchar(20)--左表达式值
declare @v2 varchar(20)--右表达式值
declare @strwhere varchar(200) --时间条件和当前条件

declare @lexpr varchar(500)--左表达式
declare @rexpr varchar(500)--右表达式
declare @lexpr1 varchar(500)--左表达式
declare @rexpr1 varchar(500)--右表达式
declare @opsign varchar(2)------比较符
--declare @tableno varchar(20) ----------表号
declare @blnresult bit;

declare @strsql varchar(500)--生成临时sql语句
declare @strtemp varchar(500)--存检验公式
declare @value varchar(20)  --临时值
declare @tabno  varchar(20)--检验公式所在的表
declare @conditionid varchar(20)
declare @tabname varchar(40) --报表表名
declare @row  varchar(20) --单元格行
declare @col  varchar(20) --单元格列
declare @colcount varchar(20)--数据表的总列数
declare @rowcount varchar(20)--数据表的总行数
declare @i int 
declare @cutno varchar(20)
declare @checktype varchar(1) --检验类型 
declare @custr varchar(100)
declare @strtabchk varchar(500)
declare @removerow varchar(200)
declare @removecol varchar(200)

declare @tablename varchar(20)

--表R244存放单元格检验公式
--先生成临时表结构
set @blnresult=0;
set @colcount=0
set @rowcount=0
SELECT settableno,tableno,conditionid,lexpr,opsign,rexpr,lexpr1,rexpr1,tableno cucol,tableno checktype into #check  FROM R242 WHERE 1=2

if  isnull(@starttime,'')=''
   set @strwhere=" and  zc9993='1' and zb0110='"+@za0100+"'"
else
  set   @strwhere="  and starttime='"+@starttime +"' and zb0110='"+@za0100+"'"

--取共有多少表,不同表的总行数的总列数不同
  if isnull(@rptno,'')=''
    set @strsql='select distinct tableno,name from r200 WHERE typeno='+@typeno +' and settableno='+@settableno
  else
    set @strsql='select distinct tableno,name from r200 WHERE typeno='+@typeno +' and settableno=' + @settableno +' and tableno='+@rptno

    set @strsql='DECLARE T_ColCount cursor static for '+@strsql  
    execute(@strsql)
    
    open T_ColCount 
    fetch next from T_ColCount  
    into @tabno,@tabname



--根据每个表的行数及列数把行、列检验公式转换
while(@@FETCH_STATUS = 0)
begin
     set @tablename='t'+@TYPENO+'_'+@SETTABLENO+'_'+@tabno
	  --其中checktype为检验公式类别： 1为行检验 2为列 3为单元格，
      --取表的总列数
		set @strsql="select count(*) from  syscolumns where id=OBJECT_ID('"+@tablename+"') and name like 'C%'"
		set @strsql='DECLARE temp_value CURSOR static FOR '+@strsql
	        exec(@strsql)
	        open temp_value
	        fetch next from temp_value into @colcount
	        close temp_value
	        deallocate temp_value
	        
	        
	        	--把行检验公式转换成单元格公式并插入到临时表中
		set @i=1
		while(@i<=@colcount)
		begin
			set @strsql="INSERT into #check SELECT settableno,tableno,conditionid, lexpr,opsign,rexpr,replace(lexpr1,']',':"+cast(@i as varchar(20))+"]') lexpr1,replace(rexpr1,']',':"+cast(@i as varchar(20))+"]') rexpr1,"+cast(@i as varchar(20)) +',1 FROM R242  WHERE typeno='+@typeno +' and settableno=' + @settableno +' and tableno='+@tabno+" and isnull(removecol,'')=''"
			exec(@strsql)
			set @i=@i+1
		end
		
--**********************对于有排除列的处理
		
		   DECLARE temp_value CURSOR static FOR 
	        select conditionid,removecol from  R242  WHERE typeno=@typeno  and settableno=@settableno  and tableno=@tabno and isnull(removecol,'')<>''
	        open temp_value
	        fetch next from temp_value into @conditionid,@removecol
   
			while(@@FETCH_STATUS=0)
			begin
			    set @removecol=','+@removecol+','
				set @i=1
				while(@i<=@colcount)
				begin
				    set @col=charindex(','+cast(@i as varchar(20))+',',@removecol)
						if @col='0'
							begin				    
								set @strsql="INSERT into #check SELECT settableno,tableno,conditionid, lexpr,opsign,rexpr,replace(lexpr1,']',':"+cast(@i as varchar(20))+"]') lexpr1,replace(rexpr1,']',':"+cast(@i as varchar(20))+"]') rexpr1,"+cast(@i as varchar(20)) +',1 FROM R242  WHERE typeno='+@typeno +' and settableno=' + @settableno +' and tableno='+@tabno+' and conditionid=' +@conditionid
								exec(@strsql)
							end
					set @i=@i+1
				end
				
		        fetch next from temp_value into @conditionid,@removecol
			end
            close temp_value
	        deallocate temp_value

--**********************		
		
		
		
/*		
		---取表的总行数
		set @strsql='select MAX(ROWID) from t_'+@TYPENO+'_'+@SETTABLENO+'_'+@tabno 
		set @strsql='DECLARE temp_value CURSOR FOR '+@strsql
	        exec(@strsql)
	        open temp_value
	        fetch next from temp_value into @rowcount
	        close temp_value
	        deallocate temp_value
*/
/*
	--把列检验公式转换成单元格公式并插入到临时表中
	set @i=1
	while(@i<=@rowcount)
	begin
		set @strsql="INSERT into #check SELECT settableno,tableno,conditionid, lexpr,opsign,rexpr,
		 replace(lexpr1,'[','["+cast(@i as varchar(20))+":') lexpr1,
		 replace(rexpr1,'[','["+cast(@i as varchar(20))+":') rexpr1,"
		 +cast(@i as varchar(20)) +',3 FROM R243  WHERE typeno='+@typeno +' and settableno=' + @settableno +' and tableno='+@tabno
		exec(@strsql)
		set @i=@i+1
	end
	
--settableno,tableno,conditionid,lexpr,opsign,rexpr,lexpr1,rexpr1,tableno cucol,tableno checktype

*/
--列校验公式
--***************************
	DECLARE temp_value CURSOR static FOR 
        select tableno,conditionid,lexpr,opsign,rexpr,removerow,lexpr1,rexpr1 from r243 WHERE typeno=@typeno and settableno=@settableno  and tableno=@tabno and isnull(lexpr1,'')<>'' and  isnull(rexpr1,'')<>''
        open temp_value
        fetch next from temp_value into @tabno,@conditionid, @lexpr,@opsign,@rexpr,@removerow,@lexpr1,@rexpr1
  
       if @removerow=''
         set @removerow=null
       while(@@FETCH_STATUS=0)
       begin
          set @lexpr1=replace(@lexpr1,'[','[c')
          set @rexpr1=replace(@rexpr1,'[','[c')
          set @strsql='insert into #check select '+@settableno+','+@tabno+','+@conditionid+','+char(39)+@lexpr+char(39)+','+char(39)+@opsign+char(39)+','+char(39)+@rexpr+char(39)+','+@lexpr1+','+@rexpr1+',rowid,2 from '+@tablename+ 
            ' where not ('+@lexpr1+@opsign+@rexpr1+') and (rowid not in ('+isnull(@removerow,char(39)+''+char(39))+'))'+@strwhere
      
          exec(@strsql) 
          if @@error<>0
             begin
                set @strsql='insert into #check select '+@settableno+','+@tabno+','+@conditionid+','+char(39)+@lexpr+char(39)+','+char(39)+@opsign+char(39)+','+char(39)+@rexpr+char(39)+',null,null,rowid,2'
                exec(@strsql) 
             end
               
          fetch next from temp_value into @tabno,@conditionid, @lexpr,@opsign,@rexpr,@removerow,@lexpr1,@rexpr1
          if @removerow=''
            set @removerow=null

           --fetch next from temp_value into @tabno,@strtemp, @lexpr,@opsign,@rexpr,@lexpr1,@rexpr1
       end  
       close temp_value
       deallocate temp_value
       --//插入错误的校验公式  
       insert into #check select settableno,tableno,conditionid,lexpr,opsign,rexpr,null,null,1,2 from r243 WHERE typeno=@typeno and settableno=@settableno  and tableno=@tabno and (isnull(lexpr1,'')='' or  isnull(rexpr1,'')='')

--*****************************	  
  --     select * from r243 where tableno=4
/*       
       while(@@FETCH_STATUS=0)
       BEGIN
       set @strsql='insert into #check select '+@settableno+','+@tabno+','+@conditionid+','+@lexpr+','+@opsign+','+@rexpr+','+@lexpr1+','+@rexpr1+',rowid,2 from t_'+@TYPENO+'_'+@SETTABLENO+'_'+@tabno
                +' where not ((@opsign='=' and "+@lexpr1+'='+@rexpr1+") or (@opsign='>' 
                                and "+@lexpr1+'='+@rexpr1+") or (@opsign='>=' and "+@lexpr1+'='+@rexpr1+")
                                or (@opsign='<=' and "+@lexpr1+'='+@rexpr1+") or (@opsign='<' and "+@lexpr1+'='+@rexpr1+") 
                                or (@opsign='<>' and "+@lexpr1+'='+@rexpr1+"))      
           exec(@strsql)                     
           fetch next from temp_value into @tabno,@strtemp, @lexpr,@opsign,@rexpr,@lexpr1,@rexpr1
       end
*/

  set @strsql='INSERT into #check SELECT settableno,tableno,conditionid, lexpr,opsign,rexpr,lexpr lexpr1,rexpr rexpr1,conditionid,3 FROM R244  WHERE typeno='+@typeno +' and settableno=' + @settableno +' and tableno='+@tabno
  exec(@strsql)


    fetch next from T_ColCount 
    into @tabno,@tabname                                
end

close T_ColCount 
deallocate T_ColCount 


--把单元格检验公式插入到临时表中



--读取每个检验公式
DECLARE R242_cursor CURSOR FOR   SELECT lexpr1,rexpr1,tableno  FROM #check where checktype<>2  for update
OPEN R242_cursor
FETCH NEXT FROM R242_cursor
INTO @lexpr,@rexpr,@tabno

--循环处理每个一检验公式
WHILE @@FETCH_STATUS = 0
BEGIN
    --读取左检验公式
  if  isnull(@lexpr,'')<>'' and isnull(@rexpr,'')<>''
    begin
	while(charindex('[',@lexpr)<>0)
	begin
	
	set @tablename='t'+@TYPENO+'_'+@SETTABLENO+'_'+@tabno
	
	    set @strtemp= substring(@lexpr,CHARINDEX('[',@lexpr)+1,CHARINDEX(']',@lexpr)-CHARINDEX('[',@lexpr)-1)         
		set @row=substring(@strtemp,1,charindex(':',@strtemp,1)-1)
		set @col=right(@strtemp,len(@strtemp)-len(@row)-1)
		--set @col=replace(@strtemp,@row+':','')
		set @strsql='SELECT c'+@col+' FROM '+@tablename+' where rowid='+@row+@strwhere
		set @strsql='DECLARE temp_value CURSOR static FOR '+@strsql
	        set @value=null
	        exec(@strsql)
	        open temp_value
	        if @@error=0
	        begin
				fetch next from temp_value into @value
    			if @@FETCH_STATUS <> 0
				set @value=null

				close temp_value
				deallocate temp_value
			end
            set @lexpr=replace(@lexpr,'['+@strtemp+']',@value)
	end
    --读取右检验公式
	while(charindex('[',@rexpr)<>0)
	begin
  
        set @strtemp= substring(@rexpr,CHARINDEX('[',@rexpr)+1,CHARINDEX(']',@rexpr)-CHARINDEX('[',@rexpr)-1) 
	    set @row=substring(@strtemp,1,charindex(':',@strtemp,1)-1)
	    set @col=right(@strtemp,len(@strtemp)-len(@row)-1)
	    --set @col=replace(@strtemp,@row+':','')
  	    set @strsql='SELECT c'+@col+' FROM '+@tablename+' where rowid='+@row+@strwhere
        set @strsql='DECLARE temp_value CURSOR static FOR '+@strsql
	        
	        set @value=null
	        exec(@strsql)
	        open temp_value
	        if @@error=0
	        begin
				fetch next from temp_value into @value
				if @@FETCH_STATUS <> 0
					set @value=null
				close temp_value
				deallocate temp_value
			end
           set @rexpr=replace(@rexpr,'['+@strtemp+']',@value)
       end
    
     --通过游标读取左式的值
     set @v1=null
     set @v2=null
     if isnull(@lexpr,'')<>'' and isnull(@rexpr,'')<>'' 
      begin
		set @strsql="DECLARE temp_lexpr CURSOR static FOR select "+@lexpr+","+@rexpr
		exec(@strsql)
		open temp_lexpr
		fetch next from temp_lexpr into @v1,@v2
		CLOSE temp_lexpr
		DEALLOCATE temp_lexpr
      end 
   
   /*
     --通过游标读取右式的值
     set @v2='0'
     if isnull(@rexpr,'')<>'' 
      begin
		set @strsql='dECLARE temp_rexpr CURSOR static FOR select '+ @rexpr
		exec(@strsql)
		open temp_rexpr
		fetch next from temp_rexpr into @v2
		CLOSE temp_rexpr
		DEALLOCATE temp_rexpr
      end
     */

--更新临时表，将左式及右式的值赋到数据库中       
        UPDATE #check SET lexpr1=replace(@v1,' ','') ,rexpr1=replace(@v2,' ','')
	WHERE CURRENT OF R242_cursor
 end
 else
        UPDATE #check SET lexpr1=null ,rexpr1=null WHERE CURRENT OF R242_cursor

    --读下一检验公式
    FETCH NEXT FROM R242_cursor
	INTO @lexpr,@rexpr,@tabno

end

CLOSE R242_cursor
DEALLOCATE R242_cursor

delete from #check where (checktype<>2 and  (isnull(lexpr1,'')<>'' and  isnull(rexpr1,'')<>'') and (opsign='=' and cast(lexpr1 as float)=cast(rexpr1 as float)) or (opsign='>' 
                                and cast(lexpr1 as float)>cast(rexpr1 as float)) or (opsign='>=' and cast(lexpr1 as float)>=cast(rexpr1 as float))
                                or (opsign='<=' and cast(lexpr1 as float)<=cast(rexpr1 as float)) or (opsign='<' and cast(lexpr1 as float)<cast(rexpr1 as float)) 
                             or (opsign='<>' and cast(lexpr1 as float)<>cast(rexpr1 as float)) )
--select * from #check
--drop table #check

  if isnull(@rptno,'')=''
    set @strsql='select distinct tableno,name from r200 WHERE typeno='+@typeno +' and settableno='+@settableno
  else
    set @strsql='select distinct tableno,name from r200 WHERE typeno='+@typeno +' and settableno=' + @settableno +' and tableno='+@rptno

    set @strsql='DECLARE T_ColCount cursor static for '+@strsql  
    execute(@strsql)
    
    open T_ColCount 
    fetch next from T_ColCount  
    into @tabno,@tabname
set @revalue=''
--分别把表的检验结果输出
while(@@FETCH_STATUS = 0)
begin
      set @strtabchk='==================================================='
      set @strtabchk=@strtabchk+char(13)+@tabno+' : '+@tabname
      set @strtabchk=@strtabchk+char(13)+'==================================================='

	--读取检验未通过的检验公式
	dECLARE temp_export CURSOR static FOR 
		select  conditionid, lexpr,opsign,rexpr,lexpr1, rexpr1,cucol,checktype from #check where  settableno=@settableno  and tableno=@tabno  order by settableno,tableno,checktype,conditionid,cucol

/*	select conditionid, lexpr,opsign,rexpr,lexpr1, rexpr1,cucol,checktype from #check where not ((opsign='=' and cast(lexpr1 as float)=cast(rexpr1 as float)) or (opsign='>' 
                                and cast(lexpr1 as float)>cast(rexpr1 as float)) or (opsign='>=' and cast(lexpr1 as float)>=cast(rexpr1 as float))
                                or (opsign='<=' and cast(lexpr1 as float)<=cast(rexpr1 as float)) or (opsign='<' and cast(lexpr1 as float)<cast(rexpr1 as float)) 
                                or (opsign='<>' and cast(lexpr1 as float)<>cast(rexpr1 as float))   ) and settableno=@settableno  and tableno=@tabno  order by settableno,tableno,checktype,conditionid,cucol
 */
 	open temp_export

	FETCH NEXT FROM temp_export
	INTO @conditionid, @lexpr,@opsign,@rexpr,@lexpr1,@rexpr1,@col,@checktype
	--@strtemp检验公式号

	set @revalue=@revalue+char(13)+@strtabchk+char(13)
	set @cutno=''
        set @row=''

        if @@FETCH_STATUS = 0
             update r220 set checkpass='00' where typeno=@typeno and settableno=@settableno  and tableno=@tabno and zc9993='1' and zb0110=@za0100
        else
             update r220 set checkpass='10' where typeno=@typeno and settableno=@settableno  and tableno=@tabno and zc9993='1' and zb0110=@za0100



	WHILE @@FETCH_STATUS = 0
	BEGIN
	    set @blnresult=1
  	  set @strtabchk=(select case @checktype when '1' then '行' when '2' then '列' when '3' then '单元格' end)
	   set @custr=char(13)
	   if isnull(@lexpr1,'')<>'' and isnull(@rexpr1,'')<>'' 
	    begin
	    
		if @cutno<>@conditionid or @row<>@checktype
		begin
			set @custr=char(13)+char(13)+@strtabchk+'检验公式：'+ @lexpr+@opsign+@rexpr+char(13)
			set @cutno=@conditionid
			set @row=@checktype
		end
		set @strsql=''
		if @strtabchk='行'
		    set @strsql='第'+@col+'列 '
		if @strtabchk='列'
		    set @strsql='第'+@col+'行 '
		set   @revalue =@revalue+@custr+@strsql+@lexpr1+@opsign+@rexpr1
         end
         else
            begin
              if charindex(@strtabchk+'检验公式：'+ @lexpr+@opsign+@rexpr+' 出错',@revalue)=0
                set   @revalue =@revalue+@custr+'***** '+@strtabchk+'检验公式：'+ @lexpr+@opsign+@rexpr+' 出错'
            end  
		FETCH NEXT FROM temp_export
		INTO @conditionid, @lexpr,@opsign,@rexpr,@lexpr1,@rexpr1,@col,@checktype
	end

	CLOSE temp_export
	DEALLOCATE temp_export
 
    fetch next from T_ColCount  
    into @tabno,@tabname

end
            --如果全部成功则返回空值
	if @blnresult=0
                   set @revalue=''

	CLOSE T_ColCount
	DEALLOCATE T_ColCount

return







GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO





--行计算公式处理
CREATE procedure dbo.gsp_innerformula
      @typeno varchar(20),--类别
      @settableno varchar(20),--套表
      @rptno      varchar(20),--报表表号
      @za0100 varchar(20),--单位编码
      @starttime varchar(10)--统计时间
     -- @revalue  varchar(8000)  OUT
 
as
	SET NOCOUNT ON
	SET QUOTED_IDENTIFIER off
  
declare @v1 varchar(20)--左表达式值
declare @v2 varchar(20)--右表达式值
declare @strwhere varchar(200) --时间条件和当前条件

declare @lexpr varchar(500)--左表达式
declare @rexpr varchar(500)--右表达式
declare @lexpr1 varchar(500)--左表达式
declare @rexpr1 varchar(500)--右表达式

--declare @tableno varchar(20) ----------表号

declare @strsql varchar(500)--生成临时sql语句
declare @strtemp varchar(500)--存检验公式
declare @value varchar(20)  --临时值
declare @conditionid varchar(20)
declare @row  varchar(20) --单元格行
declare @col  varchar(20) --单元格列
declare @colcount varchar(20)--数据表的总列数
declare @rowcount varchar(20)--数据表的总行数
declare @i int 
declare @cutno varchar(20)
declare @checktype varchar(1) --检验类型 
declare @custr varchar(100)
declare @strtabchk varchar(500)
declare @removerow varchar(200)

--表R244存放单元格检验公式
--先生成临时表结构
set @colcount=0
set @rowcount=0

SELECT conditionid,lexpr,rexpr,rexpr rexpr1,tableno checktype into #check  FROM R252 WHERE 1=2

if  isnull(@starttime,'')=''
   set @strwhere=" and  zc9993='1'"
else
  set   @strwhere="  and starttime='"+@starttime +char(39)

--根据每个表的行数转换公式
	  --其中checktype为公式类别： 1为行 3为单元格，
      --取表的总列数
		set @strsql="select count(*) from  syscolumns where id=OBJECT_ID('"+'t_'+@TYPENO+'_'+@SETTABLENO+'_'+@rptno+"') and name like 'C%'"
		set @strsql='DECLARE temp_value CURSOR static FOR '+@strsql
	        exec(@strsql)
	        open temp_value
	        fetch next from temp_value into @colcount
	        close temp_value
	        deallocate temp_value
	        
	        	--把行检验公式转换成单元格公式并插入到临时表中

		set @i=1
		while(@i<=@colcount)
		begin
			--set @strsql="INSERT into #check SELECT conditionid,lexpr,'['"+rexpr+"']',replace(rexpr,']',':"+cast(@i as varchar(20))+"]') rexpr1,1 FROM R252  WHERE typeno='+@typeno +' and settableno=' + @settableno +' and tableno='+@rptno
                 INSERT into #check SELECT conditionid,'['+lexpr+':'+cast(@i as varchar(20))+']',rexpr,replace(rexpr,']',':'+cast(@i as varchar(20))+']') ,1 FROM R252  WHERE typeno=@typeno  and settableno= @settableno  and tableno=@rptno
			--exec(@strsql)
			set @i=@i+1
		end





--把单元格检验公式插入到临时表中
    set @strsql='INSERT into #check SELECT conditionid, lexpr,rexpr,rexpr rexpr1,3 FROM R254  WHERE typeno='+@typeno +' and settableno=' + @settableno +' and tableno='+@rptno
    exec(@strsql)


--读取每个检验公式

DECLARE R252_cursor CURSOR static FOR 
SELECT lexpr,rexpr1 FROM #check order by checktype desc,conditionid

OPEN R252_cursor
FETCH NEXT FROM R252_cursor
INTO @lexpr,@rexpr

--循环处理每个一检验公式
WHILE(@@FETCH_STATUS = 0)
BEGIN
	    
    --读取右检验公式
	while(charindex('[',@rexpr)<>0)
	begin
  
        set @strtemp= substring(@rexpr,CHARINDEX('[',@rexpr)+1,CHARINDEX(']',@rexpr)-CHARINDEX('[',@rexpr)-1) 
	    set @row=substring(@strtemp,1,charindex(':',@strtemp,1)-1)
	    set @col=right(@strtemp,len(@strtemp)-len(@row)-1)
  	    set @strsql='SELECT c'+@col+' FROM T_'+@TYPENO+'_'+@SETTABLENO+'_'+@rptno+' where rowid='+@row+' and b0110='+char(39)+@za0100+char(39)+@strwhere
        set @strsql='DECLARE temp_value CURSOR static FOR '+@strsql
	        
	        exec(@strsql)
	        open temp_value
	        fetch next from temp_value into @value
	        close temp_value
	        deallocate temp_value
           set @rexpr=replace(@rexpr,'['+@strtemp+']',isnull(@value,'0'))
    end
    
     --通过游标读取右式的值
     set @v1='0'
     if isnull(@rexpr,'')<>'' 
      begin
		set @strsql='DECLARE temp_lexpr CURSOR static FOR select '+@rexpr
		exec(@strsql)
		open temp_lexpr
		fetch next from temp_lexpr into @v1
		CLOSE temp_lexpr
		DEALLOCATE temp_lexpr
      end 


    --为公式左式赋值
 set @strtemp= substring(@lexpr,CHARINDEX('[',@lexpr)+1,CHARINDEX(']',@lexpr)-CHARINDEX('[',@lexpr)-1)         
		set @row=substring(@strtemp,1,charindex(':',@strtemp,1)-1)
		set @col=right(@strtemp,len(@strtemp)-len(@row)-1)
        set @strsql='update T_'+@TYPENO+'_'+@SETTABLENO+'_'+@rptno+' set c'+@col+'='+isnull(@v1,'0')+'  where rowid='+@row+' and b0110='+char(39)+@za0100+char(39)+@strwhere
        exec(@strsql)   

    --读下一检验公式
    FETCH NEXT FROM R252_cursor
	INTO @lexpr,@rexpr
end

CLOSE R252_cursor
DEALLOCATE R252_cursor

--列校验公式
--***************************
	   DECLARE temp_value CURSOR static FOR 
       select lexpr,rexpr from r253 WHERE typeno=@typeno and settableno=@settableno  and tableno=@rptno order by conditionid
       open temp_value
       fetch next from temp_value into  @lexpr,@rexpr

       while(@@FETCH_STATUS=0)
       begin
          set @lexpr='[c'+@lexpr+']'
          set @rexpr=replace(@rexpr,'[','[c')
          set @strsql='update  t_'+@TYPENO+'_'+@SETTABLENO+'_'+@rptno+ ' set '+@lexpr+'='+@rexpr+' where b0110='+char(39)+@za0100+char(39)+@strwhere
          exec(@strsql) 
          fetch next from temp_value into  @lexpr,@rexpr
       end  
       close temp_value
       deallocate temp_value

--*****************************	  

return


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE PROCEDURE gsp_modify_property 
	@forced varchar(1),
	@infoid sysname,
	@infofield sysname,
	@description varchar(100),
	@condition varchar(1000),
	@propertyset varchar(1),
	@datatype varchar(10),
	@length varchar(100),
	@decimal varchar(2),
	@defaultvalue varchar(20),
	@explain varchar(255),
	@restriction varchar(2),
	@restrictionexplain varchar(2000),
	@singleness varchar(1),
	@secondname varchar(20),
	@seconddisplay varchar(100),
	@dictionary varchar(20)
 
AS
	declare @fielddefinition varchar(100)
	declare @realylength varchar(4)


	set @realylength = case  
		--代码
		when @datatype = '1' then '20'
		--日期
		--when @datatype = '3' or @datatype = '4' or @datatype = '5' then '8'
		--邮箱，网址，目录，特殊引用，引用，常量
		when @datatype = '6' or @datatype = '7' or @datatype = '8' or @datatype = '10' or @datatype = '13' then '100'
		--颜色
		when @datatype = '9' then '4'
		--照片，多媒体，备注
		when @datatype = '11' or  @datatype = '15' or @datatype = '14' then '16'
		--其它
		else @length 
		end

	--set @realylength = dbo.field_length(cast(@infoid as varchar(20)),cast(@infofield as varchar(20)),)
	update gs_property set description = @description,
		datatype = @datatype, 
		propertyset = @propertyset,
		length = @realylength,
		decimal = @decimal,
		defaultvalue = @defaultvalue,
		condition = @condition,
		explain = @explain,
		restriction = @restriction,
		restrictionexplain = @restrictionexplain,
		singleness = @singleness,
		secondname = @secondname,
		seconddisplay = @seconddisplay,
		dictid = @dictionary
	where infoid = @infoid and infofield = @infofield;
	if exists(select * from syscolumns where((id = object_id(@infoid)) and (name = @infofield)))
	begin
		set @fielddefinition = dbo.field_definition(cast(@infoid as varchar(20)),cast(@infofield as varchar(20)))
		if @forced = '1'
		begin
			--清空数据的方式
			--execute('update ' + @infoid + ' set ' + @infofield + ' = null')

			--删除列方式
			--判断该字段是否有唯一性约束,如果有将其去掉
			if exists(select * from sysindexes where name = 'UQ_' + @infoid + '_' + @infofield)
				execute('drop index ' + @infoid + '.UQ_' + @infoid + '_' + @infofield)
			if exists(select * from sysindexes where name = 'SIMPLE_' + @infoid + '_' + @infofield)
				execute('drop index ' + @infoid + '.SIMPLE_' + @infoid + '_' + @infofield)
			--删除列
			execute('alter table ' + @infoid + ' drop column ' + @infofield )
			--添加列
			execute('alter table ' + @infoid + ' add ' + @infofield + @fielddefinition)
		end
		else
		begin
			execute('alter table ' + @infoid + ' alter column ' + @infofield + @fielddefinition)
		end

		--添加唯一性约束
		if @singleness = '1'
		begin
			if exists(select * from sysindexes where name = 'UQ_' + @infoid + '_' + @infofield)
			begin
				execute('drop index ' + @infoid + '.UQ_' + @infoid + '_' + @infofield)
			end
			--print('create unique index UQ_' + @infoid + '_' + @infofield + ' on ' + @infoid + '(' + @infofield + ')')
			execute('create unique index UQ_' + @infoid + '_' + @infofield + ' on ' + @infoid + '(' + @infofield + ')')
		end
		else
		begin --判断该字段是否有唯一性约束,如果有将其去掉
			if exists(select * from sysindexes where name = 'UQ_' + @infoid + '_' + @infofield)
				execute('drop index ' + @infoid + '.UQ_' + @infoid + '_' + @infofield)
		end
		--在引用对象中添加触发器
		if(@datatype = '12' and not @dictionary = '')
		begin
			declare @dictid varchar(1000)
			select  @dictid = dictid from gs_property where(infoid = @infoid and infofield = @infofield)
			set @dictid = left(@dictid, charindex('.',@dictid) - 1)
			execute gsp_del_ref_trigger @dictid
		end
	end


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO




CREATE PROCEDURE gsp_new_row_position 
	@sql varchar(8000)
 
AS
execute('
	declare @current bit
	declare @flag int

	declare cursor_property cursor fast_forward for ' + @sql + '
		
	open cursor_property
	fetch next from cursor_property into @current
	set @flag = 1
	while @@fetch_status = 0
	begin
		if @current = 1
		begin
			break
		end
		fetch next from cursor_property into @current
		set @flag = @flag + 1
	end
	close cursor_property
	deallocate cursor_property
	select result = @flag'
	)



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO



CREATE PROCEDURE gsp_new_scribble_object 
	@infoid sysname, 
	@objecttype varchar(20),
	@describtion varchar(100),
	@shortdesc varchar(100),
	@condition varchar(1000),
	@parentid sysname
 
AS
	declare @parent_data sysname
	declare @layer int
	--确定根节点
	declare @parent_organize sysname
	if @parentid = ''
		set @parent_organize = null
	else
		set @parent_organize = @parentid
	
	--确定状态
	declare @state bit
	if @objecttype = '2' --如果是分类对象
	begin
		set @state = 1
		set @layer = 0
		set @parent_data = null
	end
	else
	begin
		set @state = 0

		--确定数据关系上的父对象(相区别于层次结构上的)
		set @parent_data = @parentid
		if @parent_data is not null
		begin
			while 1 = 1
			begin
				if @parent_data is null break;	--如果循环到根节点,则退出
				if(select type from gs_structure where infoid = @parent_data) != 2 break;
				set @parent_data = (select parentid from gs_structure where infoid = @parent_data)
			end
		end

		--数据关系上的层数 1 为主集对象,2 为子集对象,3 为孙集对象...以此类推
		declare @parent_temp sysname
		set @parent_temp = @parentid
		set @layer = 1
		while (@parent_temp != null) and (@parent_temp != '')
		begin
			if(select type from gs_structure where infoid = @parent_temp) != 2 
				set @layer = @layer + 1
			set @parent_temp = (select parentid from gs_structure where infoid = @parent_temp)
		end
	end
	--在表 gs_structure 中插入一条记录
	insert into gs_structure(infoid,type,description,shortdesc,parentid,
		condition,state,orderno,layer,parentid1,isexistchild,secrit)
		values(@infoid,@objecttype,@describtion,@shortdesc,@parent_organize,
		@condition,@state,100,@layer,@parent_data,0,0)
	--设置 pkey
	execute gsp_check_layer_parent
	--返回新添加的草稿对象
	select * from gs_structure where infoid = @infoid



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO



CREATE PROCEDURE gsp_new_scribble_property 
	@infoid sysname,
	@infofield sysname,
	@description varchar(100),
	@condition varchar(1000),
	@propertyset varchar(1),
	@datatype varchar(10),
	@length varchar(4),
	@decimal varchar(2),
	@defaultvalue varchar(20),
	@explain varchar(255),
	@restriction varchar(2),
	@restrictionexplain varchar(200),
	@singleness varchar(1),
	@secondname varchar(20),
	@seconddisplay varchar(100),
	@dictionary varchar(20)
 
AS
	declare @realylength varchar(4)
	set @realylength = case  
		--代码
		when @datatype = '1' then '20'
		--日期
		when @datatype = '3' or @datatype = '4' or @datatype = '5' then '8'
		--邮箱，网址，目录，特殊引用，引用，常量
		when @datatype = '6' or @datatype = '7' or @datatype = '8' or @datatype = '10' or @datatype = '12' or @datatype = '13' then '100'
		--颜色
		when @datatype = '9' then '4'
		--照片，多媒体，备注
		when @datatype = '11' or  @datatype = '15' or @datatype = '14' then '16'
		--其它
		else @length 
		end
	insert into gs_property(infoid,infofield,description,datatype,length,decimal,defaultvalue,
		explain,restriction,restrictionexplain,dictid,condition,state,propertyset,
		orderno,singleness,secondname,seconddisplay) 
	values(@infoid,@infofield,@description,@datatype,@length,@decimal,@defaultvalue,
		@explain,@restriction,@restrictionexplain,@dictionary,@condition,'0',@propertyset,1000,
		@singleness,@secondname,@seconddisplay)


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO



CREATE PROCEDURE gsp_next_id 
	@infoid sysname,--要进行排序的的表
	@record varchar(1000),--WHERE 部分的 SQL 语句用于定位到一行取 ID 的值
	@where varchar(8000),--范围
	@increment int,--ID增量
	@flag bit --等于0为取上边的一个ID等于1为取下边的一个ID值
 
AS
	declare @wherea varchar(8000)
	if @where is null 
	begin
		set @where = ''
		set @wherea = ''
	end

	if rtrim(ltrim(@where)) <> ''
	begin
		set @wherea = ' where ' + @where
		set @where = @where + ' and '
	end

execute('
	declare @increment int
	set @increment = ' + @increment +  '
	declare @flag bit
	set @flag = ' + @flag + '
	declare @where varchar(1000)

	declare @currentid int
	declare @first int
	declare @last int
	declare @maxvalue int

	set @currentid = (select top 1 ' + @infoid + 'ID from ' + @infoid + ' where ' + @record + ')

	if @flag = 0
	begin
		declare zmc cursor scroll for select top 2 ' + @infoid + 'ID from ' + @infoid + 
			' where ' + @where + @infoid + 'ID >= @currentid - @increment and ' + @infoid + 
			'ID <= @currentid order by ' + @infoid + 'ID desc
		open zmc
		if @@cursor_rows = 1
		begin
			select nextid = @currentid - @increment
		end
		else if @@cursor_rows = 2
		begin
			fetch first from zmc into @first
			fetch last from zmc into @last
			select (@first + @last)/2
		end
		else
		begin
			select @maxvalue = max(' + @infoid + 'ID) from ' + @infoid + @wherea + '
			if @maxvalue is null
			begin
				select @increment
			end
			else
			begin
				select @maxvalue + @increment
			end
		end
		close zmc
		deallocate zmc
	end
	else 
	begin
		declare zmc cursor scroll for select top 2 ' + @infoid + 'ID from ' + @infoid + 
			' where ' + @where + @infoid + 'ID >= @currentid and ' + @infoid + 
			'ID <= @currentid + @increment order by ' + @infoid + 'ID
		open zmc
		if @@cursor_rows = 1
		begin
			select nextid = @currentid + @increment
		end 
		else if @@cursor_rows = 2
		begin
			fetch first from zmc into @first
			fetch last from zmc into @last
			select (@first + @last)/2
		end
		else
		begin
			select @maxvalue = max(' + @infoid + 'ID) from ' + @infoid + @wherea + '
			if @maxvalue is null
			begin
				select @increment
			end
			else
			begin
				select @maxvalue + @increment
			end
		end
		close zmc
		deallocate zmc
	end
	')


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO



CREATE PROCEDURE gsp_object_by_template 
	@infoid sysname
 
AS

declare @current sysname
declare @parent_temp sysname
declare @parentdata sysname

declare @layer int
set @layer = 0

declare @pkey varchar(1000)
set @pkey = ''

declare @type varchar(100)
select @type = type from gs_infoset where infoid = @infoid

declare @state char(1)
set @state = '1'

if @type <> '2'
begin--确定　@layer 和 @parentdata
	set @current = @infoid
	set @layer = 1
	set @state = '0'	
	while(1=1)
	begin
		--取父对象
		select @parent_temp = parentid from gs_infoset where infoid = @current
		--这儿不能改为 select @type = type from gs_infoset where infoid = @parent_temp)
		--因为当 select 没有行时不对 @type 重新赋值
		set @type = (select type from gs_infoset where infoid = @parent_temp)
		if((@type is not null) and (@type <> '2'))
		begin
			if(@parentdata is null)
			begin
				set @parentdata = @parent_temp
			end
			set @layer = @layer + 1
			set @pkey = ',' +  @current + 'ID' + @pkey
		end
		if(@parent_temp is null)
		begin
			break;
		end
		set @current = @parent_temp
	end
	set @pkey = 'ZA0100' +  @pkey
end

insert into gs_structure
(
	infoid,type,description,shortdesc,parentid,state,isexistchild,parentid1,layer,pkey
)

select 
	infoid,type,description,shortdesc,parentid,
	state = @state,isexistchild,parentid1=@parentdata,
	layer = @layer,pkey = @pkey
from gs_infoset where infoid = @infoid



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO



CREATE PROCEDURE gsp_plaster_object 
	@infoid sysname, --源对象
	@newparent sysname, --粘贴到的对象
	@newname sysname --粘贴为的（新的）名子
 
AS
	--这儿把没有新的名字视为是对象的“剪切——粘贴”
	if @newname = ''
	begin 

		--取原先的父对象
		declare @oldparent varchar(20) 
		set @oldparent = (select parentid from gs_structure where infoid = @infoid)
		
		--如果粘贴为根对象
		if @newparent =''
		begin 
			update gs_structure set parentid = null where infoid = @infoid;
		end
		--如果粘贴为子对象
		else
		begin
			update gs_structure set parentid = @newparent where infoid = @infoid
			update gs_structure set isexistchild = '1' where infoid = @newparent
		end
		if (select count(*) from gs_structure where parentid = @oldparent) = 0
		begin
			update gs_structure set isexistchild = '0' where infoid = @oldparent
		end
		set @newname = @infoid
	end
	else--这儿把有新的名字视为是对象的“复制——粘贴”
	begin  
		--拷贝对象
		if @newparent = ''
		begin
		insert into gs_structure(infoid,type,description,shortdesc, 
			parentid,isexistchild,condition,state,orderno,pkey,standbyint,standbyvarchar,constid) 
		select infoid = @newname,type,description,shortdesc,parentid = null,isexistchild = 0, 
			condition,state = 0,orderno,pkey,standbyint,standbyvarchar,constid from
			gs_structure where infoid = @infoid
		end
		else
		begin
		insert into gs_structure(infoid,type,description,shortdesc, 
			parentid,isexistchild,condition,state,orderno,pkey,standbyint,standbyvarchar,constid) 
		select infoid = @newname,type,description,shortdesc,parentid = @newparent,isexistchild = 0, 
			condition,state = 0,orderno,pkey,standbyint,standbyvarchar,constid from
			gs_structure where infoid = @infoid
		end
		--拷贝对象的属性
		insert into gs_property(infoid,infofield,description,datatype,length,decimal,
			defaultvalue,explain,restriction,restrictionexplain,dictid,condition,state,
			propertyset,orderno,singleness,secondname,seconddisplay,standbyint,standbyvarchar)
		select infoid= @newname,infofield,description,datatype,length,decimal,defaultvalue,explain,
			restriction,restrictionexplain,dictid,condition,state = 0,propertyset,orderno,
			singleness,secondname,seconddisplay,standbyint,standbyvarchar
			from gs_property where (infoid = @infoid) and (infofield not like 'Z%') and (infofield not like '%ID');
	end
	execute gsp_check_layer_parent
	select * from gs_structure where infoid = @newname


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO




CREATE PROCEDURE gsp_plaster_property 
	@oldInfoId sysname,
	@infofield sysname,
	@newInfoId sysname,
	@flag int = 0
 
AS
	if(@flag = 1)
	begin
		insert into gs_property(
			infoid,infofield,description,datatype,length,decimal,defaultvalue,explain,
			restriction,restrictionexplain,dictid,condition,state,propertyset,orderno,
			singleness,secondname,seconddisplay,standbyint,standbyvarchar)
		select infoid = @newInfoId,infofield,description,datatype,length,decimal,defaultvalue,
			explain,restriction,restrictionexplain,dictid,condition,state = 0,propertyset,
			orderno,singleness,secondname,seconddisplay,standbyint,standbyvarchar 
		from gs_property 
		where (infoid = @oldInfoId) and (infofield = @infofield)
	end
	else
	begin
		update gs_property set infoid = @newinfoid ,state = 0 where infoid = @oldinfoid and infofield = @infofield
		if exists(select name from syscolumns where id = object_id(@oldInfoId) and name = @infofield)
			execute('alter table ' + @oldInfoId + ' drop column ' + @infofield)
	end



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO



CREATE PROCEDURE gsp_reorder_id 
	@sql varchar(8000),--SQL语句
	@table sysname,--表名
	@fieldname sysname,--字段名称
	@increment int,--ID值的增量
	@flag int--为1时先对ID置负
 
AS

	execute('
	declare @incrnum int
	set @incrnum = 0
	declare @useless int
	declare @intmin int
	set @intmin = -2147483648
	declare @rowcount int
	declare @rowindex int
	declare @flag int
	set @flag = ' + @flag + '

	if @flag = 1
	begin
		declare zm_reorder_cursor cursor scroll for ' + @sql + '
		open zm_reorder_cursor
		set @rowcount = @@cursor_rows
		set @rowindex = 0
		fetch first from zm_reorder_cursor into @useless
		while @rowindex < @rowcount
		begin
			update ' + @table + ' set ' + @fieldname + ' = @intmin where current of zm_reorder_cursor
			fetch next from zm_reorder_cursor into @useless
			set @rowindex = @rowindex + 1
			set @intmin = @intmin + 1
		end
		close zm_reorder_cursor
		deallocate zm_reorder_cursor
	end

	declare zm_reorder_cursor cursor scroll for ' + @sql + '
	open zm_reorder_cursor
	set @rowcount = @@cursor_rows
	fetch first from zm_reorder_cursor into @useless
	set @incrnum = 0
	set @rowindex = 0
	while @rowindex < @rowcount
	begin
		set @incrnum = 	@incrnum + ' + @increment + '
		update ' + @table + ' set ' + @fieldname + ' = @incrnum where current of zm_reorder_cursor
		fetch next from zm_reorder_cursor into @useless
		set @rowindex = @rowindex + 1
	end

	close zm_reorder_cursor
	deallocate zm_reorder_cursor
	')


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO



CREATE PROCEDURE gsp_row_position 
	@sql varchar(8000)
 
AS
execute('
	declare @current bit
	declare @flag int

	declare cursor_property cursor fast_forward for ' + @sql + '
		
	open cursor_property
	fetch next from cursor_property into @current
	set @flag = 1
	while @@fetch_status = 0
	begin
		if @current = 1
		begin
			break
		end
		fetch next from cursor_property into @current
		set @flag = @flag + 1
	end
	close cursor_property
	deallocate cursor_property
	select result = @flag'
	)


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO





CREATE   procedure gsp_salaryAdjust
@SalaryNo varchar(20),
@strCondition varchar(2000)
 
 as 

SET QUOTED_IDENTIFIER OFF  
declare @standid int
declare @type varchar(10)

declare curs_gwmc1 cursor for 
select as0203,as0202 from as02 where za0100=@SalaryNo and as0202 in ('001','002') order by as02id
open curs_gwmc1

        fetch next from  curs_gwmc1 into @standid,@type
	  while(@@fetch_status=0)
  	  begin
             if @type='001' --为标准表
                EXECUTE flxp_salary_standcompute 'AA01',@standid,@strCondition
             else           --为计算公式
                 EXECUTE flxp_info_dealformula @standid,@strCondition
	      fetch next from  curs_gwmc1 into  @standid,@type
	   end

           close Curs_gwmc1
	   deallocate Curs_gwmc1

SET QUOTED_IDENTIFIER on





GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO



CREATE procedure gsp_secret_table
	@table sysname,
	@flag int = 0
 
as
	declare @secrettable sysname;
	set @secrettable = @table + '_B';
	if @flag = 0
	begin
		declare @temptable sysname;
		set @temptable = 'temp_zm_' + @table;
		declare @field sysname
		declare @fields varchar(1000)
	
		
		if exists (select * from sysobjects where id = object_id(@secrettable) and objectproperty(id, N'isusertable') = 1)
		begin --如果暗表已经存在
			--建立临时的新表
			execute('select top 0 * into ' + @temptable + ' from ' + @table);
			execute('alter table '+ @temptable + ' add ZC9994 char(1) null');
			
	
			--确定原表主键字符串
			declare fieldstring cursor forward_only for 
			select syscolumns.name
			from sysobjects inner join
			      sysindexes on sysobjects.name = sysindexes.name inner join
			      sysindexkeys on sysindexes.indid = sysindexkeys.indid inner join
			      syscolumns on sysindexkeys.colid = syscolumns.colid
			where (sysobjects.xtype = 'pk') and (sysobjects.parent_obj = object_id(@table)) and 
			      (sysindexkeys.id = object_id(@table)) and (syscolumns.id = object_id(@table))
			
			open fieldstring
			fetch next from fieldstring into @fields
			while 0 = 0
			begin 
				fetch next from fieldstring into @field
				if @@fetch_status != 0 	break;
				set @fields = @fields + ',' + @field
			end 
			close fieldstring 
			deallocate fieldstring 
			--如果主键不为空则为新表建主键
			if not @fields is null
				exec('alter table ' + @temptable + ' add primary key clustered (' + @fields + ')')
			
			
	
			--生成复制数据字段列表
			declare fieldstring cursor forward_only for 
			select syscolumns.name
			from syscolumns inner join
			      syscolumns syscolumns_1 on 
			      syscolumns.name = syscolumns_1.name
			where (syscolumns.id = object_id(@secrettable)) and (syscolumns_1.id = object_id(@temptable))
			
			open fieldstring
			fetch next from fieldstring into @fields
			while 0 = 0
			begin 
				fetch next from fieldstring into @field
				if @@fetch_status != 0 	break;
				set @fields = @fields + ',' + @field
			end 
			close fieldstring 
			deallocate fieldstring 
			
			execute('insert into ' + @temptable + '(' + @fields + ') select ' + @fields + ' from ' + @secrettable)
	
			--删除拷贝完数据的旧的暗表
			execute('drop table ' + @secrettable);
			--更改新表的表名为暗表格式
			execute('sp_rename '+ @temptable +','+ @secrettable);
		end
		else
		begin
			execute('select top 0 * into dbo.' + @secrettable + ' from ' + @table);
			execute('alter table '+ @secrettable + ' add ZC9994 char(1) null');
			--确定原表主键字符串
			declare fieldstring cursor forward_only for 
			select syscolumns.name
			from sysobjects inner join
			      sysindexes on sysobjects.name = sysindexes.name inner join
			      sysindexkeys on sysindexes.indid = sysindexkeys.indid inner join
			      syscolumns on sysindexkeys.colid = syscolumns.colid
			where (sysobjects.xtype = 'pk') and (sysobjects.parent_obj = object_id(@table)) and 
			      (sysindexkeys.id = object_id(@table)) and (syscolumns.id = object_id(@table))
			
			open fieldstring
			fetch next from fieldstring into @fields
			while 0 = 0
			begin 
				fetch next from fieldstring into @field
				if @@fetch_status != 0 	break;
				set @fields = @fields + ',' + @field
			end 
			close fieldstring 
			deallocate fieldstring 
			--如果主键不为空则为新表建主键
			if not @fields is null
				exec('alter table ' + @secrettable + ' add primary key clustered (' + @fields + ')')
			--设置暗表标记
		end
		update gs_structure set secrit = 1 where infoid = @table
	end
	else if @flag = 1
	begin
		if exists (select * from sysobjects where id = object_id(@secrettable) and objectproperty(id, N'IsUserTable') = 1)
			execute('drop table ' + @secrettable)
		update gs_structure set secrit = 0 where infoid = @table
	end
	if upper(@table)='AA58'
		exec gsp_secret_table_c @table,0

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO



CREATE procedure gsp_secret_table_c
	@table sysname,
	@flag int = 0
 
as
	declare @secrettable sysname;
	set @secrettable = @table + '_C';
	if @flag = 0
	begin
		declare @temptable sysname;
		set @temptable = 'temp_zm_' + @table;
		declare @field sysname
		declare @fields varchar(1000)
	
		
		if exists (select * from sysobjects where id = object_id(@secrettable) and objectproperty(id, N'isusertable') = 1)
		begin --如果暗表已经存在
			--建立临时的新表
			execute('select top 0 * into ' + @temptable + ' from ' + @table);
			--execute('alter table '+ @temptable + ' add ZC9994 char(1) null');
			
	
			--确定原表主键字符串
			declare fieldstring cursor forward_only for 
			select syscolumns.name
			from sysobjects inner join
			      sysindexes on sysobjects.name = sysindexes.name inner join
			      sysindexkeys on sysindexes.indid = sysindexkeys.indid inner join
			      syscolumns on sysindexkeys.colid = syscolumns.colid
			where (sysobjects.xtype = 'pk') and (sysobjects.parent_obj = object_id(@table)) and 
			      (sysindexkeys.id = object_id(@table)) and (syscolumns.id = object_id(@table))
			
			open fieldstring
			fetch next from fieldstring into @fields
			while 0 = 0
			begin 
				fetch next from fieldstring into @field
				if @@fetch_status != 0 	break;
				set @fields = @fields + ',' + @field
			end 
			close fieldstring 
			deallocate fieldstring 
			--如果主键不为空则为新表建主键
			if not @fields is null
				exec('alter table ' + @temptable + ' add primary key clustered (' + @fields + ')')
			
			
	
			--生成复制数据字段列表
			declare fieldstring cursor forward_only for 
			select syscolumns.name
			from syscolumns inner join
			      syscolumns syscolumns_1 on 
			      syscolumns.name = syscolumns_1.name
			where (syscolumns.id = object_id(@secrettable)) and (syscolumns_1.id = object_id(@temptable))
			
			open fieldstring
			fetch next from fieldstring into @fields
			while 0 = 0
			begin 
				fetch next from fieldstring into @field
				if @@fetch_status != 0 	break;
				set @fields = @fields + ',' + @field
			end 
			close fieldstring 
			deallocate fieldstring 
			
			execute('insert into ' + @temptable + '(' + @fields + ') select ' + @fields + ' from ' + @secrettable)
	
			--删除拷贝完数据的旧的暗表
			execute('drop table ' + @secrettable);
			--更改新表的表名为暗表格式
			execute('sp_rename '+ @temptable +','+ @secrettable);
		end
		else
		begin
			execute('select top 0 * into dbo.' + @secrettable + ' from ' + @table);
			--execute('alter table '+ @secrettable + ' add ZC9994 char(1) null');
			--确定原表主键字符串
			declare fieldstring cursor forward_only for 
			select syscolumns.name
			from sysobjects inner join
			      sysindexes on sysobjects.name = sysindexes.name inner join
			      sysindexkeys on sysindexes.indid = sysindexkeys.indid inner join
			      syscolumns on sysindexkeys.colid = syscolumns.colid
			where (sysobjects.xtype = 'pk') and (sysobjects.parent_obj = object_id(@table)) and 
			      (sysindexkeys.id = object_id(@table)) and (syscolumns.id = object_id(@table))
			
			open fieldstring
			fetch next from fieldstring into @fields
			while 0 = 0
			begin 
				fetch next from fieldstring into @field
				if @@fetch_status != 0 	break;
				set @fields = @fields + ',' + @field
			end 
			close fieldstring 
			deallocate fieldstring 
			--如果主键不为空则为新表建主键
			if not @fields is null
				exec('alter table ' + @secrettable + ' add primary key clustered (' + @fields + ')')
			--设置暗表标记
		end
		update gs_structure set secrit = 1 where infoid = @table
	end
	else if @flag = 1
	begin
		if exists (select * from sysobjects where id = object_id(@secrettable) and objectproperty(id, N'IsUserTable') = 1)
			execute('drop table ' + @secrettable)
		update gs_structure set secrit = 0 where infoid = @table
	end

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO



CREATE PROCEDURE gsp_seek_data 
	@sqlstring varchar(8000),
	@rowindex int,
	@rowcount int
 
AS
execute('
	declare @rowscount int
	set @rowscount = 1
	declare fzhy cursor scroll for ' + @sqlstring + '
	open fzhy
	if @@cursor_rows >= ' + @rowindex + '
	begin--如果游标的行数大于或等于开始数
		fetch absolute ' + @rowindex + ' from fzhy
		while @rowscount < ' + @rowcount + ' and @@fetch_status = 0
		begin	
			set @rowscount = @rowscount + 1
			if @rowscount + ' + @rowindex + ' -1 <= @@cursor_rows
			begin
				fetch next from fzhy
			end
		end
	end
	close fzhy
	deallocate fzhy
	')


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO















--检查表间校验公式，返回未通过的检验公式
CREATE     procedure dbo.gsp_tablecheck
      @typeno varchar(20),--类别
      @settableno varchar(20),--套表
      @za0100 varchar(20),--单元编码
     @starttime varchar(10),--统计时间
      @revalue  varchar(8000)  OUT
 
as
	SET NOCOUNT ON
	SET QUOTED_IDENTIFIER off

declare @v1 varchar(20)--左表达式值
declare @v2 varchar(20)--右表达式值
declare @strwhere varchar(200) --时间条件和当前条件


declare @lexpr varchar(200)--左表达式
declare @rexpr varchar(200)--右表达式
declare @lexpr1 varchar(200)--左表达式
declare @rexpr1 varchar(200)--右表达式
declare @opsign varchar(2)------比较符

declare @strsql varchar(200)--生成临时sql语句
declare @strtemp varchar(200)--检验公式
declare @value varchar(20) --临时值
declare @tabno  varchar(20) --检验公式所在表的表表号
declare @lefttabno  varchar(20) --检验公式所在表的表表号
declare @row  varchar(20)   --单元格的行
declare @col  varchar(20)  --单元格的列
declare @cTableNo varchar(20)
declare @cTableName varchar(200)
declare @strtabchk varchar(500)
declare @tval int   
 


--把检验公式导入时间表中，处理后可将检验达式直接替换成实际值
SELECT lexpr,opsign,rexpr,lexpr lexpr1,rexpr rexpr1,tableno into #check
FROM r241
WHERE typeno=@typeno and settableno=@settableno
ORDER BY conditionid

--把要校验的表设为未通过
update  r220 set checkpass='00' where isnull(checkpass,'')=''
update  r220 set checkpass=substring(checkpass,1,1)+'0' where typeno=@typeno and settableno=@settableno and zb0110=@za0100 and  zc9993='1'



if  isnull(@starttime,'')=''
   set @strwhere=" and  zc9993='1'"
else
   set @strwhere="  and starttime='"+@starttime +char(39)



DECLARE r241_cursor CURSOR FOR
SELECT lexpr,rexpr,tableno
FROM #check for update


OPEN r241_cursor
FETCH NEXT FROM r241_cursor 
INTO @lexpr,@rexpr,@lefttabno

--读取所有的检验公式
WHILE @@FETCH_STATUS = 0
BEGIN
  if  isnull(@lexpr,'')<>'' and isnull(@rexpr,'')<>''
    begin
             ---取左检验公式
	while(charindex('[',@lexpr)<>0) --检验公式可能有多个式如：[2：2：1]+[4：5：32]
	begin
         
   	   set @tval=0
	   select @tval=3 where  @lexpr like '%:%:%'

	   if @tval=3
	       begin	
	          set @strtemp= substring(@lexpr,CHARINDEX('[',@lexpr)+1,CHARINDEX(']',@lexpr)-CHARINDEX('[',@lexpr)-1)         
	          set @tabno=LEFT(@strtemp,CHARINDEX(':',@strtemp)-1)
		  set @row=substring(@strtemp,len(@tabno)+2,charindex(':',@strtemp,len(@tabno)+2)-len(@tabno)-2)                  
	          set @col=right(@strtemp,len(@strtemp)-len(@tabno)-len(@row)-2)
                  set @tabno=@lefttabno    
	        end
           else
	      begin	
                 set @tabno=@lefttabno 
 		 set @strtemp= substring(@lexpr,CHARINDEX('[',@lexpr)+1,CHARINDEX(']',@lexpr)-CHARINDEX('[',@lexpr)-1)         
		 set @row=LEFT(@strtemp,CHARINDEX(':',@strtemp)-1)
		 set @col=replace(@strtemp,@row+':','')                  
              end
           
	   --从应用表中取实际值
	   set @strsql='SELECT c'+@col+' FROM T'+@TYPENO+'_'+@SETTABLENO+'_'+@tabno+' where rowid='+@row+' and zb0110='+char(39)+@za0100+char(39)+@strwhere
	   set @strsql='DECLARE temp_value CURSOR FOR '+@strsql
	   
	   
   	    set @value=null
	    exec(@strsql)
	    open temp_value
	    if @@error=0
	    begin
			fetch next from temp_value into @value
    		if @@FETCH_STATUS <> 0
			set @value=null

			close temp_value
			deallocate temp_value
		end
        set @lexpr=replace(@lexpr,'['+@strtemp+']',@value)
        
	end

             ---取右检验公式
	while(charindex('[',@rexpr)<>0)
	begin
	   set @strtemp= substring(@rexpr,CHARINDEX('[',@rexpr)+1,CHARINDEX(']',@rexpr)-CHARINDEX('[',@rexpr)-1)         
                set @tabno=LEFT(@strtemp,CHARINDEX(':',@strtemp)-1)
	   set @row=substring(@strtemp,len(@tabno)+2,charindex(':',@strtemp,len(@tabno)+2)-len(@tabno)-2)                  
                set @col=right(@strtemp,len(@strtemp)-len(@tabno)-len(@row)-2)
	 
                     set @strsql='SELECT c'+@col+' FROM T'+@TYPENO+'_'+@SETTABLENO+'_'+@tabno+' where rowid='+@row+' and zb0110='+char(39)+@za0100+char(39)+@strwhere
	        set @strsql='DECLARE temp_value CURSOR FOR '+@strsql

	        set @value=null
	        exec(@strsql)
	        open temp_value
	        if @@error=0
	        begin
				fetch next from temp_value into @value
				if @@FETCH_STATUS <> 0
					set @value=null
				close temp_value
				deallocate temp_value
			end
           set @rexpr=replace(@rexpr,'['+@strtemp+']',@value)
	end
    
     --通过游标读取左式的值
     set @v1=null
     set @v2=null
     if isnull(@lexpr,'')<>'' and isnull(@rexpr,'')<>'' 
      begin
		set @strsql="DECLARE temp_lexpr CURSOR static FOR select "+@lexpr+","+@rexpr
		exec(@strsql)
		open temp_lexpr
		fetch next from temp_lexpr into @v1,@v2
		CLOSE temp_lexpr

		DEALLOCATE temp_lexpr
      end 

 
--更新临时表中的检验公式为实际值       
        UPDATE #check SET lexpr=replace(@v1,' ','') ,rexpr=replace(@v2,' ','')
	WHERE CURRENT OF r241_cursor
 end
 else
        UPDATE #check SET lexpr=null ,rexpr=null WHERE CURRENT OF R242_cursor
    FETCH NEXT FROM r241_cursor
    INTO @lexpr,@rexpr,@lefttabno
end

CLOSE r241_cursor
DEALLOCATE r241_cursor



delete from #check where ((isnull(lexpr,'')<>'' and  isnull(rexpr,'')<>'') and (opsign='=' and cast(lexpr as float)=cast(rexpr as float)) or (opsign='>'   and cast(lexpr as float)>cast(rexpr as float)) or (opsign='>=' and cast(lexpr as float)>=cast(rexpr as float)) or (opsign='<=' and cast(lexpr as float)<=cast(rexpr as float)) or (opsign='<' and cast(lexpr as float)<cast(rexpr as float)))


update  r220 set checkpass=substring(checkpass,1,1)+'1' where typeno=@typeno and settableno=@settableno  and zb0110=@za0100 and  zc9993='1'  and tableno not in (select substring(lexpr1,CHARINDEX('[',lexpr1)+1,CHARINDEX(':',lexpr1)-2) from #check)
--set @strsql="update  r220 set checkpass=substring(checkpass,1,1)+'1' where typeno="+@typeno+" and settableno="+@settableno +"  and zb0110="+@za0100+" and  zc9993='1'  and tableno not in (select substring(lexpr1,CHARINDEX('[',lexpr1)+1,CHARINDEX(':',lexpr1)-2) from #check) "




--取检验未通过的检验项
  dECLARE temp_export CURSOR FOR  select lexpr,opsign,rexpr,lexpr1,rexpr1,
    tableno,(select name from r200 where typeno=@typeno and settableno=@settableno and r200.tableno=#check.tableno) from #check order by tableno
                                  
    open temp_export
    FETCH NEXT FROM temp_export
    INTO @lexpr,@opsign,@rexpr,@lexpr1,@rexpr1,@tabno,@cTableName
set @revalue=''
set @cTableNo=''
WHILE @@FETCH_STATUS = 0
BEGIN
      set @strtabchk='==================================================='
      set @strtabchk=@strtabchk+char(13)+@tabno+' : '+@cTableName
      set @strtabchk=@strtabchk+char(13)+'==================================================='
      if @cTableNo<>@tabno
      begin
	set @revalue =@revalue+char(13)+@strtabchk+char(13)	
      end
    if isnull(@lexpr,'')<>'' and isnull(@rexpr,'')<>'' 
      begin
        set   @revalue =@revalue+'表间校验公式:'+char(13)+@lexpr1+@opsign+@rexpr1+char(13)+@lexpr+@opsign+@rexpr+char(13)
      end
    else
      begin
        set   @revalue =@revalue+'***** '+'校验公式:'+@lexpr1+@opsign+@rexpr1+"出错"+char(13)
      end
    set @cTableNo=@tabno
    FETCH NEXT FROM temp_export
    INTO @lexpr,@opsign,@rexpr,@lexpr1,@rexpr1,@tabno,@cTableName
--  INTO @lexpr,@opsign,@rexpr,@rexpr1,@rexpr1
end
CLOSE temp_export
DEALLOCATE temp_export
return














GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO





--表间计算公式
CREATE procedure dbo.gsp_tableformula
      @typeno varchar(20),--类别
      @settableno varchar(20),--套表
       @tableno  varchar(20),--表
      @za0100 varchar(20),--单位编码
      @starttime varchar(10)--统计时间
 
as
	SET NOCOUNT ON
	SET QUOTED_IDENTIFIER off


declare @v1 varchar(20)--左表达式值
declare @v2 varchar(20)--右表达式值
declare @strwhere varchar(200) --时间条件和当前条件


declare @lexpr varchar(200)--左表达式
declare @rexpr varchar(200)--右表达式
--declare @lexpr1 varchar(200)--左表达式
--declare @rexpr1 varchar(200)--右表达式
--declare @opsign varchar(2)------比较符

declare @strsql varchar(200)--生成临时sql语句
declare @strtemp varchar(200)--检验公式
declare @value varchar(20) --临时值
declare @tabno  varchar(20) --检验公式所在表的表表号
declare @row  varchar(20)   --单元格的行
declare @col  varchar(20)  --单元格的列
 



if  isnull(@starttime,'')=''
   set @strwhere=" and  zc9993='1'"
else
  set   @strwhere="  and starttime='"+@starttime +char(39)


DECLARE r241_cursor CURSOR FOR 
SELECT lexpr,rexpr
FROM r251
WHERE typeno=@typeno  and settableno=@settableno and tableno=@tableno



OPEN r241_cursor
FETCH NEXT FROM r241_cursor 
INTO @lexpr,@rexpr


--读取所有的计算公式
WHILE @@FETCH_STATUS = 0
BEGIN

	 --计算公式右式如：[2：2：1]+[4：5：32]

             ---取右检验公式
	while(charindex('[',@rexpr)<>0)
	begin
	   set @strtemp= substring(@rexpr,CHARINDEX('[',@rexpr)+1,CHARINDEX(']',@rexpr)-CHARINDEX('[',@rexpr)-1)         
                set @tabno=LEFT(@strtemp,CHARINDEX(':',@strtemp)-1)
	   set @row=substring(@strtemp,len(@tabno)+2,charindex(':',@strtemp,len(@tabno)+2)-len(@tabno)-2)                  
                set @col=right(@strtemp,len(@strtemp)-len(@tabno)-len(@row)-2)
	 
                     set @strsql='SELECT c'+@col+' FROM T_'+@TYPENO+'_'+@SETTABLENO+'_'+@tabno+' where rowid='+@row+' and b0110='+char(39)+@za0100+char(39)+@strwhere
	        set @strsql='DECLARE temp_value CURSOR FOR '+@strsql
	        exec(@strsql)
	        open temp_value
	        fetch next from temp_value into @value
     	        close temp_value
	        deallocate temp_value
                     --将检验公式的某一项替换成值，空值时为0
                    set @rexpr=replace(@rexpr,'['+@strtemp+']',isnull(@value,'0'))
	end
     --计算检验公式右式的值 
     set @v2='0'
     if isnull(@rexpr,'')<>'' 
      begin
	set @strsql='dECLARE temp_rexpr CURSOR FOR select '+ @rexpr
	exec(@strsql)
	open temp_rexpr
	fetch next from temp_rexpr into @v2
	CLOSE temp_rexpr
	DEALLOCATE temp_rexpr
      end

	   set @strtemp= replace(replace(@lexpr,'[',''),']','')
                set @tabno=@tableno
                 set @row=LEFT(@strtemp,CHARINDEX(':',@strtemp)-1)
                 set @col=right(@strtemp,len(@strtemp)-len(@row)-1)

	   --从应用表中取实际值
	  set @strsql='update  T_'+@TYPENO+'_'+@SETTABLENO+'_'+@tabno +' set c'+@col+'='+@v2+' where rowid='+@row+' and b0110='+char(39)+@za0100+char(39)+@strwhere
	   exec(@strsql)




--更新临时表中的检验公式为实际值       

    FETCH NEXT FROM r241_cursor
    INTO @lexpr,@rexpr
end

CLOSE r241_cursor
DEALLOCATE r241_cursor

return


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO




CREATE PROCEDURE  sp_Createjianpin
 @sourceChar varchar(2000),
 @resultChar varchar(2000) output
 
AS
 declare @CharLen int
 declare @resultTempChar varchar(2000)
declare @pp varchar(10)
 set @resultTempChar=''
 set @CharLen=len(@sourceChar)
while(@CharLen=0)
	begin
		set @pp=(select top 1 dp0102 from dp01 where za0101=substring(@sourcechar,len(@sourcechar)-@charlen+1,1))
		set @resulttempchar=@resulttempchar+isnull(@pp,'')
		set @CharLen=@CharLen-1
  	end
set @resultChar =@resulttempchar



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO






CREATE   PROCEDURE sp_GetMaxRptNo   @MaxRptNo int out 
 
 AS
declare @RptNo int
select @RptNo=isnull(max(RptNo),0)+1 from R401
 set @MaxRptNo=@RptNo
  return @RptNo



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO




--单元格检验公式处理，返回检验未通过的校验公式
CREATE    procedure dbo.sp_cellcheck
      @typeno varchar(20),--类别
      @settableno varchar(20),--套表
      @rptno      varchar(20),--报表表号
      @za0100 varchar(20),--单元编码
      @revalue  varchar(8000)  OUT
 
as
	SET NOCOUNT ON
	SET QUOTED_IDENTIFIER off

declare @v1 varchar(20)--左表达式值
declare @v2 varchar(20)--右表达式值

declare @lexpr varchar(200)--左表达式
declare @rexpr varchar(200)--右表达式
declare @lexpr1 varchar(200)--左表达式
declare @rexpr1 varchar(200)--右表达式
declare @opsign varchar(2)------比较符
--declare @tableno varchar(20) ----------表号

declare @strsql varchar(500)--生成临时sql语句
declare @strtemp varchar(500)--存检验公式
declare @value varchar(20)  --临时值
declare @tabno  varchar(20)--检验公式所在的表
declare @row  varchar(20) --单元格行
declare @col  varchar(20) --单元格列


--表R244存放单元格检验公式
--先生成临时表结构
SELECT tableno,lexpr,opsign,rexpr,lexpr lexpr1,rexpr rexpr1 into #check  FROM R244 WHERE 1=2

--向临时表中插入数据
if isnull(@rptno,'')=''
    set @strsql='INSERT into #check SELECT tableno, lexpr,opsign,rexpr,lexpr lexpr1,rexpr rexpr1   FROM R244  WHERE typeno='+@typeno +' and settableno='+@settableno
else
   set @strsql='insert into #check SELECT tableno,lexpr,opsign,rexpr,lexpr lexpr1,rexpr rexpr1  FROM R244  WHERE typeno='+@typeno +' and settableno=' + @settableno +' and tableno='+@rptno

exec(@strsql)

--读取每个检验公式
DECLARE R244_cursor CURSOR FOR SELECT lexpr,rexpr,tableno  FROM #check for update 

OPEN R244_cursor

FETCH NEXT FROM R244_cursor 
INTO @lexpr,@rexpr,@tabno

--循环处理每个一检验公式
WHILE @@FETCH_STATUS = 0
BEGIN
	while(charindex('[',@lexpr)<>0)
	begin
                --读取左检验公式
	        set @strtemp= substring(@lexpr,CHARINDEX('[',@lexpr)+1,CHARINDEX(']',@lexpr)-CHARINDEX('[',@lexpr)-1)         
		set @row=substring(@strtemp,1,charindex(':',@strtemp,1)-1)
		set @col=right(@strtemp,len(@strtemp)-len(@row)-1)
		set @strsql='SELECT c'+@col+' FROM T_'+@TYPENO+'_'+@SETTABLENO+'_'+@tabno+' where rowid='+@row+' and b0110='+char(39)+@za0100+char(39)
		        set @strsql='DECLARE temp_value CURSOR FOR '+@strsql
		        exec(@strsql)
		        open temp_value
		        fetch next from temp_value into @value
		        close temp_value
		        deallocate temp_value
	                set @lexpr=replace(@lexpr,'['+@strtemp+']',isnull(@value,'0'))
	end

	while(charindex('[',@rexpr)<>0)
	begin
                --读取右检验公式
	     set @strtemp= substring(@rexpr,CHARINDEX('[',@rexpr)+1,CHARINDEX(']',@rexpr)-CHARINDEX('[',@rexpr)-1)         
      	     set @row=substring(@strtemp,1,charindex(':',@strtemp,1)-1)
	     set @col=right(@strtemp,len(@strtemp)-len(@row)-1)
  	     set @strsql='SELECT c'+@col+' FROM T_'+@TYPENO+'_'+@SETTABLENO+'_'+@tabno+' where rowid='+@row+' and b0110='+char(39)+@za0100+char(39)

	        set @strsql='DECLARE temp_value CURSOR FOR '+@strsql
	        exec(@strsql)
	        open temp_value
	        fetch next from temp_value into @value
	        close temp_value
	        deallocate temp_value

           set @rexpr=replace(@rexpr,'['+@strtemp+']',isnull(@value,'0'))
  end
     --通过游标读取左式的值
     set @v1='0'
     if isnull(@lexpr,'')<>'' 
      begin
	set @strsql='DECLARE temp_lexpr CURSOR FOR select '+@lexpr
	exec(@strsql)
	open temp_lexpr
	fetch next from temp_lexpr into @v1
	CLOSE temp_lexpr
	DEALLOCATE temp_lexpr
      end 
     --通过游标读取右式的值
     set @v2='0'
     if isnull(@rexpr,'')<>'' 
      begin
	set @strsql='dECLARE temp_rexpr CURSOR FOR select '+ @rexpr
	exec(@strsql)
	open temp_rexpr
	fetch next from temp_rexpr into @v2
	CLOSE temp_rexpr
	DEALLOCATE temp_rexpr
      end
--更新临时表，将左式及右式的值赋到数据库中       
        UPDATE #check SET lexpr=replace(@v1,' ','') ,rexpr=replace(@v2,' ','')
	WHERE CURRENT OF R244_cursor
        --读下一检验公式
        FETCH NEXT FROM R244_cursor
	INTO @lexpr,@rexpr,@tabno
end

CLOSE R244_cursor
DEALLOCATE R244_cursor

--读取检验未通过的检验公式
dECLARE temp_export CURSOR FOR 
  select lexpr,opsign,rexpr,lexpr1, rexpr1 from #check where not ((opsign='=' and lexpr=rexpr) or (opsign='>' 
                                and lexpr>rexpr) or (opsign='>=' and lexpr>=rexpr)
                                or (opsign='<=' and lexpr<=rexpr) or (opsign='<' and lexpr<rexpr) 
                                or (opsign='<>' and lexpr<>rexpr)   )

    open temp_export
    FETCH NEXT FROM temp_export
    INTO @lexpr,@opsign,@rexpr,@rexpr1,@rexpr1

WHILE @@FETCH_STATUS = 0
BEGIN
set   @revalue =@revalue+@tabno+'表单元格校验公式:'+char(13)+@rexpr1+@opsign+@rexpr1+char(13)+@lexpr+@opsign+@rexpr+char(13)
    FETCH NEXT FROM temp_export
    INTO @lexpr,@opsign,@rexpr,@rexpr1,@rexpr1
end
CLOSE temp_export
DEALLOCATE temp_export
return



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO




--检查表间校验公式，返回未通过的检验公式
CREATE procedure dbo.sp_tcheck
      @typeno varchar(20),--类别
      @settableno varchar(20),--套表
      @za0100 varchar(20),--单元编码
      @revalue  varchar(8000)  OUT
 
as

             SET NOCOUNT ON
	SET QUOTED_IDENTIFIER off

declare @v1 varchar(20)--左表达式值
declare @v2 varchar(20)--右表达式值

declare @lexpr varchar(200)--左表达式
declare @rexpr varchar(200)--右表达式
declare @lexpr1 varchar(200)--左表达式
declare @rexpr1 varchar(200)--右表达式
declare @opsign varchar(2)------比较符

declare @strsql varchar(200)--生成临时sql语句
declare @strtemp varchar(200)--检验公式
declare @value varchar(20) --临时值
declare @tabno  varchar(20) --检验公式所在表的表表号
declare @row  varchar(20)   --单元格的行
declare @col  varchar(20)  --单元格的列
 

--把检验公式导入时间表中，处理后可将检验达式直接替换成实际值
SELECT lexpr,opsign,rexpr,lexpr lexpr1,rexpr rexpr1 into #check
FROM r241
WHERE typeno=@typeno --and settableno=@settableno
ORDER BY conditionid




DECLARE r241_cursor CURSOR FOR 
SELECT lexpr,rexpr
FROM #check for update


OPEN r241_cursor
FETCH NEXT FROM r241_cursor 
INTO @lexpr,@rexpr

--读取所有的检验公式
WHILE @@FETCH_STATUS = 0
BEGIN
             ---取左检验公式
	while(charindex('[',@lexpr)<>0) --检验公式可能有多个式如：[2：2：1]+[4：5：32]
	begin
	   set @strtemp= substring(@lexpr,CHARINDEX('[',@lexpr)+1,CHARINDEX(']',@lexpr)-CHARINDEX('[',@lexpr)-1)         
                set @tabno=LEFT(@strtemp,CHARINDEX(':',@strtemp)-1)
	   set @row=substring(@strtemp,len(@tabno)+2,charindex(':',@strtemp,len(@tabno)+2)-len(@tabno)-2)                  
                set @col=right(@strtemp,len(@strtemp)-len(@tabno)-len(@row)-2)
	   --从应用表中取实际值
	   set @strsql='SELECT c'+@col+' FROM T_'+@TYPENO+'_'+@SETTABLENO+'_'+@tabno+' where rowid='+@row+' and b0110='+char(39)+@za0100+char(39)
	   set @strsql='DECLARE temp_value CURSOR FOR '+@strsql
	   exec(@strsql)
	        open temp_value
	        fetch next from temp_value into @value
	        close temp_value
	        deallocate temp_value
                --将检验公式的某一项替换成值，空值时为0
                set @lexpr=replace(@lexpr,'['+@strtemp+']',isnull(@value,'0'))
	end

             ---取右检验公式
	while(charindex('[',@rexpr)<>0)
	begin
	   set @strtemp= substring(@rexpr,CHARINDEX('[',@rexpr)+1,CHARINDEX(']',@rexpr)-CHARINDEX('[',@rexpr)-1)         
                set @tabno=LEFT(@strtemp,CHARINDEX(':',@strtemp)-1)
	   set @row=substring(@strtemp,len(@tabno)+2,charindex(':',@strtemp,len(@tabno)+2)-len(@tabno)-2)                  
                set @col=right(@strtemp,len(@strtemp)-len(@tabno)-len(@row)-2)
	 
                     set @strsql='SELECT c'+@col+' FROM T_'+@TYPENO+'_'+@SETTABLENO+'_'+@tabno+' where rowid='+@row+' and b0110='+char(39)+@za0100+char(39)
	        set @strsql='DECLARE temp_value CURSOR FOR '+@strsql
	        exec(@strsql)
	        open temp_value
	        fetch next from temp_value into @value
     	        close temp_value
	        deallocate temp_value
                     --将检验公式的某一项替换成值，空值时为0
                    set @rexpr=replace(@rexpr,'['+@strtemp+']',isnull(@value,'0'))
	end
     --计算检验公式左式的值 
     set @v2='0'
     if isnull(@lexpr,'')<>'' 
      begin
	set @strsql='DECLARE temp_lexpr CURSOR FOR select '+@lexpr
	exec(@strsql)
	open temp_lexpr
	fetch next from temp_lexpr into @v1
	CLOSE temp_lexpr
	DEALLOCATE temp_lexpr
      end 
     --计算检验公式右式的值 
     set @v2='0'
     if isnull(@rexpr,'')<>'' 
      begin
	set @strsql='dECLARE temp_rexpr CURSOR FOR select '+ @rexpr
	exec(@strsql)
	open temp_rexpr
	fetch next from temp_rexpr into @v2
	CLOSE temp_rexpr
	DEALLOCATE temp_rexpr
      end
--更新临时表中的检验公式为实际值       
        UPDATE #check SET lexpr=replace(@v1,' ','') ,rexpr=replace(@v2,' ','')
	WHERE CURRENT OF r241_cursor

    FETCH NEXT FROM r241_cursor
    INTO @lexpr,@rexpr
end

CLOSE r241_cursor
DEALLOCATE r241_cursor

--取检验未通过的检验项
dECLARE temp_export CURSOR FOR 
  select lexpr,opsign,rexpr,lexpr1, rexpr1 from #check where not ((opsign='=' and lexpr=rexpr) or (opsign='>' 
                                and lexpr>rexpr) or (opsign='>=' and lexpr>=rexpr)
                                or (opsign='<=' and lexpr<=rexpr) or (opsign='<' and lexpr<rexpr) 
                                or (opsign='<>' and lexpr<>rexpr)   )
  open temp_export
    FETCH NEXT FROM temp_export
    INTO @lexpr,@opsign,@rexpr,@rexpr1,@rexpr1
WHILE @@FETCH_STATUS = 0
BEGIN
set   @revalue =@revalue+'表间校验公式:'+char(13)+@rexpr1+@opsign+@rexpr1+char(13)+@lexpr+@opsign+@rexpr+char(13)
    FETCH NEXT FROM temp_export
    INTO @lexpr,@opsign,@rexpr,@rexpr1,@rexpr1
end
CLOSE temp_export
DEALLOCATE temp_export
return
SET QUOTED_IDENTIFIER OFF 

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

