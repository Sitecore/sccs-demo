//---------------------------------------------------------------------
// <copyright file="ProductItemResolver.cs" company="Sitecore Corporation">
//     Copyright (c) Sitecore Corporation 1999-2015
// </copyright>
// <summary>The product item resolver</summary>
//---------------------------------------------------------------------
// Copyright 2015 Sitecore Corporation A/S
// Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file 
// except in compliance with the License. You may obtain a copy of the License at
//       http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software distributed under the 
// License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, 
// either express or implied. See the License for the specific language governing permissions 
// and limitations under the License.
// -------------------------------------------------------------------------------------------

namespace Sitecore.Reference.Storefront.SitecorePipelines
{
    using System.Web;
    using System.Web.Routing;
    using Sitecore.Data;
    using Sitecore.Pipelines;
    using Sitecore.Web;
    using Sitecore.Reference.Storefront.Models;
    using Sitecore.Commerce.Connect.CommerceServer;
    using Sitecore.Commerce.Connect.CommerceServer.Caching;
    using Sitecore.Reference.Storefront.Managers;
    using System.Collections.Generic;
    using Analytics;
    using System.Linq;

    /// <summary>
    /// Class representing a ProductItemResolver
    /// </summary>
    public class TrackUserPatternCardMatchingProcessor
    {
        /// <summary>
        /// Runs the processor.
        /// </summary>
        /// <param name="args">The args.</param>
        public virtual void Process(PipelineArgs args)
        {
            if (Context.Item != null)
            {
                return;
            }

            if (Context.User.IsAuthenticated && Tracker.Current != null)
            {
                string existingList = GetExistingMatchedPatternCards();
                string newList = GetNewMatchedPatternCard(existingList);
                SaveMatchedPatternCard(existingList, newList);
            }
        }

        private static string GetExistingMatchedPatternCards()
        {
            string existingMatchedPatternCardList = string.Empty;
            if (Context.User.Profile.GetPropertyValue("matched_pattern_cards") != null)
            {
                existingMatchedPatternCardList = Context.User.Profile.GetPropertyValue("matched_pattern_cards").ToString();
            }

            return existingMatchedPatternCardList;
        }

        private static string GetNewMatchedPatternCard(string existingMatchedPatternCardList)
        {
            string newMatchedPatternCardList = string.Empty;
            foreach (var profileName in Tracker.Current.Interaction.Profiles.GetProfileNames())
            {
                var userPattern = Tracker.Current.Interaction.Profiles[profileName];
                if (userPattern != null && userPattern.Count > 0)
                {
                    var newMatchedPatternCard = "[" + userPattern.ProfileName + "." + userPattern.PatternLabel + "]";

                    if (!existingMatchedPatternCardList.Contains(newMatchedPatternCard)
                        && !newMatchedPatternCardList.Contains(newMatchedPatternCard))
                    {
                        newMatchedPatternCardList += newMatchedPatternCard;
                    }
                }
            }

            return newMatchedPatternCardList;
        }

        private static void SaveMatchedPatternCard(string existingMatchedPatternCardList, string newMatchedPatternCardList)
        {
            if (!string.IsNullOrEmpty(newMatchedPatternCardList))
            {
                Context.User.Profile.SetPropertyValue("matched_pattern_cards", existingMatchedPatternCardList + newMatchedPatternCardList);
                Context.User.Profile.Save();
            }
        }
    }
}