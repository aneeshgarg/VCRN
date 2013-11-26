package com.pioneers.vcrn.response;

import java.util.List;

import com.pioneers.vcrn.data.RehabTemplate;

/**
 *
 * @author Aneesh Garg
 * @since Nov 25, 2013
 */
public class RehabTemplateResponse extends BaseResponse {
    /**
     * 
     */
    private static final long serialVersionUID = -1708591553719766178L;
    
    private List<RehabTemplate> rehabTemplateList;

    public List<RehabTemplate> getRehabTemplateList() {
        return rehabTemplateList;
    }

    public void setRehabTemplateList(List<RehabTemplate> rehabTemplateList) {
        this.rehabTemplateList = rehabTemplateList;
    }

    @Override
    public String toString() {
        StringBuilder builder = new StringBuilder();
        builder.append("RehabTemplateResponse [rehabTemplateList=").append(rehabTemplateList).append("]");
        return builder.toString();
    }

}
