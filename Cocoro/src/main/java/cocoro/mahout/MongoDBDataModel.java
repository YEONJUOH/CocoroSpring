// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   MongoDBDataModel.java

package cocoro.mahout;

import com.google.common.base.Preconditions;
import com.mongodb.*;
import java.io.Serializable;
import java.net.UnknownHostException;
import java.text.*;
import java.util.*;
import java.util.concurrent.locks.ReentrantLock;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.apache.mahout.cf.taste.common.*;
import org.apache.mahout.cf.taste.impl.common.*;
import org.apache.mahout.cf.taste.impl.model.*;
import org.apache.mahout.cf.taste.model.DataModel;
import org.apache.mahout.cf.taste.model.PreferenceArray;
import org.bson.types.ObjectId;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public final class MongoDBDataModel
    implements DataModel
{

    public MongoDBDataModel()
        throws UnknownHostException, ParseException
    {
        mongoHost = "localhost";
        mongoPort = 27017;
        mongoDB = "recommender";
        mongoAuth = false;
        mongoUsername = "recommender";
        mongoPassword = "recommender";
        mongoCollection = "items";
        mongoMapCollection = "mongo_data_model_map";
        mongoManage = true;
        mongoUserID = "user_id";
        mongoItemID = "item_id";
        mongoPreference = "preference";
        mongoFinalRemove = false;
        dateFormat = DEFAULT_DATE_FORMAT;
        reloadLock = new ReentrantLock();
        buildModel();
    }

    public MongoDBDataModel(String host, int port, String database, String collection, boolean manage, boolean finalRemove, DateFormat format)
        throws UnknownHostException, ParseException
    {
        mongoHost = "localhost";
        mongoPort = 27017;
        mongoDB = "recommender";
        mongoAuth = false;
        mongoUsername = "recommender";
        mongoPassword = "recommender";
        mongoCollection = "items";
        mongoMapCollection = "mongo_data_model_map";
        mongoManage = true;
        mongoUserID = "user_id";
        mongoItemID = "item_id";
        mongoPreference = "preference";
        mongoFinalRemove = false;
        dateFormat = DEFAULT_DATE_FORMAT;
        mongoHost = host;
        mongoPort = port;
        mongoDB = database;
        mongoCollection = collection;
        mongoManage = manage;
        mongoFinalRemove = finalRemove;
        dateFormat = format;
        reloadLock = new ReentrantLock();
        buildModel();
    }

    public MongoDBDataModel(String host, int port, String database, String collection, boolean manage, boolean finalRemove, DateFormat format, 
            String userIDField, String itemIDField, String preferenceField, String mappingCollection)
        throws UnknownHostException, ParseException
    {
        mongoHost = "localhost";
        mongoPort = 27017;
        mongoDB = "recommender";
        mongoAuth = false;
        mongoUsername = "recommender";
        mongoPassword = "recommender";
        mongoCollection = "items";
        mongoMapCollection = "mongo_data_model_map";
        mongoManage = true;
        mongoUserID = "user_id";
        mongoItemID = "item_id";
        mongoPreference = "preference";
        mongoFinalRemove = false;
        dateFormat = DEFAULT_DATE_FORMAT;
        mongoHost = host;
        mongoPort = port;
        mongoDB = database;
        mongoCollection = collection;
        mongoManage = manage;
        mongoFinalRemove = finalRemove;
        dateFormat = format;
        mongoUserID = userIDField;
        mongoItemID = itemIDField;
        mongoPreference = preferenceField;
        mongoMapCollection = mappingCollection;
        reloadLock = new ReentrantLock();
        buildModel();
    }

    public MongoDBDataModel(String host, int port, String database, String collection, boolean manage, boolean finalRemove, DateFormat format, 
            String user, String password)
        throws UnknownHostException, ParseException
    {
        mongoHost = "localhost";
        mongoPort = 27017;
        mongoDB = "recommender";
        mongoAuth = false;
        mongoUsername = "recommender";
        mongoPassword = "recommender";
        mongoCollection = "items";
        mongoMapCollection = "mongo_data_model_map";
        mongoManage = true;
        mongoUserID = "user_id";
        mongoItemID = "item_id";
        mongoPreference = "preference";
        mongoFinalRemove = false;
        dateFormat = DEFAULT_DATE_FORMAT;
        mongoHost = host;
        mongoPort = port;
        mongoDB = database;
        mongoCollection = collection;
        mongoManage = manage;
        mongoFinalRemove = finalRemove;
        dateFormat = format;
        mongoAuth = true;
        mongoUsername = user;
        mongoPassword = password;
        reloadLock = new ReentrantLock();
        buildModel();
    }

    public MongoDBDataModel(String host, int port, String database, String collection, boolean manage, boolean finalRemove, DateFormat format, 
            String user, String password, String userIDField, String itemIDField, String preferenceField, String mappingCollection)
        throws UnknownHostException, ParseException
    {
        mongoHost = "localhost";
        mongoPort = 27017;
        mongoDB = "recommender";
        mongoAuth = false;
        mongoUsername = "recommender";
        mongoPassword = "recommender";
        mongoCollection = "items";
        mongoMapCollection = "mongo_data_model_map";
        mongoManage = true;
        mongoUserID = "user_id";
        mongoItemID = "item_id";
        mongoPreference = "preference";
        mongoFinalRemove = false;
        dateFormat = DEFAULT_DATE_FORMAT;
        mongoHost = host;
        mongoPort = port;
        mongoDB = database;
        mongoCollection = collection;
        mongoManage = manage;
        mongoFinalRemove = finalRemove;
        dateFormat = format;
        mongoAuth = true;
        mongoUsername = user;
        mongoPassword = password;
        mongoUserID = userIDField;
        mongoItemID = itemIDField;
        mongoPreference = preferenceField;
        mongoMapCollection = mappingCollection;
        reloadLock = new ReentrantLock();
        buildModel();
    }

    public void refreshData(String userID, Iterable items, boolean add)
        throws Exception
    {
        long id;
        checkData(userID, items, add);
        id = Long.parseLong(fromIdToLong(userID, true));
        List item;
        for(Iterator i$ = items.iterator(); i$.hasNext(); item.set(0, fromIdToLong((String)item.get(0), false)))
            item = (List)i$.next();

        if(add)
            _flddelegate = addUserItem(id, items);
        else
            _flddelegate = removeUserItem(id, items);
        reloadLock.unlock();

        Exception exception = null;
        reloadLock.unlock();
        throw exception;
    }

    public void refresh(Collection alreadyRefreshed)
    {
        BasicDBObject query = new BasicDBObject();
        query.put("deleted_at", new BasicDBObject("$gt", mongoTimestamp));
        DBCursor cursor = collection.find(query);
        Date ts = new Date(0L);
        do
        {
            if(!cursor.hasNext())
                break;
            Map user = cursor.next().toMap();
            String userID = getID(user.get(mongoUserID), true);
            Collection items = new ArrayList();
            List item = new ArrayList();
            item.add(getID(user.get(mongoItemID), false));
            item.add(Float.toString(getPreference(user.get(mongoPreference))));
            items.add(item);
            try
            {
                refreshData(userID, items, false);
            }
            catch(NoSuchUserException e)
            {
                log.warn("No such user ID: {}", userID);
            }
            catch(NoSuchItemException e)
            {
                log.warn("No such items: {}", items);
            } catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
            try {
				if(ts.compareTo(getDate(user.get("created_at"))) < 0)
				    ts = getDate(user.get("created_at"));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        } while(true);
        query = new BasicDBObject();
        query.put("created_at", new BasicDBObject("$gt", mongoTimestamp));
        cursor = collection.find(query);
        do
        {
            if(!cursor.hasNext())
                break;
            Map user = cursor.next().toMap();
            if(!user.containsKey("deleted_at"))
            {
                String userID = getID(user.get(mongoUserID), true);
                Collection items = new ArrayList();
                List item = new ArrayList();
                item.add(getID(user.get(mongoItemID), false));
                item.add(Float.toString(getPreference(user.get(mongoPreference))));
                items.add(item);
                try
                {
                    refreshData(userID, items, true);
                }
                catch(NoSuchUserException e)
                {
                    log.warn("No such user ID: {}", userID);
                }
                catch(NoSuchItemException e)
                {
                    log.warn("No such items: {}", items);
                } catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
                try {
					if(ts.compareTo(getDate(user.get("created_at"))) < 0)
					    ts = getDate(user.get("created_at"));
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
            }
        } while(true);
        if(mongoTimestamp.compareTo(ts) < 0)
            mongoTimestamp = ts;
    }

    public String fromIdToLong(String id, boolean isUser)
    {
        DBObject objectIdLong = collectionMap.findOne(new BasicDBObject("element_id", id));
        if(objectIdLong != null)
        {
            Map idLong = objectIdLong.toMap();
            Object value = idLong.get("long_value");
            return value != null ? value.toString() : null;
        } else
        {
            objectIdLong = new BasicDBObject();
            String longValue = Long.toString(idCounter++);
            objectIdLong.put("element_id", id);
            objectIdLong.put("long_value", longValue);
            collectionMap.insert(new DBObject[] {
                objectIdLong
            });
            log.info("Adding Translation {}: {} long_value: {}", new Object[] {
                isUser ? "User ID" : "Item ID", id, longValue
            });
            return longValue;
        }
    }

    public String fromLongToId(long id)
    {
        DBObject objectIdLong = collectionMap.findOne(new BasicDBObject("long_value", Long.toString(id)));
        Map idLong = objectIdLong.toMap();
        Object value = idLong.get("element_id");
        return value != null ? value.toString() : null;
    }

    public boolean isIDInModel(String ID)
    {
        DBObject objectIdLong = collectionMap.findOne(new BasicDBObject("element_id", ID));
        return objectIdLong != null;
    }

    public Date mongoUpdateDate()
    {
        return mongoTimestamp;
    }

    private void buildModel()
        throws UnknownHostException, ParseException
    {
        userIsObject = false;
        itemIsObject = false;
        
        idCounter = 0L;
        
        preferenceIsString = true;
        
        Mongo mongoDDBB = new Mongo(mongoHost, mongoPort);
        
        DB db = mongoDDBB.getDB(mongoDB);
        
        mongoTimestamp = new Date(0L);
        
        FastByIDMap userIDPrefMap = new FastByIDMap();
        
        if(!mongoAuth || db.authenticate(mongoUsername, mongoPassword.toCharArray()))
        {
        	
            collection = db.getCollection(mongoCollection);
            collectionMap = db.getCollection(mongoMapCollection);
            
            DBObject indexObj = new BasicDBObject();
            indexObj.put("element_id", Integer.valueOf(1));
            
            collectionMap.createIndex(indexObj);
            indexObj = new BasicDBObject();
            indexObj.put("long_value", Integer.valueOf(1));
            
            collectionMap.createIndex(indexObj);
            collectionMap.remove(new BasicDBObject());
            
            BasicDBObject searchinfo = new BasicDBObject();
            
            DBCursor cursor = collection.find(searchinfo);

            do
            {
                if(!cursor.hasNext())
                    break;
                
                Map user = cursor.next().toMap();
                long count=0;
                if(!user.containsKey("deleted_at"))
                {
                	
                    long userID = Long.parseLong(getID(user.get(mongoUserID), false));
                	//long userID = count++;
                    
                    long itemID = Long.parseLong(getID(user.get(mongoItemID), false));

                    
                    float ratingValue = getPreference(user.get(mongoPreference));
                    Collection userPrefs = (Collection)userIDPrefMap.get(userID);
                    if(userPrefs == null)
                    {
                        userPrefs = new ArrayList(2);
                        userIDPrefMap.put(userID, userPrefs);
                    }
                    userPrefs.add(new GenericPreference(userID, itemID, ratingValue));
                    if(user.containsKey("created_at") && mongoTimestamp.compareTo(getDate(user.get("created_at"))) < 0)
                        mongoTimestamp = getDate(user.get("created_at"));
                }
            } while(true);
        }
        _flddelegate = new GenericDataModel(GenericDataModel.toDataMap(userIDPrefMap, true));
    }

    private void removeMongoUserItem(String userID, String itemID)
    {
        String userId = fromLongToId(Long.parseLong(userID));
        String itemId = fromLongToId(Long.parseLong(itemID));
        if(isUserItemInDB(userId, itemId))
        {
            mongoTimestamp = new Date();
            BasicDBObject query = new BasicDBObject();
            query.put(mongoUserID, userIsObject ? ((Object) (new ObjectId(userId))) : ((Object) (userId)));
            query.put(mongoItemID, itemIsObject ? ((Object) (new ObjectId(itemId))) : ((Object) (itemId)));
            if(mongoFinalRemove)
            {
                log.info(collection.remove(query).toString());
            } else
            {
                BasicDBObject update = new BasicDBObject();
                update.put("$set", new BasicDBObject("deleted_at", mongoTimestamp));
                log.info(collection.update(query, update).toString());
            }
            log.info("Removing userID: {} itemID: {}", userID, itemId);
        }
    }

    private void addMongoUserItem(String userID, String itemID, String preferenceValue)
    {
        String userId = fromLongToId(Long.parseLong(userID));
        String itemId = fromLongToId(Long.parseLong(itemID));
        if(!isUserItemInDB(userId, itemId))
        {
            mongoTimestamp = new Date();
            BasicDBObject user = new BasicDBObject();
            Object userIdObject = userIsObject ? ((Object) (new ObjectId(userId))) : ((Object) (userId));
            Object itemIdObject = itemIsObject ? ((Object) (new ObjectId(itemId))) : ((Object) (itemId));
            user.put(mongoUserID, userIdObject);
            user.put(mongoItemID, itemIdObject);
            user.put(mongoPreference, preferenceIsString ? ((Object) (preferenceValue)) : ((Object) (Double.valueOf(Double.parseDouble(preferenceValue)))));
            user.put("created_at", mongoTimestamp);
            collection.insert(new DBObject[] {
                user
            });
            log.info("Adding userID: {} itemID: {} preferenceValue: {}", new Object[] {
                userID, itemID, preferenceValue
            });
        }
    }

    private boolean isUserItemInDB(String userID, String itemID)
    {
        BasicDBObject query = new BasicDBObject();
        Object userId = userIsObject ? ((Object) (new ObjectId(userID))) : ((Object) (userID));
        Object itemId = itemIsObject ? ((Object) (new ObjectId(itemID))) : ((Object) (itemID));
        query.put(mongoUserID, userId);
        query.put(mongoItemID, itemId);
        return collection.findOne(query) != null;
    }

    private DataModel removeUserItem(long userID, Iterable items)
    {
        FastByIDMap rawData = ((GenericDataModel)_flddelegate).getRawUserData();
        Iterator i$ = items.iterator();
        do
        {
            if(!i$.hasNext())
                break;
            List item = (List)i$.next();
            PreferenceArray prefs = (PreferenceArray)rawData.get(userID);
            long itemID = Long.parseLong((String)item.get(0));
            if(prefs != null)
            {
                boolean exists = false;
                int length = prefs.length();
                int i = 0;
                do
                {
                    if(i >= length)
                        break;
                    if(prefs.getItemID(i) == itemID)
                    {
                        exists = true;
                        break;
                    }
                    i++;
                } while(true);
                if(exists)
                {
                    rawData.remove(userID);
                    if(length > 1)
                    {
                        PreferenceArray newPrefs = new GenericUserPreferenceArray(length - 1);
                        int i1 = 0;
                        for(int j = 0; i1 < length; j++)
                        {
                            if(prefs.getItemID(i1) == itemID)
                                j--;
                            else
                                newPrefs.set(j, prefs.get(i1));
                            i1++;
                        }

                        rawData.put(userID, newPrefs);
                    }
                    log.info("Removing userID: {} itemID: {}", Long.valueOf(userID), Long.valueOf(itemID));
                    if(mongoManage)
                        removeMongoUserItem(Long.toString(userID), Long.toString(itemID));
                }
            }
        } while(true);
        return new GenericDataModel(rawData);
    }

    private DataModel addUserItem(long userID, Iterable items)
    {
        FastByIDMap rawData = ((GenericDataModel)_flddelegate).getRawUserData();
        PreferenceArray prefs = (PreferenceArray)rawData.get(userID);
        Iterator i$ = items.iterator();
        do
        {
            if(!i$.hasNext())
                break;
            List item = (List)i$.next();
            long itemID = Long.parseLong((String)item.get(0));
            float preferenceValue = Float.parseFloat((String)item.get(1));
            boolean exists = false;
            if(prefs != null)
            {
                int i = 0;
                do
                {
                    if(i >= prefs.length())
                        break;
                    if(prefs.getItemID(i) == itemID)
                    {
                        exists = true;
                        prefs.setValue(i, preferenceValue);
                        break;
                    }
                    i++;
                } while(true);
            }
            if(!exists)
            {
                if(prefs == null)
                {
                    prefs = new GenericUserPreferenceArray(1);
                } else
                {
                    PreferenceArray newPrefs = new GenericUserPreferenceArray(prefs.length() + 1);
                    int i = 0;
                    for(int j = 1; i < prefs.length(); j++)
                    {
                        newPrefs.set(j, prefs.get(i));
                        i++;
                    }

                    prefs = newPrefs;
                }
                prefs.setUserID(0, userID);
                prefs.setItemID(0, itemID);
                prefs.setValue(0, preferenceValue);
                log.info("Adding userID: {} itemID: {} preferenceValue: {}", new Object[] {
                    Long.valueOf(userID), Long.valueOf(itemID), Float.valueOf(preferenceValue)
                });
                rawData.put(userID, prefs);
                if(mongoManage)
                    addMongoUserItem(Long.toString(userID), Long.toString(itemID), Float.toString(preferenceValue));
            }
        } while(true);
        return new GenericDataModel(rawData);
    }

    private Date getDate(Object date) throws ParseException
    {
        if(date.getClass().getName().contains("Date"))
            return (Date)date;
       
        DateFormat dateformat = dateFormat;
        return dateFormat.parse(date.toString());
    }

    private float getPreference(Object value)
    {
        if(value != null)
        {
            if(value.getClass().getName().contains("String"))
            {
                preferenceIsString = true;
                return Float.parseFloat(value.toString());
            } else
            {
                preferenceIsString = false;
                return Double.valueOf(value.toString()).floatValue();
            }
        } else
        {
            return 0.5F;
        }
    }

    private String getID(Object id, boolean isUser)
    {
        if(id.getClass().getName().contains("ObjectId"))
        {
            if(isUser)
                userIsObject = true;
            else
                itemIsObject = true;
            return ((ObjectId)id).toStringMongod();
        } else
        {
            return id.toString();
        }
    }

    private void checkData(String userID, Iterable items, boolean add)
        throws NoSuchUserException, NoSuchItemException
    {
        Preconditions.checkNotNull(userID);
        Preconditions.checkNotNull(items);
        Preconditions.checkArgument(!userID.isEmpty(), "userID is empty");
        List item;
        for(Iterator i$ = items.iterator(); i$.hasNext(); Preconditions.checkArgument(!((String)item.get(0)).isEmpty(), "item is empty"))
        {
            item = (List)i$.next();
            Preconditions.checkNotNull(item.get(0));
        }

        if(userIsObject && !ID_PATTERN.matcher(userID).matches())
            throw new IllegalArgumentException();
        for(Iterator i$ = items.iterator(); i$.hasNext();)
        {
            List item1 = (List)i$.next();
            if(itemIsObject && !ID_PATTERN.matcher((CharSequence)item1.get(0)).matches())
                throw new IllegalArgumentException();
        }

        if(!add && !isIDInModel(userID))
            throw new NoSuchUserException();
        for(Iterator i$ = items.iterator(); i$.hasNext();)
        {
            List item1 = (List)i$.next();
            if(!add && !isIDInModel((String)item1.get(0)))
                throw new NoSuchItemException();
        }

    }

    public void cleanupMappingCollection()
    {
        collectionMap.drop();
    }

    public LongPrimitiveIterator getUserIDs()
        throws TasteException
    {
        return _flddelegate.getUserIDs();
    }

    public PreferenceArray getPreferencesFromUser(long id)
        throws TasteException
    {
        return _flddelegate.getPreferencesFromUser(id);
    }

    public FastIDSet getItemIDsFromUser(long userID)
        throws TasteException
    {
        return _flddelegate.getItemIDsFromUser(userID);
    }

    public LongPrimitiveIterator getItemIDs()
        throws TasteException
    {
        return _flddelegate.getItemIDs();
    }

    public PreferenceArray getPreferencesForItem(long itemID)
        throws TasteException
    {
        return _flddelegate.getPreferencesForItem(itemID);
    }

    public Float getPreferenceValue(long userID, long itemID)
        throws TasteException
    {
        return _flddelegate.getPreferenceValue(userID, itemID);
    }

    public Long getPreferenceTime(long userID, long itemID)
        throws TasteException
    {
        return _flddelegate.getPreferenceTime(userID, itemID);
    }

    public int getNumItems()
        throws TasteException
    {
        return _flddelegate.getNumItems();
    }

    public int getNumUsers()
        throws TasteException
    {
        return _flddelegate.getNumUsers();
    }

    public int getNumUsersWithPreferenceFor(long itemID)
        throws TasteException
    {
        return _flddelegate.getNumUsersWithPreferenceFor(itemID);
    }

    public int getNumUsersWithPreferenceFor(long itemID1, long itemID2)
        throws TasteException
    {
        return _flddelegate.getNumUsersWithPreferenceFor(itemID1, itemID2);
    }

    public void setPreference(long userID, long itemID, float value)
    {
        throw new UnsupportedOperationException();
    }

    public void removePreference(long userID, long itemID)
    {
        throw new UnsupportedOperationException();
    }

    public boolean hasPreferenceValues()
    {
        return _flddelegate.hasPreferenceValues();
    }

    public float getMaxPreference()
    {
        return _flddelegate.getMaxPreference();
    }

    public float getMinPreference()
    {
        return _flddelegate.getMinPreference();
    }

    public String toString()
    {
        return "MongoDBDataModel";
    }

    private static final Logger log = LoggerFactory.getLogger(org.apache.mahout.cf.taste.impl.model.mongodb.MongoDBDataModel.class);
    private static final String DEFAULT_MONGO_HOST = "localhost";
    private static final int DEFAULT_MONGO_PORT = 27017;
    private static final String DEFAULT_MONGO_DB = "recommender";
    private static final boolean DEFAULT_MONGO_AUTH = false;
    private static final String DEFAULT_MONGO_USERNAME = "recommender";
    private static final String DEFAULT_MONGO_PASSWORD = "recommender";
    private static final String DEFAULT_MONGO_COLLECTION = "items";
    private static final boolean DEFAULT_MONGO_MANAGE = true;
    private static final String DEFAULT_MONGO_USER_ID = "user_id";
    private static final String DEFAULT_MONGO_ITEM_ID = "item_id";
    private static final String DEFAULT_MONGO_PREFERENCE = "preference";
    private static final boolean DEFAULT_MONGO_FINAL_REMOVE = false;
    private static final DateFormat DEFAULT_DATE_FORMAT;
    public static final String DEFAULT_MONGO_MAP_COLLECTION = "mongo_data_model_map";
    private static final Pattern ID_PATTERN = Pattern.compile("[a-f0-9]{24}");
    private String mongoHost;
    private int mongoPort;
    private String mongoDB;
    private boolean mongoAuth;
    private String mongoUsername;
    private String mongoPassword;
    private String mongoCollection;
    private String mongoMapCollection;
    private boolean mongoManage;
    private String mongoUserID;
    private String mongoItemID;
    private String mongoPreference;
    private boolean mongoFinalRemove;
    private DateFormat dateFormat;
    private DBCollection collection;
    private DBCollection collectionMap;
    private Date mongoTimestamp;
    private final ReentrantLock reloadLock;
    private DataModel _flddelegate;
    private boolean userIsObject;
    private boolean itemIsObject;
    private boolean preferenceIsString;
    private long idCounter;

    static 
    {
        DEFAULT_DATE_FORMAT = new SimpleDateFormat("EE MMM dd yyyy HH:mm:ss 'GMT'Z (zzz)", Locale.ENGLISH);
    }
}
